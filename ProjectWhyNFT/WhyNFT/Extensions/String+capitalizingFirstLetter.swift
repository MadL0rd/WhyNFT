//
//  String+capitalizingFirstLetter.swift
//  ClubhouseAvatarMaker
//
//  Created by Anton Tekutov on 12.06.21.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
