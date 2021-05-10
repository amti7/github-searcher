//
//  ResultsCoordintaor.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

class ResultsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    private var results: [Repository]
        
    init(navigationController: UINavigationController, results: [Repository]) {
        self.navigationController = navigationController
        self.results = results
    }
                
    func start() {
        let viewModel = ResultsViewModel(results: results)
        let viewController = ResultsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
