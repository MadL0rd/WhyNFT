//
//  SalesHistoryView.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class SalesHistoryView: UIView {
    
    let titleBackground = UIView()
    let titlesView = DoubleTitledView()
    
    let historyTable = UITableView()
    let refreshControl = UIRefreshControl()

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
        
        addSubview(historyTable)
        historyTable.translatesAutoresizingMaskIntoConstraints = false
        historyTable.separatorColor = .clear
        historyTable.backgroundColor = .res.background()
        historyTable.showsVerticalScrollIndicator = true
        historyTable.rowHeight = 64
        historyTable.contentInset = UIEdgeInsets(top: .res.navigationBarHeight + 24, left: 0, bottom: .res.customTabBarHeight, right: 0)
        historyTable.register(HistoryTableViewCell.self,
                              forCellReuseIdentifier: HistoryTableViewCell.identifier)
        
        refreshControl.tintColor = .res.tintMain()
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        historyTable.refreshControl = refreshControl
        
        addSubview(titleBackground)
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        titleBackground.backgroundColor = .res.background()
        titleBackground.alpha = 0.9
        
        addSubview(titlesView)
        titlesView.translatesAutoresizingMaskIntoConstraints = false
        titlesView.setTitles(title: R.string.localizable.salesHistoryTitle(),
                             subtitle: R.string.localizable.salesHistorySubitle())
        
        makeConstraints()
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
            
            historyTable.topAnchor.constraint(equalTo: topAnchor),
            historyTable.bottomAnchor.constraint(equalTo: bottomAnchor),
            historyTable.widthAnchor.constraint(equalTo: widthAnchor),
            historyTable.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
