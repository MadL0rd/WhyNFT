//
//  AuthenticationViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class AuthenticationViewController: UIViewController {

    var viewModel: AuthenticationViewModelProtocol!
    var coordinator: AuthenticationCoordinatorProtocol!
    
    private var _view: AuthenticationView {
        return view as! AuthenticationView
    }

    override func loadView() {
        self.view = AuthenticationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.signInDribbbleButton.addTarget(self, action: #selector(signInDribbbleButtonDidTapped(sender:)), for: .touchUpInside)
    }
    
    // MARK: - UI elements actions

    @objc private func signInDribbbleButtonDidTapped(sender: UIButton) {
        sender.tapAnimation()
        VibroGenerator.light.impactOccurred()
        
        viewModel.signInWithDribbble()
    }
}
