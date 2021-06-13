//
//  WorksView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class WorksView: UIView {
    
    let titleBackground = UIView()
    let titlesView = DoubleTitledView()
    
    let itemsCollection = LightSelectionCollectionView()
    let refreshControl = UIRefreshControl()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func resetMixedFontLabelsText() {
        titlesView.titleLabel.setMixedFontText(R.string.localizable.addNewItem())
    }

    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        addSubview(itemsCollection)
        itemsCollection.translatesAutoresizingMaskIntoConstraints = false
        itemsCollection.collectionView.contentInset = UIEdgeInsets(top: 100,
                                                                   left: 0,
                                                                   bottom: UIConstants.customTabBarHeight,
                                                                   right: 0)
        refreshControl.tintColor = .res.tintMain()
        itemsCollection.collectionView.refreshControl = refreshControl
        
        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.subtitleLabel.text = R.string.localizable.addNewItemSubtitle()
        
        resetMixedFontLabelsText()
        
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titlesView.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.statusBarHeight + 24),
            titlesView.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            titlesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: topAnchor),
            titleBackground.leftAnchor.constraint(equalTo: leftAnchor),
            titleBackground.rightAnchor.constraint(equalTo: rightAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: titlesView.bottomAnchor, constant: 24),
            
            itemsCollection.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.statusBarHeight),
            itemsCollection.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemsCollection.widthAnchor.constraint(equalTo: widthAnchor),
            itemsCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
