//
//  DoubleTitledView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

class DoubleTitledView: UIView {
    
    let stack = UIStackView()
    let titleLabel = LabelMixedFont()
    let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setTitles(title: String, subtitle: String) {
        titleLabel.setMixedFontText(title)
        subtitleLabel.text = subtitle
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 18
        
        stack.addArrangedSubview(titleLabel)
        
        stack.addArrangedSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = .res.tintLight()
        subtitleLabel.font = R.font.alataRegular(size: 14)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.widthAnchor.constraint(equalTo: widthAnchor),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
