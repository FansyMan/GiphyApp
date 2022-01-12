//
//  SearchViewController.swift
//  GiphyApp
//
//  Created by Surgeont on 12.01.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Search for GIF"
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("Search", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(searchGif), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints =  false
        return button
    }()
    
    private let gifCollectionView = GifCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setConstraints()
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(gifCollectionView)
    }
    
    @objc private func searchGif() {
        guard let searchText = searchTextField.text else { return }
        loadGifs(searchText: searchText)
    }
    
    // MARK: - LoadGifs
    private func loadGifs(searchText: String) {
        let urlString = "https://api.giphy.com/v1/gifs/search?api_key=\(apiKey)&q=\(searchText)&limit=25&offset=0&rating=g&lang=en"
        GetGIFManager.shared.getGifUrls(urlString: urlString) { [weak self] gifs, error in
            if error == nil {
                guard let gifs = gifs else { return }
                let urlData: [Datum] = gifs.results
                let urls: [String] = urlData.map{String($0.imagesInfo.lowGif.url) }
                self?.gifCollectionView.gifURLs = urls
                self?.gifCollectionView.reloadData()
            } else {
                print(error!)
            }
        }
    }
}

// MARK: - Constraints
extension SearchViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3),
            searchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            gifCollectionView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 10),
            gifCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gifCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            gifCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
        ])
    }
}
