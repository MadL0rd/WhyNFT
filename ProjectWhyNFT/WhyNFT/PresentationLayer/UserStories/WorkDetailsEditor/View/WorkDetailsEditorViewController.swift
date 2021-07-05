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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        _view.selectionGlow.startAnimation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        addTapGestureToHideKeyboard()
        
        _view.setContent(viewModel.artWork)
        
        _view.hiddableButton.button.addTarget(self, action: #selector(nftActionButtonTapped(sender:)), for: .touchUpInside)
        _view.workLinkButton.addTarget(self, action: #selector(workLinkButtonDidTapped(sender:)), for: .touchUpInside)

        let loadingHUD = AlertManager.getLoadingHUD(on: view)
        loadingHUD.show(in: view)
        
        viewModel.checkArkWorkStatus { [ weak self ] result in
            guard let self = self
            else { return }
            
            loadingHUD.dismiss()
            switch result {
            case .success(let data):
                self._view.hiddableButton.manageVisibility(hidden: false)
                self._view.hiddableButton.button.setTitle(data != nil ? .res.workDetailsLookAtRarible() : .res.workDetailsCreateNft(), for: .normal)
                
            case .failure:
                AlertManager.showErrorHUD(on: self._view,
                                          withText: .res.error(),
                                          detailText: .res.workDetailsFailToCheckWorkStatusInRarible())

            }
            
        }
    }
    
    @objc private func workLinkButtonDidTapped(sender: UIButton) {
        guard let url = viewModel.artWork.artHtmlUrl
        else {
            sender.shake()
            return
        }
        sender.tapAnimation()
        UIApplication.shared.open(url)
    }
    
    @objc private func nftActionButtonTapped(sender: ButtonWithTouchSize) {
        sender.tapAnimation()
        
        if let nftStatus = viewModel.artWorkSellingStatusCache,
           let url = nftStatus.urlRaribleNft {
            UIApplication.shared.open(url)
        } else {
            
            let loadingHUD = AlertManager.getLoadingHUD(on: view)
            loadingHUD.show(in: view)
            _view.hiddableButton.manageVisibility(hidden: true)

            viewModel.uploadArtWork { [ weak self ] result in
                guard let self = self
                else { return }
                
                loadingHUD.dismiss()
                self._view.hiddableButton.manageVisibility(hidden: false)
                
                switch result {
                case .success(let data):
                    self._view.hiddableButton.button.setTitle(data != nil ? .res.workDetailsLookAtRarible() : .res.workDetailsCreateNft(), for: .normal)
                    
                case .failure:
                    AlertManager.showErrorHUD(on: self._view,
                                              withText: .res.error(),
                                              detailText: .res.workDetailsFailToUploadArtwork())
                }
            }
        }
    }
}
