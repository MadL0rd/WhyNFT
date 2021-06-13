//
//  WorksViewModelProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

protocol WorksViewModelProtocol: AnyObject {
    
    var artWorks: [ArtWork] { get }
    var canLoadNextPage: Bool { get }
    
    func reloadArtWorks(completion: @escaping() -> Void)
    func loadNextPage(completion: @escaping() -> Void)
    func openArtWorkPage(_ workIndex: Int) 
}
