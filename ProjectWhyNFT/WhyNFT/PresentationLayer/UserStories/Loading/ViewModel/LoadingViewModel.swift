//
//  LoadingViewModel.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

final class LoadingViewModel {
    
	var output: LoadingOutput?
    
    var dribbbleService: DribbbleNetworkServiceProtocol!

}

// MARK: - Configuration
extension LoadingViewModel: CustomizableLoadingViewModel {

}

// MARK: - Interface for view
extension LoadingViewModel: LoadingViewModelProtocol {
    
    func startConfiguration() {
        
    }
    
    func checkActiveUser(_ completion: @escaping(Bool) -> Void) {
        dribbbleService.getCurrentUser { result in
            switch result {
            case .success:
                completion(true)
                
            case .failure:
                completion(false)
            }
            
        }
    }

}

