//
//  TabBarViewController.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        // MARK: Create instance of viewControllers
        navigationController?.isNavigationBarHidden = true
        let homeViewController = ExploreViewController()
        let favoriteViewController = FavouriteViewController()
        let notificationViewController = NotificationViewController()
        let chatViewController = ChatViewController()
        let cartViewController = CartViewController()
        // MARK: Assign viewController to tab Bar
        self.setViewControllers([homeViewController, favoriteViewController, cartViewController, notificationViewController, chatViewController], animated: false)
        guard let items = self.tabBar.items else { return }
        let images = ["house.fill", "heart.fill","bag.fill", "bell.fill", "message.fill"]
        for item in 0...4 {
            items[item].image = UIImage(systemName: images[item])
        }
        // MARK: Changing tint Color
        self.tabBar.tintColor = .systemGreen
        tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.backgroundColor = .white
        
    }
}
