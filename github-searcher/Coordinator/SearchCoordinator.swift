//
//  SearchCoordinator.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

class SearchCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var dependencyContainer: DependencyContainerType
    var navigationController: UINavigationController
    
    init(dependencyContainer: DependencyContainerType, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
    }
                
    func start() {
        let viewModel = SearchViewModel()
        let viewController = SearchViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
