//
//  ResultsViewModel.swift
//  github-searcher
//
//  Created by Kamil on 10/05/2021.
//

import Foundation

protocol ResultsViewModelDelegate: AnyObject {
    func didSelectRepo(_ viewModel: ResultsViewModelType, repoURL: URL)
}

protocol ResultsViewModelType {
    var delegate: ResultsViewModelDelegate? { get set }
    
    func numberOfItems() -> Int
    func getItem(index: Int) -> Repository
    func didSelectRow(index: Int)
}

final class ResultsViewModel: ResultsViewModelType {
    
    weak var delegate: ResultsViewModelDelegate?
    
    private var results: [Repository]
    
    init(results: [Repository]) {
        self.results = results
    }
    
    func numberOfItems() -> Int {
        results.count
    }
    
    func getItem(index: Int) -> Repository {
        results[index]
    }
    
    func didSelectRow(index: Int) {
        delegate?.didSelectRepo(self, repoURL: results[index].htmlUrl)
    }
}

