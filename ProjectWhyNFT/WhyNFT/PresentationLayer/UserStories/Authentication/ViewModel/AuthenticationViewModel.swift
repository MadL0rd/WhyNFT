//
//  AuthenticationViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

final class AuthenticationViewModel {
    
	var output: AuthenticationOutput?
    
    var dribbbleService: DribbbleNetworkServiceProtocol!

}

// MARK: - Configuration
extension AuthenticationViewModel: CustomizableAuthenticationViewModel {

}

// MARK: - Interface for view
extension AuthenticationViewModel: AuthenticationViewModelProtocol {

    func signInWithDribbble() {
        dribbbleService.createTokenAndAuthenticate { result in
            switch result {
            case .success(let data):
                print(data)

            case .failure(let error):
                print(error)
                
            }
        }
    }
}

