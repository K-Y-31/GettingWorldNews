//
//  MainTabBarController.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/25.
//

import UIKit
import XLPagerTabStrip

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var viewControllers = [UIViewController]()
        
        let tab1VC = UIStoryboard(name: "Japan", bundle: nil).instantiateInitialViewController()
        tab1VC?.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        viewControllers.append(tab1VC!)
        
        let tab2VC = UIStoryboard(name: "World", bundle: nil).instantiateInitialViewController()
        tab2VC?.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        viewControllers.append(tab2VC!)
        
        self.setViewControllers(viewControllers, animated: false)
    }
}
