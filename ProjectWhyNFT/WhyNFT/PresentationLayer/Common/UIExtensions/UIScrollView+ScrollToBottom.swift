//
//  UIScrollView+ScrollToBottom.swift
//  ClubhouseAvatarMaker
//
//  Created by Anton Tekutov on 12.06.21.
//

import UIKit

extension UIScrollView {
    
    func scrollsToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
}
