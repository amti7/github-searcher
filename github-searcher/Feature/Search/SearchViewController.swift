//
//  ViewController.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private let viewModel: SearchViewModelType

    init(viewModel: SearchViewModelType) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
    }
}
