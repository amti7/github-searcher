//
//  SearchResult.swift
//  github-searcher
//
//  Created by Kamil on 10/05/2021.
//

import Foundation

struct SearchResult: Codable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
