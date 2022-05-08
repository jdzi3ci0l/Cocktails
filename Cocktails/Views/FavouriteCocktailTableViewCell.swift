//
//  FavouriteCocktailTableViewCell.swift
//  Cocktails
//
//  Created by Janusz on 08/05/2022.
//

import UIKit

class FavouriteCocktailTableViewCell: UITableViewCell {
    
    static let identifier = "FavouriteCocktailTableViewCell"
    
    var cocktail: Cocktail?
    
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cocktailImageView)
        contentView.addSubview(cocktailNameLabel)
        backgroundColor = .systemBackground
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            cocktailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cocktailImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            cocktailImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            cocktailImageView.widthAnchor.constraint(equalToConstant: 130),
            
            cocktailNameLabel.leadingAnchor.constraint(equalTo: cocktailImageView.trailingAnchor, constant: 20),
            cocktailNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cocktailNameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with cocktail: Cocktail) {
        guard let imageURL = URL(string: cocktail.imageURL) else { return }
        cocktailImageView.sd_setImage(with: imageURL)
        cocktailNameLabel.text = cocktail.name
        self.cocktail = cocktail
    }
}
