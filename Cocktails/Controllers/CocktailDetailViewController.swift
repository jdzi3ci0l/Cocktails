//
//  CocktailDetailViewController.swift
//  Cocktails
//
//  Created by Janusz on 07/05/2022.
//

import UIKit
import SDWebImage

class CocktailDetailViewController: UIViewController {
    
    private var cocktail: Cocktail? {
        didSet {
            title = cocktail?.name
            nameLabel.text = cocktail?.name
            if let imageURL = cocktail?.imageURL, let url = URL(string: imageURL) {
                cocktailImageView.sd_setImage(with: url)
            }
            if let alcoholCategory = cocktail?.alcoholCategory {
                var alcoholCategoryEmoji = ""
                
                switch alcoholCategory {
                case .alcoholic:
                    alcoholCategoryEmoji = "✅"
                case .nonAlcoholic:
                    alcoholCategoryEmoji = "❌"
                case .optional:
                    alcoholCategoryEmoji = "✅ / ❌"
                }
                alcoholCategoryLabel.text = "Alcohol: \(alcoholCategoryEmoji)"
            }
            
            if let category = cocktail?.category {
                categoryLabel.text = "Category: \(category.rawValue)"
            }
            
            if let glass = cocktail?.glass {
                categoryLabel.text = "Glass: \(glass)"
            }
        }
    }
    
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let alcoholCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let glassTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(cocktailImageView)
        view.addSubview(nameLabel)
        view.addSubview(alcoholCategoryLabel)
        view.addSubview(categoryLabel)
        view.addSubview(glassTypeLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cocktailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cocktailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cocktailImageView.heightAnchor.constraint(equalToConstant: 350),
            
            nameLabel.topAnchor.constraint(equalTo: cocktailImageView.bottomAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            alcoholCategoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            categoryLabel.topAnchor.constraint(equalTo: alcoholCategoryLabel.bottomAnchor, constant: 5),
            
            glassTypeLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5)
            ])
    }
    
    func configure(with cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
}
