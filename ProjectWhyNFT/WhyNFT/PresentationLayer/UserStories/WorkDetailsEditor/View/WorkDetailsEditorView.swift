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
    
    let scroll = UIScrollView()
    let stack = UIStackView()
    
    let workImagePreview = UIImageView()
    var selectionBorderedView = UIView()
    var selectionGlow = GlowView()
    let nameTextView = LimitatableTextView()
    let descriptionTextView = LimitatableTextView()
    let workLinkButton = ButtonWithTouchSize()

    let linkButton = ButtonWithTouchSize()
    
    let hiddableButton = HiddableButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: - Public methods
    
    func setContent(_ content: ArtWork) {
        workImagePreview.setDefaultLoadingInicator()
        workImagePreview.sd_setImage(with: content.artPreviewUrl) { [ weak self ] image, _, _, _ in
            guard let image = image,
                  let self = self
            else { return }
            self.workImagePreview.heightAnchor.constraint(equalTo: self.workImagePreview.widthAnchor, multiplier: image.size.height / image.size.width).isActive = true
        }
        
        nameTextView.text = content.artTitle ?? .res.workDetailsEmptyPlaceholder()
        
        var description = content.artDescription ?? .res.workDetailsEmptyPlaceholder()
        description = description.replacingOccurrences(of: "<p>", with: "")
        description = description.replacingOccurrences(of: "</p>", with: "")
        description = description.replacingOccurrences(of: "<br />", with: "")
        descriptionTextView.text = description
    }

    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        
        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 18
        stack.alignment = .center
        
        setupContentViews()
        
        addSubview(hiddableButton)
        hiddableButton.translatesAutoresizingMaskIntoConstraints = false

        makeConstraints()
    }
    
    private func setupContentViews() {
        
        stack.addArrangedSubview(selectionBorderedView)
        selectionBorderedView.translatesAutoresizingMaskIntoConstraints = false
        selectionBorderedView.backgroundColor = .clear
        selectionBorderedView.layer.cornerRadius = 17
        selectionBorderedView.layer.borderWidth = 2
        selectionBorderedView.layer.borderColor = R.color.tintMain()?.cgColor
        
        selectionBorderedView.addSubview(selectionGlow)
        selectionGlow.translatesAutoresizingMaskIntoConstraints = false
        selectionGlow.contentMode = .scaleAspectFill
        
        selectionBorderedView.addSubview(workImagePreview)
        workImagePreview.translatesAutoresizingMaskIntoConstraints = false
        workImagePreview.layer.cornerRadius = 12
        workImagePreview.layer.masksToBounds = true
        
        stack.addArrangedSubview(nameTextView)
        nameTextView.titleLabel.text = .res.workDetailsNameTitle()
        nameTextView.isUserInteractionEnabled = false
        
        stack.addArrangedSubview(descriptionTextView)
        descriptionTextView.titleLabel.text = .res.workDetailsDescriptionTitle()
        descriptionTextView.isUserInteractionEnabled = false
        
        stack.addArrangedSubview(workLinkButton)
        workLinkButton.setTitle(.res.workDetailsOpenWorkPageInBrowser(), for: .normal)
        UIStyleManager.buttonSecondary(workLinkButton)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titleBackground.topAnchor.constraint(equalTo: topAnchor),
            titleBackground.heightAnchor.constraint(equalToConstant: .res.navigationBarHeight),
            titleBackground.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            titleBackground.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            scroll.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scroll.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 24),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -100),
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
                                    
            selectionBorderedView.centerYAnchor.constraint(equalTo: workImagePreview.centerYAnchor),
            selectionBorderedView.centerXAnchor.constraint(equalTo: workImagePreview.centerXAnchor),
            selectionBorderedView.widthAnchor.constraint(equalTo: workImagePreview.widthAnchor, constant: 24),
            selectionBorderedView.heightAnchor.constraint(equalTo: workImagePreview.heightAnchor, constant: 24),
            
            selectionGlow.centerYAnchor.constraint(equalTo: selectionBorderedView.centerYAnchor),
            selectionGlow.centerXAnchor.constraint(equalTo: selectionBorderedView.centerXAnchor),
            selectionGlow.widthAnchor.constraint(equalTo: selectionBorderedView.widthAnchor, multiplier: 1.6),
            selectionGlow.heightAnchor.constraint(equalTo: selectionBorderedView.heightAnchor, multiplier: 1.6),
            
            nameTextView.widthAnchor.constraint(equalTo: stack.widthAnchor),
            descriptionTextView.widthAnchor.constraint(equalTo: stack.widthAnchor),
            workLinkButton.widthAnchor.constraint(equalTo: stack.widthAnchor),
            
            hiddableButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            hiddableButton.widthAnchor.constraint(equalTo: widthAnchor),
            hiddableButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension WorkDetailsEditorView: UIScrollViewDelegate {
    
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
