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
        
    }
}