//
//  ArtWork.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation

protocol ArtWork {
    
    var artPreviewUrl: URL? { get }
    var artHtmlUrl: URL? { get }
    var artTitle: String? { get }
    var artDescription: String? { get }
}
