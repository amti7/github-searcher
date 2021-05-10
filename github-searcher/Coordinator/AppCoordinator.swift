//
//  AppCoordinator.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.delegate = self
        self.childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
    }
    
    func startResultsViewController(results: [Repository]) {
        let resultsCoordinator = ResultsCoordinator(navigationController: navigationController, results: results)
        self.childCoordinators.append(resultsCoordinator)
        resultsCoordinator.start()
    }
}

extension AppCoordinator: SearchCoordinatorDelegate {
    func didReceive(coordinator: SearchCoordinator, results: [Repository]) {
        startResultsViewController(results: results)
    }
}


