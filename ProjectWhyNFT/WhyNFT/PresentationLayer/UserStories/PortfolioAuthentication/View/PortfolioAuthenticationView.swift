//
//  PortfolioAuthenticationView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class PortfolioAuthenticationView: UIView {
    
    let titleBackground = UIView()
    let titlesView = DoubleTitledView()
    
    let itemsCollection = LightSelectionCollectionView()

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
        itemsCollection.selectedViewIsHidden = true
        
        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.setTitles(title: R.string.localizable.portfolioAuthenticationTitle(),
                             subtitle: R.string.localizable.portfolioAuthenticationSubtitle())

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
