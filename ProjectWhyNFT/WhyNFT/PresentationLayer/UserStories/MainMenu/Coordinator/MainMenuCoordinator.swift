//
//  MainMenuCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class MainMenuCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableMainMenuViewModel) -> Void)? = nil) -> UIViewController {
        let view = MainMenuViewController()
        let viewModel = MainMenuViewModel()
        let coordinator = MainMenuCoordinator()

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
extension MainMenuCoordinator: MainMenuCoordinatorProtocol {
    
    func generateWorksModule() -> UIViewController {
        let vc = WorksCoordinator.createModule()
        return vc
    }
    
    func generateSalesHistoryModule() -> UIViewController {
        let vc = SalesHistoryCoordinator.createModule()
        return vc
    }
    
    func generateSettingsModule() -> UIViewController {
        let vc = SettingsCoordinator.createModule()
        return vc
    }
}
