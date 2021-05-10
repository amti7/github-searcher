//
//  SearchCoordinator.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

protocol SearchCoordinatorDelegate: AnyObject {
    func didReceive(coordinator: SearchCoordinator, results: [Repository])
}

class SearchCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var delegate: SearchCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
                
    func start() {
        let viewModel = SearchViewModel()
        let viewController = SearchViewController(viewModel: viewModel)
        viewController.delegate = self
        viewModel.delegate = viewController
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: SearchViewControllerDelegate {
    func didReceive(viewController: SearchViewController, results: [Repository]) {
        delegate?.didReceive(coordinator: self, results: results)
    }
}
