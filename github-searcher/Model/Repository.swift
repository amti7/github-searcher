//
//  Repository.swift
//  github-searcher
//
//  Created by Kamil on 10/05/2021.
//

import Foundation

struct Repository: Codable {
    let htmlUrl: URL
    let fullName: String
    let language: String?
    let stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
        case htmlUrl = "html_url"
        case fullName = "full_name"
        case language
        case stargazersCount = "stargazers_count"
    }
}
