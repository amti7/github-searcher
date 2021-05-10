//
//  ViewController.swift
//  github-searcher
//
//  Created by Kamil on 09/05/2021.
//

import UIKit
import TinyConstraints

protocol SearchViewControllerDelegate: AnyObject {
    func didReceive(viewController: SearchViewController, results: [Repository])
}

final class SearchViewController: UIViewController {
    
    weak var delegate: SearchViewControllerDelegate?
    
    private struct Constats {
        static let buttonWidth: CGFloat = 120
        static let imageSize: CGFloat = 200
        static let textFieldWidth: CGFloat = 300
        static let elementHeight: CGFloat = 44
        static let borderWidth: CGFloat = 1.0
        static let tinyOffset: CGFloat = 4
        static let bigOffset: CGFloat = 32
        static let cornerRadius: CGFloat = 20
        static let githubIconName = "github-logo"
        static let labelTitle = "Search for github repository"
        static let searchString = "SEARCH"
    }
    
    private var viewModel: SearchViewModelType
    
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
        logoImageView.bottomToTop(of: infoLabel, offset: -Constats.tinyOffset)
        logoImageView.width(Constats.imageSize)
        logoImageView.height(Constats.imageSize)
        logoImageView.centerX(to: view)
        
        logoImageView.image = UIImage(named: Constats.githubIconName)
    }
    
    private func setupInfoLabel() {
        infoLabel.bottomToTop(of: textField, offset: -Constats.tinyOffset)
        infoLabel.width(Constats.textFieldWidth)
        infoLabel.height(Constats.elementHeight * 2)
        infoLabel.center(in: view)
        infoLabel.textAlignment = .center
        infoLabel.text = Constats.labelTitle
    }
    
    private func setupTextfield() {
        textField.center(in: view)
        textField.width(Constats.textFieldWidth)
        textField.height(Constats.elementHeight)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = Constats.borderWidth
        textField.layer.cornerRadius = Constats.cornerRadius
        textField.textAlignment = .center
    }
    
    private func setupSearchButton() {
        searchButton.topToBottom(of: textField, offset: Constats.bigOffset)
        searchButton.centerX(to: view)
        searchButton.width(Constats.buttonWidth)
        searchButton.height(Constats.elementHeight)
        
        searchButton.titleLabel?.textColor = .white
        searchButton.setTitle(Constats.searchString, for: .normal)
        searchButton.backgroundColor = .black
        searchButton.layer.cornerRadius = Constats.cornerRadius
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
    }
    
    @objc private func searchTapped() {
        viewModel.search(repoName: textField.text ?? "")
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func didReceive(_ viewModel: SearchViewModelType, results: [Repository]) {
        delegate?.didReceive(viewController: self, results: results)
    }
}
