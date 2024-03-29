//
//  AboutUsView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class AboutUsView: UIView {
    
    let titleBackground = UIView()
    let titlesView = DoubleTitledView()
    let textImage = UIImageView(image: R.image.aboutUsImageText())

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

        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.setTitles(title: R.string.localizable.aboutUsTitle(),
                             subtitle: nil)
        
        addSubview(textImage)
        textImage.translatesAutoresizingMaskIntoConstraints = false
        textImage.contentMode = .scaleAspectFill

        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titlesView.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.navigationBarHeight + 24),
            titlesView.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            titlesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: topAnchor),
            titleBackground.leftAnchor.constraint(equalTo: leftAnchor),
            titleBackground.rightAnchor.constraint(equalTo: rightAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: titlesView.bottomAnchor, constant: 24),
            
            textImage.topAnchor.constraint(equalTo: titlesView.bottomAnchor, constant: 32),
            textImage.widthAnchor.constraint(equalTo: widthAnchor),
            textImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
