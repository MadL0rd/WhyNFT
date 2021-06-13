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
    
    let hiddableButton = HiddableButton()
    var selectButton: UIButton {
        hiddableButton.button
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }

    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        addSubview(itemsCollection)
        itemsCollection.translatesAutoresizingMaskIntoConstraints = false
        itemsCollection.longPressHandlerAvailable = true
        
        refreshControl.tintColor = .res.tintMain()
        itemsCollection.collectionView.refreshControl = refreshControl
        
        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.setTitles(title: R.string.localizable.addNewItem(),
                             subtitle: R.string.localizable.addNewItemSubtitle())
        
        addSubview(hiddableButton)
        hiddableButton.translatesAutoresizingMaskIntoConstraints = false
                
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
            itemsCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            hiddableButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            hiddableButton.widthAnchor.constraint(equalTo: widthAnchor),
            hiddableButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
}
