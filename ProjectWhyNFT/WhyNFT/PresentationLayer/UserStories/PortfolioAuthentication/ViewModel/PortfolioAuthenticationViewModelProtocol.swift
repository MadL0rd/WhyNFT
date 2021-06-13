//
//  PortfolioAuthenticationViewModelProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

protocol PortfolioAuthenticationViewModelProtocol: AnyObject {
    
    func signInWithDribbble(completion: @escaping() -> Void)
}
