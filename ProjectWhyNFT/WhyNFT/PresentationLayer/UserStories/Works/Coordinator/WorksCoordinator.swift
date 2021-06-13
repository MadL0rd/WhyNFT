//
//  WorksCoordinator.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class WorksCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableWorksViewModel) -> Void)? = nil) -> UIViewController {
        let view = WorksViewController()
        let viewModel = WorksViewModel()
        let coordinator = WorksCoordinator()

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
extension WorksCoordinator: WorksCoordinatorProtocol {

    func openWorkDetailsEditor(artWork: ArtWork) {
        let vc = WorkDetailsEditorCoordinator.createModule { viewModel in
            viewModel.artWork = artWork
        }
        transition.showInRootNavigationController(vc)
    }
}
