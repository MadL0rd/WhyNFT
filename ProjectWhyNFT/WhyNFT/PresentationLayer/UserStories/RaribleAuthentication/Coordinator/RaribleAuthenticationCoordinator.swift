//
//  RaribleAuthenticationCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class RaribleAuthenticationCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableRaribleAuthenticationViewModel) -> Void)? = nil) -> UIViewController {
        let view = RaribleAuthenticationViewController()
        let viewModel = RaribleAuthenticationViewModel()
        let coordinator = RaribleAuthenticationCoordinator()

        view.viewModel = viewModel
        view.coordinator = coordinator

        coordinator.transition = view
        
        viewModel.raribleService = RaribleNetworkService.shared

        if let configuration = configuration {
            configuration(viewModel)
        }

        return view
    }
}

// MARK: - Interface for view
extension RaribleAuthenticationCoordinator: RaribleAuthenticationCoordinatorProtocol {

}
