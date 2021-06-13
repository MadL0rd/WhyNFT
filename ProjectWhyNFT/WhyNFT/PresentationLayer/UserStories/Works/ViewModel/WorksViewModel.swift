//
//  WorksViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation
import UIKit

final class WorksViewModel {
    
	var output: WorksOutput?
    
    var dribbbleService: DribbbleNetworkServiceProtocol!
    
    var artWorks: [ArtWork] = []

    private var pageCurrentNumber = 1
    var canLoadNextPage = true
}

// MARK: - Configuration
extension WorksViewModel: CustomizableWorksViewModel {

}

// MARK: - Interface for view
extension WorksViewModel: WorksViewModelProtocol {
    
    func loadNextPage(completion: @escaping() -> Void) {
        guard canLoadNextPage
        else {
            completion()
            return
        }
        dribbbleService.getCurrentUserWorks(page: pageCurrentNumber) { [ weak self ] result in
            guard let self = self
            else { return }
            
            switch result {
            case .success(let artWorksResponseData):
                self.artWorks.append(contentsOf: artWorksResponseData)
                self.canLoadNextPage = !artWorksResponseData.isEmpty
                self.pageCurrentNumber += 1
                
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
    
    func reloadArtWorks(completion: @escaping() -> Void) {
        artWorks.removeAll()
        pageCurrentNumber = 1
        canLoadNextPage = true
        loadNextPage(completion: completion)
    }
    
    func openArtWorkPage(_ workIndex: Int) {
        guard let item = artWorks[exist: workIndex],
              let url = item.artHtmlUrl
        else { return }
        UIApplication.shared.open(url)
    }
}

