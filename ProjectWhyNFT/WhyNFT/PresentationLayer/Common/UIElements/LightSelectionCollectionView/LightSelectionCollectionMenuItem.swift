//
//  LightSelectionCollectionMenuItem.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

protocol LightSelectionCollectionMenuItem {
    
    var title: String { get }
    var image: UIImage? { get }
}

struct CollectionMenuItem: LightSelectionCollectionMenuItem {
    
    var title: String
    var image: UIImage?
    var isAvailable: Bool
    var action: (() -> Void)?
}
