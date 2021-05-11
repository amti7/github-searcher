//
//  ResultsViewController.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit
import TinyConstraints

final class ResultsViewController: UIViewController {
    
    private struct Constants {
        static let numberOfLinesLabel = 2
        static let labelWidth: CGFloat = 320
        static let cellHeight: CGFloat = 70
        static let labelHeight: CGFloat = 44
        static let separator = " -> "
        static let cellName = "cell"
        static let likesString = " likes"
        static let message = "Sorry. We couldn’t find any repositories matching you search"
    }
    
    private var tableView = UITableView()
    private let messageLabel = UILabel()
    
    private var viewModel: ResultsViewModelType
    
    init(viewModel: ResultsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupLabel()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIView()
        tableView.backgroundView?.addSubview(messageLabel)
    }
    
    private func setupLabel() {
        messageLabel.centerInSuperview()
        messageLabel.width(Constants.labelWidth)
        messageLabel.height(Constants.labelHeight)
        messageLabel.text = ""
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = Constants.numberOfLinesLabel
        
        if viewModel.isEmpty() {
            messageLabel.text = Constants.message
            tableView.separatorStyle = .none
        } else {
            messageLabel.text = ""
            tableView.separatorStyle = .singleLine
        }
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.cellName)
        let item = viewModel.getItem(index: indexPath.row)
        
        cell.textLabel?.text = item.fullName
        cell.detailTextLabel?.text = (item.language ?? "") + Constants.separator + String(item.stargazersCount) + Constants.likesString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(index: indexPath.row)
    }
}

extension ResultsViewController: ResultsViewModelDelegate {
    func didSelectRepo(_ viewModel: ResultsViewModelType, repoURL: URL) {
        UIApplication.shared.open(repoURL)
    }
}
