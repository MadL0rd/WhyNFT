//
//  AuthenticationCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class AuthenticationCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableAuthenticationViewModel) -> Void)? = nil) -> UIViewController {
        let view = AuthenticationViewController()
        let viewModel = AuthenticationViewModel()
        let coordinator = AuthenticationCoordinator()

        view.viewModel = viewModel
        view.coordinator = coordinator

        coordinator.transition = view
        
        viewModel.dribbbleService = DribbbleNetworkService.shared

        if let configuration = configuration {
            configuration(viewModel)
        }

        return view
    }
}

// MARK: - Interface for view
extension AuthenticationCoordinator: AuthenticationCoordinatorProtocol {

}
