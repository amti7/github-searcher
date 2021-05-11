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
    
    private struct Constants {
        static let buttonWidth: CGFloat = 120
        static let imageSize: CGFloat = 200
        static let textFieldWidth: CGFloat = 300
        static let elementHeight: CGFloat = 44
        static let borderWidth: CGFloat = 1.0
        static let tinyOffset: CGFloat = 4
        static let smallOffset: CGFloat = 8
        static let bigOffset: CGFloat = 32
        static let cornerRadius: CGFloat = 20
        static let githubIconName = "github-logo"
        static let labelTitle = "Search for github repository"
        static let searchString = "SEARCH"
        static let title = "Github Searcher"
        static let errorMessage = "You cannot provide empty name"
    }
    
    private var viewModel: SearchViewModelType
    
    private let logoImageView = UIImageView()
    private let infoLabel = UILabel()
    private let textField = UITextField()
    private let errorLabel = UILabel()
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
        setupErrorLabel()
        setupSearchButton()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = Constants.title
    }
    
    private func addSubviews() {
        [logoImageView, infoLabel, textField, errorLabel, searchButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLogoImageView() {
        logoImageView.bottomToTop(of: infoLabel, offset: -Constants.tinyOffset)
        logoImageView.width(Constants.imageSize)
        logoImageView.height(Constants.imageSize)
        logoImageView.centerX(to: view)
        
        logoImageView.image = UIImage(named: Constants.githubIconName)
    }
    
    private func setupInfoLabel() {
        infoLabel.bottomToTop(of: textField, offset: -Constants.tinyOffset)
        infoLabel.width(Constants.textFieldWidth)
        infoLabel.height(Constants.elementHeight * 2)
        infoLabel.center(in: view)
        infoLabel.textAlignment = .center
        infoLabel.text = Constants.labelTitle
    }
    
    private func setupTextfield() {
        textField.center(in: view)
        textField.width(Constants.textFieldWidth)
        textField.height(Constants.elementHeight)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = Constants.borderWidth
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.textAlignment = .center
    }
    
    private func setupErrorLabel() {
        errorLabel.topToBottom(of: textField)
        errorLabel.centerX(to: view)
        errorLabel.width(Constants.textFieldWidth)
        errorLabel.height(Constants.elementHeight)
        errorLabel.textColor = .systemRed
        errorLabel.textAlignment = .center
    }
    
    private func setupSearchButton() {
        searchButton.topToBottom(of: errorLabel, offset: Constants.smallOffset)
        searchButton.centerX(to: view)
        searchButton.width(Constants.buttonWidth)
        searchButton.height(Constants.elementHeight)
        
        searchButton.titleLabel?.textColor = .white
        searchButton.setTitle(Constants.searchString, for: .normal)
        searchButton.backgroundColor = .black
        searchButton.layer.cornerRadius = Constants.cornerRadius
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
    }
    
    @objc private func searchTapped() {
        viewModel.search(repoName: textField.text ?? "")
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func didReceive(_ viewModel: SearchViewModelType, results: [Repository]) {
        delegate?.didReceive(viewController: self, results: results)
        
        textField.layer.borderColor = UIColor.black.cgColor
        errorLabel.text = ""
    }
    
    func didEmptyTextfield(_ viewModel: SearchViewModelType) {
        textField.layer.borderColor = UIColor.systemRed.cgColor
        errorLabel.text = Constats.errorMessage
    }
}
