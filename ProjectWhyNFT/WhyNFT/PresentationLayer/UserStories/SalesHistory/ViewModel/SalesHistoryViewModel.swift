//
//  SalesHistoryViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

final class SalesHistoryViewModel {
	var output: SalesHistoryOutput?
}

// MARK: - Configuration
extension SalesHistoryViewModel: CustomizableSalesHistoryViewModel {

}

// MARK: - Interface for view
extension SalesHistoryViewModel: SalesHistoryViewModelProtocol {

}

