//
//  SalesHistoryViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class SalesHistoryViewController: UIViewController {

    var viewModel: SalesHistoryViewModelProtocol!
    var coordinator: SalesHistoryCoordinatorProtocol!
    
    private var _view: SalesHistoryView {
        return view as! SalesHistoryView
    }

    override func loadView() {
        self.view = SalesHistoryView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _view.titlesView.refreshMixedFontText()
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
    }
}
