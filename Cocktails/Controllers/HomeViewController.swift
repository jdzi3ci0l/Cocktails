//
//  ViewController.swift
//  Cocktails
//
//  Created by Janusz on 02/05/2022.
//

import UIKit


class HomeViewController: UIViewController {
    private enum Sections: Int {
        case Vodka = 0
        case Gin = 1
        case Tequila = 2
        case NonAlcoholic = 3
        case OptionalAcohol = 4
        case Shots = 5
        case SoftDrinks = 6
        case PartyDrinks = 7
        case CoffeeTea = 8
        case Beer = 9
        case HomemadeLiqueur = 10
        case Shake = 11
    }
    
    private let homeFeedTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    let sectionTitles = ["Vodka", "Gin", "Tequila", "Non-Alcoholic", "Optional Alcohol", "Shots", "Soft Drinks", "Party Drinks", "Coffee / Tea", "Beer", "Homemade Liqueur", "Shake"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeFeedTableView)
        
        homeFeedTableView.delegate = self
        homeFeedTableView.dataSource = self
        
        let headerView = CocktailsHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        headerView.delegate = self
        homeFeedTableView.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
    
        cell.delegate = self
        
        switch indexPath.section {
        case Sections.Vodka.rawValue:
            APICaller.shared.getCocktails(containing: "Vodka") { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Gin.rawValue:
            APICaller.shared.getCocktails(containing: "Gin") { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Tequila.rawValue:
            APICaller.shared.getCocktails(containing: "Tequila") { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.NonAlcoholic.rawValue:
            APICaller.shared.getCocktails(byAlcoholCategory: .nonAlcoholic) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.OptionalAcohol.rawValue:
            APICaller.shared.getCocktails(byAlcoholCategory: .optional) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Shots.rawValue:
            APICaller.shared.getCocktails(byCategory: .shot) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.SoftDrinks.rawValue:
            APICaller.shared.getCocktails(byCategory: .soft) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.PartyDrinks.rawValue:
            APICaller.shared.getCocktails(byCategory: .party) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.CoffeeTea.rawValue:
            APICaller.shared.getCocktails(byCategory: .coffeeOrTea) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Beer.rawValue:
            APICaller.shared.getCocktails(byCategory: .beer) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.HomemadeLiqueur.rawValue:
            APICaller.shared.getCocktails(byCategory: .homemadeLiqueur) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Shake.rawValue:
            APICaller.shared.getCocktails(byCategory: .shake) { result in
                switch result {
                case .success(let cocktails):
                    cell.configure(with: cocktails)
                case .failure(let error):
                    print(error)
                }
            }
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCell(_ cell: CollectionViewTableViewCell, selectedCocktail: Cocktail) {
        DispatchQueue.main.async {
            let detailVC = CocktailDetailViewController()
            detailVC.configure(with: selectedCocktail)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension HomeViewController: CocktailsHeaderViewDelegate {
    func didTapRandomButton(result: Cocktail) {
        DispatchQueue.main.async {
            let detailVC = CocktailDetailViewController()
            detailVC.configure(with: result)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
