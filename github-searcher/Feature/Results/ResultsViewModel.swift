//
//  ResultsViewModel.swift
//  github-searcher
//
//  Created by Kamil on 10/05/2021.
//

import Foundation

protocol ResultsViewModelType {
    func numberOfItems() -> Int
    func getItem(index: Int) -> Repository
}

final class ResultsViewModel: ResultsViewModelType {
    
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
}
