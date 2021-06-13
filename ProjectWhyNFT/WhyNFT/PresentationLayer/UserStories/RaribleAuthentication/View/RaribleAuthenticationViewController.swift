//
//  RaribleAuthenticationViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class RaribleAuthenticationViewController: UIViewController {

    var viewModel: RaribleAuthenticationViewModelProtocol!
    var coordinator: RaribleAuthenticationCoordinatorProtocol!
    
    private var _view: RaribleAuthenticationView {
        return view as! RaribleAuthenticationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    override func loadView() {
        self.view = RaribleAuthenticationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.userIdTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        _view.linkButton.addTarget(self, action: #selector(linkButtonDidTapped(sender:)), for: .touchUpInside)
        _view.signInButton.addTarget(self, action: #selector(signInButtonDidTapped(sender:)), for: .touchUpInside)
        
        addKeyboardObserver(selector: #selector(keyboardNotification(notification:)))
        addTapGestureToHideKeyboardCustom()
    }
    
    func addTapGestureToHideKeyboardCustom(to view: UIView? = nil) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardCustom(_:)))
        if let view = view {
            view.addGestureRecognizer(tapGesture)
        } else {
            self.view.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func dismissKeyboardCustom(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        UIView.animate(withDuration: 0.4) { [ weak self ] in
            self?._view.backgroundView.transform = .init(translationX: 0, y: 0)
        }
    }
    
    // MARK: - UI elements actions

    @objc private func linkButtonDidTapped(sender: UIButton) {
        sender.tapAnimation()
        viewModel.openRaribleLink()
    }
    
    @objc private func signInButtonDidTapped(sender: UIButton) {
        guard let text = _view.userIdTextField.text,
              text.isNotEmpty
        else { return }
        
        sender.tapAnimation()
        viewModel.saveWallet(userId: text)
        
        coordinator.openModule(.loading, openingMode: .showInNewRootNavigationStack)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text,
           text.isNotEmpty {
            _view.manageSignInButtonVisibility(hidden: false)
        } else {
            _view.manageSignInButtonVisibility(hidden: true)
        }
    }
}

// MARK: - Keyboard

extension RaribleAuthenticationViewController {
    
    @objc private func keyboardNotification(notification: NSNotification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
                
        UIView.animate(withDuration: 0.3) { [ weak self ] in
            self?._view.backgroundView.transform = .init(translationX: 0, y: -keyboardHeight)
        }
    }
}
