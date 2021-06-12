//
//  LoadingViewModel.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

final class LoadingViewModel {
	var output: LoadingOutput?
}

// MARK: - Configuration
extension LoadingViewModel: CustomizableLoadingViewModel {

}

// MARK: - Interface for view
extension LoadingViewModel: LoadingViewModelProtocol {
    
    func startConfiguration() {
        
    }
}

