//
//  ResultsCoordintaor.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

class ResultsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var dependencyContainer: DependencyContainerType
    var navigationController: UINavigationController
        
    init(dependencyContainer: DependencyContainerType, navigationController: UINavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
    }
                
    func start() {
        let viewController = ResultsViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
