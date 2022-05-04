//
//  MainTabBarController.swift
//  Cocktails
//
//  Created by Janusz on 02/05/2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: FavouritesViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: NearMeViewController())
        
        vc1.title = "Home"
        vc2.title = "Favourites"
        vc3.title = "Search"
        vc4.title = "Near me"
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
       // vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "heart")
       // vc2.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
       // vc4.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        vc4.tabBarItem.image = UIImage(systemName: "location.circle")
       // vc4.tabBarItem.selectedImage = UIImage(systemName: "location.circle.fill")
        
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        
        for vc in [vc1, vc2, vc3, vc4] {
            vc.overrideUserInterfaceStyle = .dark
        }
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
