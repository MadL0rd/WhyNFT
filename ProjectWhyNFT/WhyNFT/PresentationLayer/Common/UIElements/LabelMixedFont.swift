//
//  LabelMixedFont.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

class LabelMixedFont: UILabel {
    
    var availableSigns = "otrbensh"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setMixedFontText(_ text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        
        var availableSignsUseArray = text.compactMap { availableSigns.contains($0) ? false : nil }
        var needToSetCount = min(availableSignsUseArray.count / 2, 4)
        var repeatCount = 0
        while needToSetCount > 0,
              repeatCount < 4 {
            let index = Int.random(in: 0 ..< availableSignsUseArray.count)
            repeatCount += 1
            if availableSignsUseArray[index] == false,
               availableSignsUseArray[exist: index + 1] != true,
               availableSignsUseArray[exist: index - 1] != true {
                availableSignsUseArray[index] = true
                needToSetCount -= 1
                repeatCount = 0
            }
        }
        
        var availableSignsUseArrayIndex = 0
        text.indices.forEach {
            if availableSigns.contains(text[$0]) {
                if availableSignsUseArray[availableSignsUseArrayIndex] == true {
                    let index: Int = $0.utf16Offset(in: text)
                    let range = NSRange(location: index, length: 1)
                    attributedString.addAttribute(NSAttributedString.Key.font, value: R.font.mkmegadriveMedium(size: 36)!, range: range)
                }
                availableSignsUseArrayIndex += 1
            }
        }
       
        attributedText = attributedString
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        availableSigns += availableSigns.uppercased()
        
        textColor = R.color.tintMain()
        font = R.font.alataRegular(size: 36)
        numberOfLines = 0
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
