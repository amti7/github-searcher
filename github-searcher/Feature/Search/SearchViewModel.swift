//
//  SearchViewModel.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func didReceive(_ viewModel: SearchViewModelType, results: [Repository])
}

protocol SearchViewModelType {
    var delegate: SearchViewModelDelegate? { get set }
    
    func search(repoName: String)
}

final class SearchViewModel: SearchViewModelType {
    
    weak var delegate: SearchViewModelDelegate?
    
    private struct Constants {
        static let hostNameString = "HostName"
        static let endpointString = "/search/repositories"
        static let repoParam = "?q="
    }
    
    func search(repoName: String) {
        guard let hostName = Bundle.main.object(forInfoDictionaryKey: Constants.hostNameString) as? String else { return }
        let string = hostName + Constants.endpointString + Constants.repoParam + repoName
        guard let url = URL(string: string), let data = try? Data(contentsOf: url) else { return }
        
        let decoder = JSONDecoder()
        
        if let json = try? decoder.decode(SearchResult.self, from: data) {
            delegate?.didReceive(self, results: json.items)
        }
    }
}
