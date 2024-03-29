//
//  UIStyleManager.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

import UIKit
import JGProgressHUD

class UIStyleManager {
    
    // MARK: - UIView
    
    static func textDefaultInput(_ view: UIView, addHeightConstraint: Bool = true) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.backgroundInput()
        view.layer.borderWidth = 1
        view.layer.borderColor = R.color.tintMain()?.cgColor

        guard addHeightConstraint
        else { return }
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    static func shadow(_ view: UIView) {
        view.layer.shadowColor = R.color.tintGray()?.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    static func defaultBorder(_ view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = R.color.tintMain()?.cgColor
        view.layer.cornerRadius = 16
    }
    
    // MARK: - UINavigationController
    
    static func navigationControllerTransparent(_ controller: UINavigationController) {
        controller.view.backgroundColor = .clear
        controller.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        controller.navigationBar.shadowImage = UIImage()
        controller.navigationBar.isTranslucent = true
        
        controller.navigationBar.barStyle = .black
        controller.navigationBar.tintColor = R.color.tintMain()
        controller.navigationBar.topItem?.backButtonTitle = ""
    }
    
    // MARK: - UITextField
    
    static func textFieldDefault(textField: UITextField, placeholderText: String) {
        textDefaultInput(textField)
        textField.font = R.font.alataRegular(size: 16)
        textField.setLeftPaddingPoints(24)
        textField.setRightPaddingPoints(24)
        textField.textColor = .res.tintLight()
        textField.tintColor = .res.tintMain()

        let attributes = [
            NSAttributedString.Key.foregroundColor: R.color.tintGray()!,
            NSAttributedString.Key.font: R.font.alataRegular(size: 14)!
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                             attributes: attributes)
    }
    
    // MARK: - Buttons
    
    static func buttonPrimary(_ button: ButtonWithTouchSize) {
        button.setDefaultAreaPadding()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = R.color.tintMain()
        button.layer.cornerRadius = 12
        button.titleLabel?.font = R.font.alataRegular(size: 14)
        button.setTitleColor(.res.tintDark(), for: .normal)
        button.setTitleColor(.res.tintDark(), for: .selected)
        button.setTitleColor(.res.tintDark(), for: .highlighted)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    static func buttonSecondary(_ button: ButtonWithTouchSize) {
        button.setDefaultAreaPadding()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = R.color.backgroundInput()
        button.layer.borderWidth = 1
        button.layer.borderColor = R.color.tintMain()?.cgColor
        button.layer.cornerRadius = 16
        button.titleLabel?.font = R.font.alataRegular(size: 14)
        button.setTitleColor(.res.tintMain(), for: .normal)
        button.setTitleColor(.res.tintMain(), for: .selected)
        button.setTitleColor(.res.tintMain(), for: .highlighted)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    // MARK: - HUD style
    
    static func hudDefault(hud: JGProgressHUD) {
        hud.backgroundColor = .res.background()?.withAlphaComponent(0.5)

        hud.indicatorView?.tintColor = .res.tintMain()
        hud.textLabel.textColor = .res.tintMain()
        hud.detailTextLabel.textColor = .res.tintMain()
        hud.textLabel.font = .res.alataRegular(size: 16)
        hud.detailTextLabel.font = .res.alataRegular(size: 12)
        
        hud.indicatorView?.get(all: UIActivityIndicatorView.self).forEach { $0.color = .res.tintMain() }
        
        hud.contentView.backgroundColor = .res.backgroundInput()
        hud.contentView.layer.cornerRadius = 12
        hud.contentView.layer.masksToBounds = true
        hud.contentView.layer.borderColor = UIColor.res.tintMain()?.cgColor
        hud.contentView.layer.borderWidth = 1
        
        let glow = GlowView()
        glow.translatesAutoresizingMaskIntoConstraints = false
        hud.insertSubview(glow, at: 0)
        NSLayoutConstraint.activate([
            glow.centerYAnchor.constraint(equalTo: hud.contentView.centerYAnchor),
            glow.centerXAnchor.constraint(equalTo: hud.contentView.centerXAnchor),
            glow.widthAnchor.constraint(equalTo: hud.contentView.widthAnchor, multiplier: 1.5),
            glow.heightAnchor.constraint(equalTo: hud.contentView.heightAnchor, multiplier: 1.5)
        ])
        glow.startAnimation()
        
        if let progressIndicatior = hud.indicatorView as? JGProgressHUDPieIndicatorView {
            progressIndicatior.color = .res.tintMain()!
            progressIndicatior.fillColor = .res.tintMain()!.withAlphaComponent(0.3)
        }
    }
}
