//
//  ResultsViewController.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit
import TinyConstraints

final class ResultsViewController: UIViewController {
    
    private var tableView = UITableView()
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
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let item = viewModel.getItem(index: indexPath.row)
        
        cell.textLabel?.text = item.fullName
        cell.detailTextLabel?.text = item.language
        
        return cell
    }
}


