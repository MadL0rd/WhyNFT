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
        menu[itemIndex].action?()
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, selectedItemDidChanged itemIndex: Int?) {
        
    }
    
    func lightSelectionCollectionView(tooltipFor collection: LightSelectionCollectionView, itemLongPressStart itemIndex: Int) -> String? {
        return nil
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemLongPress itemIndex: Int) {
        
    }
    
    func lightSelectionCollectionView(didScrolledToLastItem collection: LightSelectionCollectionView) {
        
    }
}
