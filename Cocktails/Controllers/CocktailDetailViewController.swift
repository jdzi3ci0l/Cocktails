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
                glassTypeLabel.text = "Glass: \(glass)"
            }
        }
    }
    
    private var keysArray: [String]  {
        Array((cocktail?.ingredients.keys)!)
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
        label.adjustsFontSizeToFitWidth = true
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
    
    
    private let ingredientsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: IngredientTableViewCell.identifier)
        tableView.rowHeight = 30
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(cocktailImageView)
        view.addSubview(nameLabel)
        view.addSubview(alcoholCategoryLabel)
        view.addSubview(categoryLabel)
        view.addSubview(glassTypeLabel)
        view.addSubview(ingredientsTableView)
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cocktailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cocktailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cocktailImageView.heightAnchor.constraint(equalToConstant: 350),
            
            nameLabel.topAnchor.constraint(equalTo: cocktailImageView.bottomAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            alcoholCategoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            categoryLabel.topAnchor.constraint(equalTo: alcoholCategoryLabel.bottomAnchor, constant: 5),
            
            glassTypeLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            
            ingredientsTableView.topAnchor.constraint(equalTo: glassTypeLabel.bottomAnchor),
            ingredientsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ingredientsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ingredientsTableView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configure(with cocktail: Cocktail) {
        self.cocktail = cocktail
    }
}

extension CocktailDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredients"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktail?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier) as? IngredientTableViewCell else {
            return UITableViewCell()
        }
        
        let ingredient = keysArray[indexPath.row]
        cell.configure(with: ingredient, amount: cocktail?.ingredients[ingredient] ?? "")
        return cell
    }
}
