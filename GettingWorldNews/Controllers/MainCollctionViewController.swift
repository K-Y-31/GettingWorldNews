//
//  TopBarButtonCollectionView.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/25.
//

import UIKit
import XLPagerTabStrip

class MainCollectionView: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        setupUI()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToViewController(at: 0, animated: false)
        moveToViewController(at: 1, animated: false)
        moveToViewController(at: 2, animated: false)
    }
    
    private func setupUI() {
        settings.style.buttonBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        settings.style.buttonBarItemTitleColor = UIColor.lightGray
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarBackgroundColor = UIColor.black
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarLeftContentInset = 8
        settings.style.buttonBarRightContentInset = 8
        settings.style.buttonBarItemLeftRightMargin = 32
        
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let firstVC = UIStoryboard(name: "NewsList", bundle: nil).instantiateViewController(withIdentifier: "First")
        let secondVC = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: "Second")
        let thirdVC = UIStoryboard(name: "Third", bundle: nil).instantiateViewController(withIdentifier: "Third")
        
        let childViewControllers:[UIViewController] = [firstVC, secondVC, thirdVC]
        return childViewControllers
    }
}
