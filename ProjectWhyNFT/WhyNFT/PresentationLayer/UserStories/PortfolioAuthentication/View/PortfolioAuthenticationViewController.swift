//
//  PortfolioAuthenticationViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class PortfolioAuthenticationViewController: UIViewController {

    var viewModel: PortfolioAuthenticationViewModelProtocol!
    var coordinator: PortfolioAuthenticationCoordinatorProtocol!
    
    var menu = [CollectionMenuItem]()
    
    private var _view: PortfolioAuthenticationView {
        return view as! PortfolioAuthenticationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        _view.itemsCollection.startGlowAnimation()
    }

    override func loadView() {
        self.view = PortfolioAuthenticationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.itemsCollection.delegate = self
        menu = [
            .init(title: R.string.localizable.portfolioAuthenticationDribbbleName(),
                  image: R.image.dribbbleIcon(),
                  isAvailable: true,
                  action: { [ weak self ] in
                    self?.viewModel.signInWithDribbble {
                        self?.coordinator.openModule(.loading, openingMode: .showInNewRootNavigationStack)
                    }
                  }),
            .init(title: R.string.localizable.portfolioAuthenticationBehanceName(),
                  image: R.image.behanceIcon(),
                  isAvailable: false)
        ]
        
        _view.hiddableButton.button.addTarget(self, action: #selector(chooseButtonDidTapped(sender:)), for: .touchUpInside)
        _view.infoButton.addTarget(self, action: #selector(showInfo(sender:)), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: _view.infoButton)
        navigationItem.rightBarButtonItem = menuBarItem
    }
    
    // MARK: - UI elements actions

    @objc private func chooseButtonDidTapped(sender: UIButton) {
        guard let index = _view.itemsCollection.currentSelectedIndex,
              let content = menu[exist: index]
        else { return }
        content.action?()
    }
    
    @objc private func showInfo(sender: UIButton) {
        sender.tapAnimation()
        coordinator.openModule(.portfolioAuthInformation)
    }
}

extension PortfolioAuthenticationViewController: LightSelectionCollectionViewDelegate {
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, numberOfItemsInSection section: Int) -> Int {
        menu.count
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, contentForItem itemIndex: Int) -> LightSelectionCollectionViewCellContent? {
        return .menuItem(content: menu[itemIndex])
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, isItemSelectionAvailable itemIndex: Int) -> Bool {
        return menu[itemIndex].isAvailable
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemDidTapped itemIndex: Int) {
        
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, selectedItemDidChanged itemIndex: Int?) {
        _view.hiddableButton.manageVisibility(hidden: itemIndex == nil)
    }
    
    func lightSelectionCollectionView(tooltipFor collection: LightSelectionCollectionView, itemLongPressStart itemIndex: Int) -> String? {
        return nil
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemLongPress itemIndex: Int) {
        
    }
    
    func lightSelectionCollectionView(didScrolledToLastItem collection: LightSelectionCollectionView) {
        
    }
}
