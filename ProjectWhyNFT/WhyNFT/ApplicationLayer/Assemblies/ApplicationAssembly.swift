//
//  ApplicationAssembly.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

import Foundation

class ApplicationAssembly {
    
    static var appRouter: AppRouter = {
        return MainAppRouter()
    }()
}
