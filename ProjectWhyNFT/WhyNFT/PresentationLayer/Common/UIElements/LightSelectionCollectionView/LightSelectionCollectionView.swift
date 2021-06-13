//
//  LightSelectionCollectionView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

class LightSelectionCollectionView: UIView {
    
    // MARK: - Layout constants
    
    let sideMargin: CGFloat = 24
    
    let cellSpacing: CGFloat = 12
    var cellHeight: CGFloat {
        return cellWidth * 0.75
    }
    var cellWidth: CGFloat {
        return (UIConstants.screenBounds.width - sideMargin * 2 - cellSpacing) / 2
    }
    
    // MARK: - UIViews
    
    let collectionViewLayout = UICollectionViewFlowLayout()
    private(set) var collectionView: UICollectionView!
    
    var selectionBorderedView = UIView()
    var selectionGlow = UIImageView(image: R.image.glow())
    
    // MARK: - Variables
    
    weak var delegate: LightSelectionCollectionViewDelegate?
    
    var currentSelectedIndexPath: IndexPath? {
        didSet {
            delegate?.lightSelectionCollectionView(self, selectedItemDidChanged: currentSelectedIndexPath?.row)
        }
    }
    var currentSelectedIndex: Int? {
        return currentSelectedIndexPath?.row
    }
    
    var longPressHandlerAvailable = true
    var longPressVibration: UIImpactFeedbackGenerator? = VibroGenerator.heavy
    var longPressSelectedIndexPath: IndexPath?
    
    // MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func startGlowAnimation() {
        UIView.transition(with: selectionGlow,
                          duration: 0.7,
                          options: [.autoreverse, .repeat]) { [ weak self ] in
            self?.selectionGlow.transform = .init(scaleX: 1.3, y: 1.3)
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    // MARK: - Private methods
    
    private func spawnSelectionView(withCenterIn centerView: UIView) {
        selectionBorderedView.removeFromSuperview()
        selectionBorderedView.alpha = 0
        NSLayoutConstraint.deactivate(selectionBorderedView.constraints)
        
        collectionView.insertSubview(selectionBorderedView, at: 0)
        selectionBorderedView.center = centerView.center
        NSLayoutConstraint.activate([
            selectionBorderedView.heightAnchor.constraint(equalToConstant: cellHeight + 12),
            selectionBorderedView.widthAnchor.constraint(equalToConstant: cellWidth + 12),
            selectionBorderedView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            selectionBorderedView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor)
        ])
        
        UIView.animate(withDuration: 0.3) { [ weak self ] in
            self?.selectionBorderedView.alpha = 1
            self?.layoutIfNeeded()
        }
        
        startGlowAnimation()
    }
    
    private func removeSelectionView() {
        UIView.animate(withDuration: 0.3) { [ weak self ] in
            self?.selectionBorderedView.alpha = 0
        }
    }
    
    private func moveSelectionView(withCenterIn centerView: UIView) {
        selectionBorderedView.removeFromSuperview()
        NSLayoutConstraint.deactivate(selectionBorderedView.constraints)
        
        collectionView.insertSubview(selectionBorderedView, at: 0)
        NSLayoutConstraint.activate([
            selectionBorderedView.heightAnchor.constraint(equalToConstant: cellHeight + 12),
            selectionBorderedView.widthAnchor.constraint(equalToConstant: cellWidth + 12),
            selectionBorderedView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            selectionBorderedView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor)
        ])
        
        UIView.animate(withDuration: 0.3) { [ weak self ] in
            self?.layoutIfNeeded()
        }
        
        startGlowAnimation()
    }
    
    // MARK: - UI elements actions

    @objc private func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        guard longPressHandlerAvailable
        else { return }
        
        let pressPoint = gestureRecognizer.location(in: collectionView)

        if let indexPath = collectionView.indexPathForItem(at: pressPoint) {
            if indexPath != longPressSelectedIndexPath {
                longPressVibration?.impactOccurred()
                
                if let previousIndexPath = longPressSelectedIndexPath,
                   let cell = collectionView.cellForItem(at: previousIndexPath) {
                    UIView.animate(withDuration: 0.3) {
                        cell.transform = .init(scaleX: 1, y: 1)
                    }
                }
                
                longPressSelectedIndexPath = indexPath
                
                if let cell = collectionView.cellForItem(at: indexPath) {
                    UIView.animate(withDuration: 0.3) {
                        cell.transform = .init(scaleX: 1.1, y: 1.1)
                    }
                }
            }
        } else {
            if let previousIndexPath = longPressSelectedIndexPath,
               let cell = collectionView.cellForItem(at: previousIndexPath) {
                UIView.animate(withDuration: 0.3) {
                    cell.transform = .init(scaleX: 1, y: 1)
                }
                longPressSelectedIndexPath = nil
            }
        }
        
        if gestureRecognizer.state == .ended,
           let previousIndexPath = longPressSelectedIndexPath,
           let cell = collectionView.cellForItem(at: previousIndexPath) {
            UIView.animate(withDuration: 0.3) {
                cell.transform = .init(scaleX: 1, y: 1)
            }
            delegate?.lightSelectionCollectionView(self, itemLongPress: previousIndexPath.row)
            longPressSelectedIndexPath = nil
        }
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        
        setupCollection()
        setupSelection()
        
        makeConstraints()
    }
    
    private func setupSelection() {
        selectionBorderedView.translatesAutoresizingMaskIntoConstraints = false
        selectionBorderedView.backgroundColor = .clear
        selectionBorderedView.layer.cornerRadius = 17
        selectionBorderedView.layer.borderWidth = 2
        selectionBorderedView.layer.borderColor = R.color.tintMain()?.cgColor
        selectionBorderedView.alpha = 0
        
        selectionBorderedView.addSubview(selectionGlow)
        selectionGlow.contentMode = .scaleAspectFill
        selectionGlow.center = selectionBorderedView.center
        let glowSide = cellWidth * 1.6
        selectionGlow.frame = CGRect(x: (cellWidth + 12 - glowSide) / 2,
                                     y: (cellHeight + 12 - glowSide) / 2,
                                     width: glowSide,
                                     height: glowSide)
    }
    
    private func setupCollection() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionViewLayout.minimumLineSpacing = cellSpacing
        collectionViewLayout.minimumInteritemSpacing = cellSpacing
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 70, left: 5, bottom: UIConstants.customTabBarHeight, right: 0)
        collectionView.contentInset = UIEdgeInsets(top: sideMargin,
                                                   left: 0,
                                                   bottom: UIConstants.customTabBarHeight,
                                                   right: 0)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LightSelectionCollectionViewCell.self, forCellWithReuseIdentifier: LightSelectionCollectionViewCell.identifier)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        longPress.minimumPressDuration = 0.5
        longPress.delaysTouchesBegan = true
        self.collectionView?.addGestureRecognizer(longPress)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: sideMargin),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -sideMargin),
            
            selectionGlow.widthAnchor.constraint(equalToConstant: cellWidth * 1.5),
            selectionGlow.heightAnchor.constraint(equalToConstant: cellWidth * 1.5)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension LightSelectionCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.lightSelectionCollectionView(self, numberOfItemsInSection: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LightSelectionCollectionViewCell.identifier, for: indexPath) as! LightSelectionCollectionViewCell
        
        cell.setContent(content: delegate?.lightSelectionCollectionView(self, contentForItem: indexPath.row))
        if delegate?.lightSelectionCollectionView(self, isItemSelectionAvailable: indexPath.row) == true {
            if currentSelectedIndexPath == indexPath {
                cell.setState(state: .selected, animated: true)
            } else {
                cell.setState(state: .available, animated: true)
            }
        } else {
            cell.setState(state: .blocked, animated: true)
        }
        
        return cell
    }
}
// MARK: - UICollectionViewDelegate

extension LightSelectionCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? LightSelectionCollectionViewCell
        else { return }
        
        delegate?.lightSelectionCollectionView(self, itemDidTapped: indexPath.row)
        
        guard cell.state != .blocked
        else {
            cell.shake()
            VibroGenerator.light.impactOccurred()
            return
        }
        
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        
        if let currentSelectedIndexPath = currentSelectedIndexPath {
            
            let previousSelectedCell = collectionView.cellForItem(at: currentSelectedIndexPath) as? LightSelectionCollectionViewCell
            previousSelectedCell?.setState(state: .available, animated: true)
            
            if currentSelectedIndexPath != indexPath {
                moveSelectionView(withCenterIn: cell)
                cell.setState(state: .selected, animated: true)
                
                self.currentSelectedIndexPath = indexPath
            } else {
                removeSelectionView()
                self.currentSelectedIndexPath = nil
            }
            
        } else {
            spawnSelectionView(withCenterIn: cell)
            currentSelectedIndexPath = indexPath
            cell.setState(state: .selected, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastSectionIndex = collectionView.numberOfSections - 1
        let lastItemIndex = collectionView.numberOfItems(inSection: lastSectionIndex) - 1
        if indexPath.section == lastSectionIndex
            && indexPath.row == lastItemIndex {
            delegate?.lightSelectionCollectionView(didScrolledToLastItem: self)
        }
    }
}
