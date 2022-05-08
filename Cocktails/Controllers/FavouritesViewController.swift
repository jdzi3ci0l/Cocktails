//
//  FavouritesViewController.swift
//  Cocktails
//
//  Created by Janusz on 02/05/2022.
//

import UIKit

class FavouritesViewController: UIViewController {
    private let favouritesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(FavouriteCocktailTableViewCell.self, forCellReuseIdentifier: FavouriteCocktailTableViewCell.identifier)
        tableView.rowHeight = 150
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        favouritesTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourites"
        view.backgroundColor = .systemBackground
        view.addSubview(favouritesTableView)
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favouritesTableView.frame = view.bounds
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataPersistenceManager.shared.favouriteCocktailsIDs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCocktailTableViewCell.identifier, for: indexPath) as? FavouriteCocktailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.accessoryType = .disclosureIndicator
        
        let id = DataPersistenceManager.shared.favouriteCocktailsIDs[indexPath.row]
        APICaller.shared.getCocktailDetails(byID: id) { [weak cell] result in
            switch result {
            case .success(let cocktail):
                DispatchQueue.main.async {
                    cell?.configure(with: cocktail)
                }
            case .failure:
                break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let cell = tableView.cellForRow(at: indexPath) as? FavouriteCocktailTableViewCell,
            let cocktail = cell.cocktail
        else { return }
        
        let detailVC = CocktailDetailViewController()
        detailVC.configure(with: cocktail)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
