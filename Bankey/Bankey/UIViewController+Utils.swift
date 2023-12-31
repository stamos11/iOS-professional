//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by stamoulis nikolaos on 31/12/23.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(imagename: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imagename, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
