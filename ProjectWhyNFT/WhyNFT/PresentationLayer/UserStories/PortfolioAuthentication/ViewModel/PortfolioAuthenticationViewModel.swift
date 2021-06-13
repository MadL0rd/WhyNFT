//
//  PortfolioAuthenticationViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

final class PortfolioAuthenticationViewModel {
    
	var output: PortfolioAuthenticationOutput?

    var dribbbleService: DribbbleNetworkServiceProtocol!
}

// MARK: - Configuration
extension PortfolioAuthenticationViewModel: CustomizablePortfolioAuthenticationViewModel {

}

// MARK: - Interface for view
extension PortfolioAuthenticationViewModel: PortfolioAuthenticationViewModelProtocol {

    func signInWithDribbble(completion: @escaping() -> Void) {
        dribbbleService.createTokenAndAuthenticate { result in
            switch result {
            case .success(let data):
                print(data)

            case .failure(let error):
                print(error)
                
            }
            
            completion()
        }
    }
}

