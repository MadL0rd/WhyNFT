//
//  LightSelectionCollectionViewCell.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

enum LightSelectionCollectionViewCellState {
    case blocked
    case available
    case selected
}

enum LightSelectionCollectionViewCellContent {
    case artWork(content: ArtWork)
    case menuItem(content: LightSelectionCollectionMenuItem)
}

class LightSelectionCollectionViewCell: UICollectionViewCell {
    
    let fullCellImageView = UIImageView()
    let menuTitle = UILabel()
    let menuImageView = UIImageView()
    
    let blockedColor = R.color.tintGray()
    let availableColor = R.color.tintLight()
    let selectedColor = R.color.tintMain()
    
    private(set) var state: LightSelectionCollectionViewCellState?
    var stateColor: UIColor? {
        guard let state = state
        else { return nil }
        switch state {
        case .blocked:
            return blockedColor
        case .available:
            return availableColor
        case .selected:
            return selectedColor
        }
    }

    static var identifier: String {
        String(describing: self)
    }
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setContent(content: LightSelectionCollectionViewCellContent?) {
        guard let content = content
        else { return }
        
        hideContentPlaceholders()
        
        switch content {
        case .artWork(content: let content):
            fullCellImageView.isHidden = false
            fullCellImageView.image = nil
            if let url = content.artPreviewUrl {
                fullCellImageView.setDefaultLoadingInicator()
                fullCellImageView.sd_setImage(with: url, placeholderImage: fullCellImageView.image)
            }
            
        case .menuItem(content: let content):
            menuTitle.text = content.title
            menuImageView.image = content.image
            
            menuTitle.isHidden = false
            menuImageView.isHidden = false
        }
    }
    
    func setState(state: LightSelectionCollectionViewCellState, animated: Bool) {
        self.state = state
        guard let stateColor = stateColor
        else { return }
        
        let action = { [ weak self ] in
            self?.menuTitle.textColor = stateColor
            self?.menuImageView.tintColor = stateColor
        }
        
        if animated {
            UIView.transition(with: self,
                              duration: 0.3,
                              options: [.transitionCrossDissolve],
                              animations: action)
        } else {
            action()
        }
    }
    
    // MARK: - Private setup methods
    
    private func hideContentPlaceholders() {
        fullCellImageView.isHidden = true
        menuTitle.isHidden = true
        menuImageView.isHidden = true
    }
    
    private func setupView() {
        layer.cornerRadius = 12
        backgroundColor = .res.backgroundInput()
        layer.masksToBounds = true
        
        contentView.addSubview(fullCellImageView)
        fullCellImageView.translatesAutoresizingMaskIntoConstraints = false
        fullCellImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(menuImageView)
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.contentMode = .scaleAspectFit
        
        addSubview(menuTitle)
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        menuTitle.font = R.font.alataRegular(size: 16)
        menuTitle.numberOfLines = 2
        menuTitle.textAlignment = .center
                
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            fullCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            fullCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            fullCellImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            fullCellImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            menuImageView.heightAnchor.constraint(equalToConstant: 36),
            menuImageView.widthAnchor.constraint(equalToConstant: 36),
            menuImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuImageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 6),
            
            menuTitle.widthAnchor.constraint(equalTo: widthAnchor, constant: -24),
            menuTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 32)
        ])
    }
}

