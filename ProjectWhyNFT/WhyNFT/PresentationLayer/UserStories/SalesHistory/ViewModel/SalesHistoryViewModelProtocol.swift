//
//  SalesHistoryViewModelProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

protocol SalesHistoryViewModelProtocol: AnyObject {
    
    var history: [SalesHistoryObject] { get }
    
    func loadData(completion:  @escaping() -> Void)
}
