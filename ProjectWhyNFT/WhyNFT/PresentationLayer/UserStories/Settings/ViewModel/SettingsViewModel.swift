//
//  SettingsViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

final class SettingsViewModel {
	var output: SettingsOutput?
}

// MARK: - Configuration
extension SettingsViewModel: CustomizableSettingsViewModel {

}

// MARK: - Interface for view
extension SettingsViewModel: SettingsViewModelProtocol {

}

