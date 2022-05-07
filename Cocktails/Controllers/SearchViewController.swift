//
//  SearchViewController.swift
//  Cocktails
//
//  Created by Janusz on 02/05/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchController = UISearchController()
    
    private static let reuseIdentifier = "ResultsCell"
    
    private let resultsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return tableView
    }()
    
    var cocktails: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        
        view.addSubview(resultsTableView)
        
        searchController.searchResultsUpdater = self
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultsTableView.frame = view.bounds
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text, !query.isEmpty {
            APICaller.shared.getCocktails(byName: query) { [weak self] result in
                switch result {
                case .success(let cocktails):
                    DispatchQueue.main.async {
                        self?.cocktails = cocktails
                        self?.resultsTableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewController.reuseIdentifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = cocktails[indexPath.row].name
        return cell
    }
}
