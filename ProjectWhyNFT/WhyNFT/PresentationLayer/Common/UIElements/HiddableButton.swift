//
//  HiddableButton.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

class HiddableButton: UIView {
    
    let backgroundImage = UIImageView(image: R.image.fade())
    let button = ButtonWithTouchSize()
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let inside = super.point(inside: point, with: event)
        if inside {
            let pointInSubview = button.convert(point, from: self)
            if button.point(inside: pointInSubview, with: event) {
                return true
            }
        }

        return false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func manageVisibility(hidden: Bool, animated: Bool = true) {
        if animated {
            UIView.animate(withDuration: 0.8) { [ weak self ] in
                self?.backgroundImage.transform = .init(translationX: 0, y: hidden ? 0 : -200)
            }
            UIView.animate(withDuration: 0.3) { [ weak self ] in
                self?.button.transform = .init(translationX: 0, y: hidden ? 0 : -150)
            }
        } else {
            backgroundImage.transform = .init(translationX: 0, y: hidden ? 0 : -200)
            button.transform = .init(translationX: 0, y: hidden ? 0 : -100)
        }
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleToFill
        
        addSubview(button)
        UIStyleManager.buttonDefault(button)
        button.setTitle(R.string.localizable.choose(), for: .normal)
        
        manageVisibility(hidden: true, animated: false)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 80),
            
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            
            backgroundImage.heightAnchor.constraint(equalToConstant: 80),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
