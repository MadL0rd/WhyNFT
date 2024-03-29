//
//  Array+safeIndex.swift
//  ClubhouseAvatarMaker
//
//  Created by Anton Tekutov on 12.06.21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
