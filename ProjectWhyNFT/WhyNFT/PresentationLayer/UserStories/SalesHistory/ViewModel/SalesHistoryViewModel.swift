//
//  SalesHistoryViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

struct SalesHistoryObject {
    
    let artwork: ArtWork
    let sellingStatus: ArtWorkSellingStatus
}

final class SalesHistoryViewModel {
    
	var output: SalesHistoryOutput?
    
    var dribbbleService: DribbbleNetworkServiceProtocol!
    var raribleService: RaribleNetworkServiceProtocol!

    var history = [SalesHistoryObject]()
    var artWorks = [ArtWork]()
    
    private var pageCurrentNumber = 1
    private var canLoadNextPage = true
    
    private func loadNextPage(completion: @escaping() -> Void) {
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
            
            self.loadNextPage(completion: completion)
        }
    }
    
    private func reloadArtWorks(completion: @escaping() -> Void) {
        artWorks.removeAll()
        pageCurrentNumber = 1
        canLoadNextPage = true
        loadNextPage(completion: completion)
    }
}

// MARK: - Configuration
extension SalesHistoryViewModel: CustomizableSalesHistoryViewModel {

}

// MARK: - Interface for view
extension SalesHistoryViewModel: SalesHistoryViewModelProtocol {
    
    //        TODO: update when new api version will be available
    func loadData(completion: @escaping () -> Void) {
        history.removeAll()
        reloadArtWorks { [ weak self ] in
            guard let self = self
            else { return }
            self.raribleService.worksAlreadyUsedCheck(artWorks: self.artWorks) { [ weak self ] result in
                guard let self = self
                else { return }
                
                switch result {
                case .success(let data):
                    data.result.forEach { status in
                        if let artwork = self.artWorks.first(where: { $0.artId == status.dribbbleWorkID }) {
                            self.history.append(.init(artwork: artwork, sellingStatus: status))
                        }
                    }
                    
                case .failure(let error):
                    print(error)
                }
                
                completion()
            }
        }
    }
}

