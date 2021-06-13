//
//  WorkDetailsEditorView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class WorkDetailsEditorView: UIView {
    
    let titleBackground = UIView()
    let titlesView = DoubleTitledView()
    
    let linkButton = ButtonWithTouchSize()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }

    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()

        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.setTitles(title: R.string.localizable.workDetailsEditorTitle(),
                             subtitle: R.string.localizable.workDetailsEditorSubtitle())
        
        addSubview(linkButton)
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.buttonDefault(linkButton)
        linkButton.backgroundColor = .res.backgroundInput()
        linkButton.setTitleColor(.res.tintMain(), for: .normal)
        linkButton.setTitleColor(.res.tintMain(), for: .selected)
        linkButton.setTitleColor(.res.tintMain(), for: .highlighted)
        linkButton.setTitle("Open link", for: .normal)
        linkButton.alpha = 0

        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titlesView.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.navigationBarHeight + 24),
            titlesView.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            titlesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: topAnchor),
            titleBackground.leftAnchor.constraint(equalTo: leftAnchor),
            titleBackground.rightAnchor.constraint(equalTo: rightAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: titlesView.bottomAnchor, constant: 24),
            
            linkButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
            linkButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            linkButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
