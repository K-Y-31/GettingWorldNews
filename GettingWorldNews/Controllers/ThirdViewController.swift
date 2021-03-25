//
//  ThirdViewController.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/25.
//

import UIKit
import XLPagerTabStrip

class ThirdViewController: UIViewController {
     
    var ItemInfo: IndicatorInfo = "Third"
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ThirdViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return ItemInfo
    }
}
