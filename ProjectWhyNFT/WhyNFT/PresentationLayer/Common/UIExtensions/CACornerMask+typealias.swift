//
//  CACornerMask+typealias.swift
//  WhyNFT
//
//  Created by Anton Tekutov on 12.06.21.
//

import UIKit

extension CACornerMask {
    
    public static var topLeft: CACornerMask {
        return layerMinXMinYCorner
    }
    
    public static var topRight: CACornerMask {
        return layerMaxXMinYCorner
    }
    
    public static var bottomLeft: CACornerMask {
        return layerMinXMaxYCorner
    }
    
    public static var bottomRight: CACornerMask {
        return layerMaxXMaxYCorner
    }
}
