//
//  HistoryTableViewCell.swift
//  WhyNFT
//
//  Created by Антон Текутов on 05.07.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    let imagePreview = UIImageView()
    let title = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func convertDateFormat(inputDate: String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let inputDate = String(inputDate.prefix(19))
        
        let oldDate = olDateFormatter.date(from: inputDate)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "dd MMM yyyy h:mm a"
        
        if let oldDate = oldDate {
            return convertDateFormatter.string(from: oldDate)
        } else {
            return inputDate
        }
    }
    
    // MARK: - Public methods
    
    func setContent(_ content: SalesHistoryObject) {
        imagePreview.sd_setImage(with: content.artwork.artPreviewUrl)

        title.text = content.artwork.artTitle
        dateLabel.text = convertDateFormat(inputDate: content.sellingStatus.createdDateString)
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
        
        contentView.addSubview(imagePreview)
        imagePreview.translatesAutoresizingMaskIntoConstraints = false
        imagePreview.backgroundColor = .res.backgroundInput()
        imagePreview.layer.cornerRadius = 12
        imagePreview.layer.masksToBounds = true
        imagePreview.setDefaultLoadingInicator()
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .res.alataRegular(size: 12)
        title.textColor = .res.tintLight()
        
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .res.alataRegular(size: 10)
        dateLabel.textColor = .res.tintGray()
                
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            imagePreview.widthAnchor.constraint(equalToConstant: 60),
            imagePreview.heightAnchor.constraint(equalToConstant: 46),
            imagePreview.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            imagePreview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            title.leftAnchor.constraint(equalTo: imagePreview.rightAnchor, constant: 12),
            title.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -120),

            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
            dateLabel.leftAnchor.constraint(equalTo: imagePreview.rightAnchor, constant: 12),
            dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -120)
        ])
    }
}

