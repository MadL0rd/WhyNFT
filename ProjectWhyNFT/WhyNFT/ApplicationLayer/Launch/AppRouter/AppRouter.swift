//
//  AppRouter.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

import UIKit

protocol AppRouter: AnyObject {

	var window: UIWindow! { get set }
    
    func handleLaunch()
}
