//
//  LightSelectionCollectionViewDelegate.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import Foundation

protocol LightSelectionCollectionViewDelegate: AnyObject {
    
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, numberOfItemsInSection section: Int) -> Int
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, contentForItem itemIndex: Int) -> LightSelectionCollectionViewCellContent?
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, isItemSelectionAvailable itemIndex: Int) -> Bool
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemDidTapped itemIndex: Int)
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, selectedItemDidChanged itemIndex: Int?)
    func lightSelectionCollectionView(_ collection: LightSelectionCollectionView, itemLongPress itemIndex: Int)
    func lightSelectionCollectionView(didScrolledToLastItem collection: LightSelectionCollectionView)
}
