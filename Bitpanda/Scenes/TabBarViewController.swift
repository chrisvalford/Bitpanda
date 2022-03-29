//
//  TabBarViewController.swift
//  Bitpanda
//
//  Created by Christopher Alford on 24/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if self.traitCollection.userInterfaceStyle == .dark {
            self.view.backgroundColor = .darkGray
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: Need correctly scaled images for the tab bar
        let avc = AssetsViewController()
        //avc.title = "Assets"
        let anc = BitpandaNavigationController(rootViewController: avc)
        let tabOne = anc //AssetsViewController()
        let tabOneBarItem = UITabBarItem(title: "Assets", image: UIImage(named: "commodities"), selectedImage: UIImage(named: "commodities-fil"))
        tabOne.tabBarItem = tabOneBarItem
        
        let wvc = WalletsViewController()
        wvc.title = "Wallets"
        let wnc = BitpandaNavigationController(rootViewController: wvc)
        let tabTwo = wnc
        let tabTwoBarItem2 = UITabBarItem(title: "Wallets", image: UIImage(named: "wallet"), selectedImage: UIImage(named: "wallet.fill"))
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Nothing to do at present :)
    }
}
