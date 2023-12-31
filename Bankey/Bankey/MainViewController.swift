//
//  MainViewController.swift
//  Bankey
//
//  Created by stamoulis nikolaos on 31/12/23.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTabBarImage(imagename: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imagename: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imagename: "ellipsis.circle", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
    }
    private func hideNavigationBarLine(_ navigarionBar: UINavigationBar) {
        let img = UIImage()
        navigarionBar.shadowImage = img
        navigarionBar.setBackgroundImage(img, for: .default)
        navigarionBar.isTranslucent = false
    }
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
    
    
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
