//
//  SettingsView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class SettingsView: UIView {
    
    let titleBackground = UIView()
    let titlesView = DoubleTitledView()

    let tableView = UITableView()
    let footer = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
    let footerLabel = UILabel()

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
        
        addSubview(tableView)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .res.background()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = footer
        tableView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 64
        
        setupFooter()
        setupTitle()
        
        makeConstraints()
    }
    
    private func setupTitle() {
        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.setTitles(title: R.string.localizable.settingsTitle(),
                             subtitle: nil)
    }
    
    private func setupFooter() {
        footer.addSubview(footerLabel)
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.font = R.font.alataRegular(size: 14)
        footerLabel.textAlignment = .center
        footerLabel.numberOfLines = 0
        footerLabel.textColor = .res.tintGray()
        footerLabel.text = "\(R.string.localizable.settingsVersion()): \(Bundle.main.versionNumber)"
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titlesView.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.statusBarHeight + 24),
            titlesView.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            titlesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: topAnchor),
            titleBackground.leftAnchor.constraint(equalTo: leftAnchor),
            titleBackground.rightAnchor.constraint(equalTo: rightAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: titlesView.bottomAnchor, constant: 24),
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            footerLabel.topAnchor.constraint(equalTo: footer.topAnchor, constant: 20),
            footerLabel.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            footerLabel.widthAnchor.constraint(equalTo: tableView.widthAnchor, multiplier: 0.9)
        ])
    }
}
