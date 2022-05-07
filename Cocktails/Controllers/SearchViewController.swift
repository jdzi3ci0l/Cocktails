//
//  SearchViewController.swift
//  Cocktails
//
//  Created by Janusz on 02/05/2022.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController()

    var cocktails: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
}
