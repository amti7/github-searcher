//
//  SearchCoordinator.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

protocol SearchCoordinatorDelegate: AnyObject {
    func searchDidTapped(coordinator: SearchCoordinator)
}

class SearchCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var dependencyContainer: DependencyContainerType
    var navigationController: UINavigationController
    
    weak var delegate: SearchCoordinatorDelegate?
    
    init(dependencyContainer: DependencyContainerType, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
    }
                
    func start() {
        let viewModel = SearchViewModel()
        let viewController = SearchViewController(viewModel: viewModel)
        viewController.delegate = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: SearchViewControllerDelegate {
    func searchDidTapped(viewController: SearchViewController) {
        delegate?.searchDidTapped(coordinator: self)
    }
}
