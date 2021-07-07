//
//  PortfolioAuthInformationView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 07.07.2021.
//

import UIKit

final class PortfolioAuthInformationView: AlertPresentationView {

///    let backgroundView = UIView()
///    let contentView = UIView()
///    var duration: TimeInterval = 0.4
///    var transitionYContentMovingDelta: CGFloat
    
    let scroll = UIScrollView()
    let stack = UIStackView()
    let text = UILabel()
    let supportButton = ButtonWithTouchSize()
    let closeButton = ButtonWithTouchSize()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: - Public methods
    
    func setContentHeight() {
        let contentViewHeight = min(scroll.contentSize.height + 96, .res.screenBounds.height * 0.8)
        contentView.heightAnchor.constraint(equalToConstant: contentViewHeight).isActive = true
        UIView.animate(withDuration: 0.2) { [ weak self ] in
            self?.layoutIfNeeded()
        }
    }

    // MARK: - Private methods
    
    private func setupView() {
        contentView.backgroundColor = .res.background()
        UIStyleManager.defaultBorder(contentView)
        
        contentView.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .center

        stack.addArrangedSubview(text)
        text.font = .res.alataRegular(size: 14)
        text.textColor = .res.tintMain()
        text.text = .res.portfolioAuthenticationInformation()
        text.numberOfLines = 0

        stack.addArrangedSubview(supportButton)
        supportButton.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.buttonSecondary(supportButton)
        supportButton.setTitle(.res.settingsSupport())
        supportButton.layer.borderWidth = 0
        
        contentView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(R.image.cross())
        closeButton.tintColor = .res.tintMain()
        closeButton.setDefaultAreaPadding()

        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            closeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            closeButton.widthAnchor.constraint(equalToConstant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            
            scroll.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scroll.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24),
            scroll.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 24),
            scroll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: scroll.widthAnchor, constant: -24),
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
            supportButton.widthAnchor.constraint(equalTo: supportButton.titleLabel!.widthAnchor, constant: 48)
        ])
    }
}

extension PortfolioAuthInformationView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if #available(iOS 13, *) {
            (scrollView.subviews[(scrollView.subviews.count - 1)].subviews[0]).backgroundColor = .res.tintMain() //verticalIndicator
            (scrollView.subviews[(scrollView.subviews.count - 2)].subviews[0]).backgroundColor = .res.tintMain() //horizontalIndicator
        } else {
            if let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as? UIImageView) {
                verticalIndicator.backgroundColor = .res.tintMain()
            }
            if let horizontalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 2)] as? UIImageView) {
                horizontalIndicator.backgroundColor = .res.tintMain()
            }
        }
    }
}
