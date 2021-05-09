//
//  ViewController.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit
import TinyConstraints

final class SearchViewController: UIViewController {
    
    private let viewModel: SearchViewModelType
    
    private let logoImageView = UIImageView()
    private let infoLabel = UILabel()
    private let textField = UITextField()
    private let searchButton = UIButton()

    init(viewModel: SearchViewModelType) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupLogoImageView()
        setupView()
        setupInfoLabel()
        setupTextfield()
        setupSearchButton()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Github Searcher"
    }
    
    private func addSubviews() {
        [logoImageView, infoLabel, textField, searchButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLogoImageView() {
        logoImageView.bottomToTop(of: infoLabel, offset: -4)
        logoImageView.width(200)
        logoImageView.height(200)
        logoImageView.centerX(to: view)
        
        logoImageView.image = UIImage(named: "github-logo")
    }
    
    private func setupInfoLabel() {
        infoLabel.bottomToTop(of: textField, offset: -4)
        infoLabel.width(300)
        infoLabel.height(88)
        infoLabel.center(in: view)
        infoLabel.textAlignment = .center
        infoLabel.text = "Search for github repository"
    }
    
    private func setupTextfield() {
        textField.center(in: view)
        textField.width(300)
        textField.height(44)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 20
        textField.textAlignment = .center
    }
    
    private func setupSearchButton() {
        searchButton.topToBottom(of: textField, offset: 32)
        searchButton.centerX(to: view)
        searchButton.width(120)
        searchButton.height(44)
        
        searchButton.titleLabel?.textColor = .white
        searchButton.setTitle("SEARCH", for: .normal)
        searchButton.backgroundColor = .black
        searchButton.layer.cornerRadius = 20
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
    }
    
    @objc private func searchTapped() {
        print("\(textField.text)")
    }
}
