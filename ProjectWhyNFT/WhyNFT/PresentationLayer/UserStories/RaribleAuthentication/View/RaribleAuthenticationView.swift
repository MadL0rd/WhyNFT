//
//  RaribleAuthenticationView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class RaribleAuthenticationView: UIView {
    
    let backgroundView = UIView()
    
    let topTextImage = UIImageView(image: R.image.raribleAuthenticationImagePlaceholder())
    
    let stack = UIStackView()
    let linkButton = ButtonWithTouchSize()
    let userIdTextField = UITextField()
    let signInButton = ButtonWithTouchSize()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func manageSignInButtonVisibility(hidden: Bool) {
        UIView.animate(withDuration: 0.4) { [ weak self ] in
            self?.signInButton.isHidden = hidden
            self?.signInButton.alpha = hidden ? 0 : 1
        }
    }

    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .res.background()
        
        backgroundView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        
        stack.addArrangedSubview(linkButton)
        UIStyleManager.buttonPrimary(linkButton)
        linkButton.backgroundColor = .res.backgroundInput()
        linkButton.setTitleColor(.res.tintMain(), for: .normal)
        linkButton.setTitleColor(.res.tintMain(), for: .selected)
        linkButton.setTitleColor(.res.tintMain(), for: .highlighted)
        linkButton.setTitle(R.string.localizable.raribleAuthenticationLinkButton(), for: .normal)
        
        stack.addArrangedSubview(userIdTextField)
        UIStyleManager.textFieldDefault(textField: userIdTextField, placeholderText: R.string.localizable.raribleAuthenticationInputPlaceholder())
        
        stack.addArrangedSubview(signInButton)
        UIStyleManager.buttonPrimary(signInButton)
        signInButton.setTitle(R.string.localizable.raribleAuthenticationSignInButton(), for: .normal)
        signInButton.isHidden = true
        
        backgroundView.addSubview(topTextImage)
        topTextImage.translatesAutoresizingMaskIntoConstraints = false
        topTextImage.contentMode = .scaleAspectFill
        
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),

            stack.bottomAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            stack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -48),
            
            topTextImage.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -30),
            topTextImage.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            topTextImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            topTextImage.widthAnchor.constraint(equalTo: backgroundView.widthAnchor)
        ])
    }
}
