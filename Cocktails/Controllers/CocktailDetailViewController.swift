//
//  CocktailDetailViewController.swift
//  Cocktails
//
//  Created by Janusz on 07/05/2022.
//

import UIKit

class CocktailDetailViewController: UIViewController {
    
    private var cocktail: Cocktail? {
        didSet {
            nameLabel.text = cocktail?.name
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.backgroundColor = .systemBackground
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    func configure(with cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
}
