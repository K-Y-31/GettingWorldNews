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
        moveToViewController(at: 3, animated: false)
    }
    
    private func setupUI() {
        settings.style.buttonBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        settings.style.buttonBarItemTitleColor = UIColor.black
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarBackgroundColor = UIColor.black
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarLeftContentInset = 8
        settings.style.buttonBarRightContentInset = 8
        settings.style.buttonBarItemLeftRightMargin = 32
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let general = UIStoryboard(name: "NewsListGeneral", bundle: nil).instantiateViewController(withIdentifier: "General")
        let entertainment = UIStoryboard(name: "NewsListEntertainment", bundle: nil).instantiateViewController(withIdentifier: "Entertainment")
        let business = UIStoryboard(name: "NewsListBusiness", bundle: nil).instantiateViewController(withIdentifier: "Business")
        let technology = UIStoryboard(name: "NewsListTechnology", bundle: nil).instantiateViewController(withIdentifier: "Technology")
        let health = UIStoryboard(name: "NewsListHealth", bundle: nil).instantiateViewController(withIdentifier: "Health")
        let science = UIStoryboard(name: "NewsListScience", bundle: nil).instantiateViewController(withIdentifier: "Science")
        let sports = UIStoryboard(name: "NewsListSports", bundle: nil).instantiateViewController(withIdentifier: "Sports")
        
        let childViewControllers:[UIViewController] = [general, entertainment, business, technology, health, science, sports]
        return childViewControllers
    }
}
