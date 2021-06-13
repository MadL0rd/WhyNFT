//
//  SettingsViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class SettingsViewController: UIViewController {

    var viewModel: SettingsViewModelProtocol!
    var coordinator: SettingsCoordinatorProtocol!
    
    private var _view: SettingsView {
        return view as! SettingsView
    }

    override func loadView() {
        self.view = SettingsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
    }
}