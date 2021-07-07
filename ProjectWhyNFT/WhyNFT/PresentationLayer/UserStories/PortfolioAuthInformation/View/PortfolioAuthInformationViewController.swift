//
//  PortfolioAuthInformationViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 07.07.2021.
//

import UIKit

final class PortfolioAuthInformationViewController: AlertPresentationViewController {

    var viewModel: PortfolioAuthInformationViewModelProtocol!
    var coordinator: PortfolioAuthInformationCoordinatorProtocol!
    
    private var _view: PortfolioAuthInformationView {
        return view as! PortfolioAuthInformationView
    }

    override func loadView() {
        self.view = PortfolioAuthInformationView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _view.setContentHeight()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.supportButton.addTarget(self, action: #selector(openSupportPage(sender:)), for: .touchUpInside)
        _view.closeButton.addTarget(self, action: #selector(backButtonTapped(sender:)), for: .touchUpInside)
    }
    
    // MARK: - UI elements actions

    @objc private func openSupportPage(sender: UIButton) {
        sender.tapAnimation()
        UIApplication.shared.open(self.viewModel.supportUrl!)
    }
    
    @objc private func backButtonTapped(sender: UIButton) {
        dismissThisController()
    }
}
