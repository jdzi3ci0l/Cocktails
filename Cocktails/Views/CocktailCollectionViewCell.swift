//
//  CocktailCollectionViewCell.swift
//  Cocktails
//
//  Created by Janusz on 03/05/2022.
//

import UIKit
import SDWebImage

class CocktailCollectionViewCell: UICollectionViewCell {
    static let identifier = "CocktailCollectionViewCell"
    
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cocktailImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cocktailImageView.frame = contentView.bounds
    }
    
    func configure(with cocktail: Cocktail) {
        guard let imageURL = cocktail.imageURL, let url = URL(string: imageURL) else { return }
        cocktailImageView.sd_setImage(with: url)
    }
}
