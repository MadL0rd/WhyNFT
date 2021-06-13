//
//  LoadingViewController.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    var viewModel: LoadingViewModelProtocol!
    var coordinator: LoadingCoordinatorProtocol!
    
    private var _view: LoadingView {
        return view as! LoadingView
    }
    
    override func loadView() {
        self.view = LoadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSelf()
    }
    
    private func configureSelf() {
        viewModel.startConfiguration()
        
        _view.hideLogo()
        DispatchQueue.main.asyncAfter(deadline: .now() + _view.hideLogoDuration * 0.3) { [ weak self ] in
            self?.checkAvailableUser()
        }
    }
    
    private func checkAvailableUser() {
        let loadingHUD = AlertManager.getLoadingHUD(on: view)
        loadingHUD.show(in: view)
        
        viewModel.checkActiveUserPortfolio { [ weak self ] haveActiveUser in
            if (haveActiveUser) {
                self?.viewModel.checkActiveUserRarible { [ weak self ] haveActiveWallet in
                    loadingHUD.dismiss()
                    if haveActiveWallet {
                        self?.coordinator.openModule(.mainMenu, openingMode: .showInNewRootNavigationStack)
                    } else {
                        self?.coordinator.openModule(.raribleAuthentication, openingMode: .showInNewRootNavigationStack)
                    }
                }
            } else {
                loadingHUD.dismiss()
                self?.coordinator.openModule(.portfolioAuthentication, openingMode: .showInNewRootNavigationStack)
            }
        }
    }
}
