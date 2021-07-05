//
//  WorkDetailsEditorViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

final class WorkDetailsEditorViewModel {
    
	var output: WorkDetailsEditorOutput?
    
    var raribleService: RaribleNetworkServiceProtocol!
    
    var artWork: ArtWork!
    var artWorkSellingStatusCache: ArtWorkSellingStatus?
}

// MARK: - Configuration
extension WorkDetailsEditorViewModel: CustomizableWorkDetailsEditorViewModel {

}

// MARK: - Interface for view
extension WorkDetailsEditorViewModel: WorkDetailsEditorViewModelProtocol {
    
    func checkArkWorkStatus(completion: @escaping(Result<ArtWorkSellingStatus?, Error>) -> Void) {
        raribleService.worksAlreadyUsedCheck(artWorks: [artWork]) { [ weak self ] result in
            guard let self = self
            else { return }
            switch result {
            case .success(let data):
                self.artWorkSellingStatusCache = data.result.first
                completion(.success(self.artWorkSellingStatusCache))
                
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func uploadArtWork(completion: @escaping(Result<ArtWorkSellingStatus?, Error>) -> Void) {
        raribleService.uploadArtwork(artWork: artWork) { [ weak self ] result in
            guard let self = self
            else { return }
            
            switch result {
            case .success(let data):
                self.artWorkSellingStatusCache = data.result
                completion(.success(self.artWorkSellingStatusCache))
                
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
            
        }
    }
}

