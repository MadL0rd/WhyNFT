//
//  AuthenticationView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class AuthenticationView: UIView {
    
    let logo = UIImageView()
    let signInDribbleButton = ButtonWithTouchSize()

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
        backgroundColor = R.color.background()
        
        addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.image = R.image.launchLogo()
        
        addSubview(signInDribbleButton)
        UIStyleManager.buttonDefault(signInDribbleButton)
        signInDribbleButton.setTitle(R.string.localizable.signInDribbbleButtonText(), for: .normal)

        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            logo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            signInDribbleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInDribbleButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            signInDribbleButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -6)
        ])
    }
}
