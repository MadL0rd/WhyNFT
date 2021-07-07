//
//  PortfolioAuthInformationCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 07.07.2021.
//

import UIKit

final class PortfolioAuthInformationCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizablePortfolioAuthInformationViewModel) -> Void)? = nil) -> UIViewController {
        let view = PortfolioAuthInformationViewController()
        let viewModel = PortfolioAuthInformationViewModel()
        let coordinator = PortfolioAuthInformationCoordinator()

        view.viewModel = viewModel
        view.coordinator = coordinator

        coordinator.transition = view
        
        viewModel.purchaseManager = PurchaseManager.shared

        if let configuration = configuration {
            configuration(viewModel)
        }

        return view
    }
}

// MARK: - Interface for view
extension PortfolioAuthInformationCoordinator: PortfolioAuthInformationCoordinatorProtocol {

}
