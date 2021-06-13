//
//  WorkDetailsEditorViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class WorkDetailsEditorViewController: UIViewController {

    var viewModel: WorkDetailsEditorViewModelProtocol!
    var coordinator: WorkDetailsEditorCoordinatorProtocol!
    
    private var _view: WorkDetailsEditorView {
        return view as! WorkDetailsEditorView
    }

    override func loadView() {
        self.view = WorkDetailsEditorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        let loadingHUD = AlertManager.getLoadingHUD(on: view)
        loadingHUD.show(in: view)
        
        viewModel.workSaleRequest { [ weak self ] result in
            guard let self = self
            else { return }
            
            loadingHUD.dismiss()
            switch result {
            case .success(let data):
                AlertManager.showSuccessHUD(on: self._view)
                self._view.titlesView.subtitleLabel.text = data.result

            case .failure(let error):
                AlertManager.showErrorHUD(on: self._view)
                self._view.titlesView.subtitleLabel.text = "Error!"
                print(error)
            }
            
        }
    }
}
