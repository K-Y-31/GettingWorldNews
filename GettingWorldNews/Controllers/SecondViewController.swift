//
//  SecondViewController.swift
//  GettingWorldNews
//
//  Created by 木本瑛介 on 2021/03/25.
//

import UIKit
import XLPagerTabStrip

class SecondViewController: UIViewController {
    
    var itemInfo: IndicatorInfo = "Second"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SecondViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
