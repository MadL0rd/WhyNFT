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
    
    var urlText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.linkButton.addTarget(self, action: #selector(linkButton(sender:)), for: .touchUpInside)
        
        let loadingHUD = AlertManager.getLoadingHUD(on: view)
        loadingHUD.show(in: view)
        
        viewModel.workSaleRequest { [ weak self ] result in
            guard let self = self
            else { return }
            
            loadingHUD.dismiss()
            switch result {
            case .success(let data):
                AlertManager.showSuccessHUD(on: self._view)
                self.urlText = data.result
                self._view.titlesView.subtitleLabel.text = data.result
                UIView.animate(withDuration: 0.3) { [ weak self ] in
                    self?._view.linkButton.alpha = 1
                }

            case .failure(let error):
                AlertManager.showErrorHUD(on: self._view)
                self._view.titlesView.subtitleLabel.text = "Error!"
                print(error)
            }
            
        }
    }
    
    @objc private func linkButton(sender: UIButton) {
        guard let url = URL(string: urlText)
        else { return }
        sender.tapAnimation()
        UIApplication.shared.open(url)
    }
}
