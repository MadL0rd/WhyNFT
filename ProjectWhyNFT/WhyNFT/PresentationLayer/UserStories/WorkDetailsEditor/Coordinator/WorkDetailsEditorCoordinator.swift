//
//  WorkDetailsEditorCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class WorkDetailsEditorCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableWorkDetailsEditorViewModel) -> Void)? = nil) -> UIViewController {
        let view = WorkDetailsEditorViewController()
        let viewModel = WorkDetailsEditorViewModel()
        let coordinator = WorkDetailsEditorCoordinator()

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
extension WorkDetailsEditorCoordinator: WorkDetailsEditorCoordinatorProtocol {

}
