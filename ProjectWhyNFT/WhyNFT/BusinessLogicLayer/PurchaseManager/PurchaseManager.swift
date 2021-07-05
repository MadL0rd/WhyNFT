//
//  PurchaseManager.swift
//  WhyNFT
//
//  Created by Антон Текутов on 19.06.2021.
//

import StoreKit

class PurchaseManager: PurchaseManagerProtocol {
    
    static let shared: PurchaseManagerProtocol = PurchaseManager()
        
    var termsOfUsageUrl: URL? {
        return URL(string: "https://www.notion.so/TERMS-OF-USE-cdcd03ca2f284894a3f65bbe30c578a8")
    }
    
    var privacyPolicyUrl: URL? {
        return URL(string: "https://www.notion.so/PRIVACY-POLICY-bf635dc766144aafa5af46a3f39754a8")
    }
    
    var supportUrl: URL? {
        return URL(string: "https://www.notion.so/FEEDBACK-SUPPORT-e2b8d52e6fae44c68260b4a17831c61b")
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}
