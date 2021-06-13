//
//  UIStyleManager.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

import UIKit

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
    
    static func buttonDefault(_ button: ButtonWithTouchSize) {
        button.setDefaultAreaPadding()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = R.color.tintMain()
        button.layer.cornerRadius = 16
        button.titleLabel?.font = R.font.alataRegular(size: 14)
        button.setTitleColor(.res.tintDark(), for: .normal)
        button.setTitleColor(.res.tintDark(), for: .selected)
        button.setTitleColor(.res.tintDark(), for: .highlighted)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
}
