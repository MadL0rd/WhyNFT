//
//  SalesHistoryCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class SalesHistoryCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableSalesHistoryViewModel) -> Void)? = nil) -> UIViewController {
        let view = SalesHistoryViewController()
        let viewModel = SalesHistoryViewModel()
        let coordinator = SalesHistoryCoordinator()

        view.viewModel = viewModel
        view.coordinator = coordinator

        coordinator.transition = view

        if let configuration = configuration {
            configuration(viewModel)
        }

        return view
    }
}

// MARK: - Interface for view
extension SalesHistoryCoordinator: SalesHistoryCoordinatorProtocol {

}