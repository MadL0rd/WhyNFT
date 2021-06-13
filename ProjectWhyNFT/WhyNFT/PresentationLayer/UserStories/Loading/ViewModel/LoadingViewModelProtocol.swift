//
//  LoadingViewModelProtocol.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

protocol LoadingViewModelProtocol: AnyObject {
    
    func startConfiguration()
    func checkActiveUserPortfolio(_ completion: @escaping(Bool) -> Void)
    func checkActiveUserRarible(_ completion: @escaping(Bool) -> Void)
}
