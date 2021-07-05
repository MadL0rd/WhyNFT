//
//  WorkDetailsEditorViewModelProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

protocol WorkDetailsEditorViewModelProtocol: AnyObject {
    
    var artWork: ArtWork! { get }
    var artWorkSellingStatusCache: ArtWorkSellingStatus? { get }
    
    func checkArkWorkStatus(completion: @escaping(Result<ArtWorkSellingStatus?, Error>) -> Void)
    func uploadArtWork(completion: @escaping(Result<ArtWorkSellingStatus?, Error>) -> Void)
}
