//
//  AppCoordinator.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var dependencyContainer: DependencyContainerType
    var navigationController: UINavigationController
    
    init(dependencyContainer: DependencyContainerType, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
    }

    func start() {
        let searchCoordinator = SearchCoordinator(dependencyContainer: dependencyContainer, navigationController: navigationController)
        self.childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
    }
}

