//
//  MainMenuCoordinatorProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

protocol MainMenuCoordinatorProtocol: DefaultCoordinatorProtocol {
    
    func generateWorksModule() -> UIViewController
    func generateSalesHistoryModule() -> UIViewController
    func generateSettingsModule() -> UIViewController
}
