//
//  SalesHistoryViewController.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import UIKit

final class SalesHistoryViewController: UIViewController {

    var viewModel: SalesHistoryViewModelProtocol!
    var coordinator: SalesHistoryCoordinatorProtocol!
    
    var history: [SalesHistoryObject] { viewModel.history }
    
    private var _view: SalesHistoryView {
        return view as! SalesHistoryView
    }

    override func loadView() {
        self.view = SalesHistoryView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _view.titlesView.refreshMixedFontText()
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = R.color.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
        _view.historyTable.dataSource = self
        _view.historyTable.delegate = self
        _view.refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)

        viewModel.loadData { [ weak self ] in
            self?._view.historyTable.reloadData()
        }
    }
    
    // MARK: - UI elements actions
    
    @objc func handleRefreshControl() {
        viewModel.loadData { [ weak self ] in
            self?._view.refreshControl.endRefreshing()
            self?._view.historyTable.reloadData()
        }
    }
}

// MARK: - SalesHistory table management

extension SalesHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier,
                                                 for: indexPath) as! HistoryTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let content = history[exist: indexPath.row] {
            cell.setContent(content)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.tapAnimation()
        if let content = history[exist: indexPath.row] {
            coordinator.openWorkDetailsEditor(artWork: content.artwork)
        }
    }
}
