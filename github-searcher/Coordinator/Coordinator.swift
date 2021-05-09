//
//  Coordinator.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var dependencyContainer: DependencyContainerType { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
