//
//  PortfolioAuthenticationCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class PortfolioAuthenticationCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizablePortfolioAuthenticationViewModel) -> Void)? = nil) -> UIViewController {
        let view = PortfolioAuthenticationViewController()
        let viewModel = PortfolioAuthenticationViewModel()
        let coordinator = PortfolioAuthenticationCoordinator()

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
extension PortfolioAuthenticationCoordinator: PortfolioAuthenticationCoordinatorProtocol {

}
