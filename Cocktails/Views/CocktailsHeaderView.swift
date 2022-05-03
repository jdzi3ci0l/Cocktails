//
//  CocktailsHeaderView.swift
//  Cocktails
//
//  Created by Janusz on 03/05/2022.
//

import UIKit

class CocktailsHeaderView: UIView {
    
    let cocktailsImageView: UIImageView = {
        //Photo by Bogdan Yukhymchuk @yuhy on Unsplash
        let imageView = UIImageView(image: UIImage(named: "cocktails"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        button.layer.borderColor = UIColor.systemCyan.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cocktailsImageView)
        addSubview(randomButton)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            randomButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            randomButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            randomButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cocktailsImageView.frame = bounds
    }
}
