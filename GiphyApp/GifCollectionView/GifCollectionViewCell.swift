//
//  GifCollectionViewCell.swift
//  GiphyApp
//
//  Created by Surgeont on 12.01.2022.
//

import UIKit

final class GifCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "GifCollectionViewCell"
    
    private let gifImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(gifImageView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gifImageView.image = nil
    }
    
    func setupCell(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        LoadAndCashImages.shared.itemloadImage(url: url) { image in
            self.gifImageView.image = image
        }
    }
}

extension GifCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            gifImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            gifImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            gifImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            gifImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
