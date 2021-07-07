//
//  PortfolioAuthInformationViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 07.07.2021.
//

import Foundation

final class PortfolioAuthInformationViewModel {
    
	var output: PortfolioAuthInformationOutput?
    
    var purchaseManager: PurchaseManagerProtocol!
}

// MARK: - Configuration
extension PortfolioAuthInformationViewModel: CustomizablePortfolioAuthInformationViewModel {

}

// MARK: - Interface for view
extension PortfolioAuthInformationViewModel: PortfolioAuthInformationViewModelProtocol {

    var supportUrl: URL? {
        return purchaseManager.supportUrl
    }
}

