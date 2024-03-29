//
//  WorksViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class WorksViewController: UIViewController {

    var viewModel: WorksViewModelProtocol!
    var coordinator: WorksCoordinatorProtocol!
    
    private var _view: WorksView {
        return view as! WorksView
    }

    override func loadView() {
        self.view = WorksView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _view.titlesView.refreshMixedFontText()
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        _view.hiddableButton.manageVisibility(hidden: _view.itemsCollection.currentSelectedIndex == nil)
        _view.itemsCollection.startGlowAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.itemsCollection.delegate = self
        _view.refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        _view.selectButton.addTarget(self, action: #selector(selectWorkToSale(sender:)), for: .touchUpInside)
        
        loadNextPageIfNeeded()
    }
    
    private func loadNextPageIfNeeded() {
        guard viewModel.canLoadNextPage
        else { return }
        let count = viewModel.artWorks.count
        viewModel.loadNextPage { [ weak self ] in
            guard let self = self
            else { return }
            let itemsToInsert = (count ..< self.viewModel.artWorks.count)
                .compactMap { IndexPath(row: $0, section: 0) }
            self._view.itemsCollection.collectionView.insertItems(at: itemsToInsert)
        }
    }
    
    // MARK: - UI elements actions
    
    @objc func handleRefreshControl() {
        _view.itemsCollection.selectionBorderedView.alpha = 0
        _view.itemsCollection.currentSelectedIndexPath = nil
        _view.hiddableButton.manageVisibility(hidden: true)
        viewModel.reloadArtWorks { [ weak self ] in
            self?._view.itemsCollection.reloadData()
            self?._view.refreshControl.endRefreshing()
        }
    }
    
    @objc private func selectWorkToSale(sender: UIView) {
        guard let index = _view.itemsCollection.currentSelectedIndex,
              let workItem = viewModel.artWorks[exist: index]
        else { return }
        
        sender.tapAnimation()
        VibroGenerator.light.impactOccurred()
        
        coordinator.openWorkDetailsEditor(artWork: workItem)
    }
}

extension WorksViewController: LightSelectionCollectionViewDelegate {
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.artWorks.count
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, contentForItem itemIndex: Int) -> LightSelectionCollectionViewCellContent? {
        guard let item = viewModel.artWorks[exist: itemIndex]
        else { return nil }
        return .artWork(content: item)
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, isItemSelectionAvailable itemIndex: Int) -> Bool {
        return true
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemDidTapped itemIndex: Int) {
        
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, selectedItemDidChanged itemIndex: Int?) {
        _view.hiddableButton.manageVisibility(hidden: itemIndex == nil)
    }
    
    func lightSelectionCollectionView(tooltipFor collection: LightSelectionCollectionView, itemLongPressStart itemIndex: Int) -> String? {
        return R.string.localizable.worksTooltipOpenInBrowser()
    }
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemLongPress itemIndex: Int) {
        viewModel.openArtWorkPage(itemIndex)
    }
    
    func lightSelectionCollectionView(didScrolledToLastItem collection: LightSelectionCollectionView) {
        loadNextPageIfNeeded()
    }
}
