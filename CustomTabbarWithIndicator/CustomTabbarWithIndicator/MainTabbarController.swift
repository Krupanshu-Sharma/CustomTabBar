//
//  MainTabbarController.swift
//  CustomTabbarWithIndicator
//
//  Created by Krupanshu Sharma on 08/12/22.
//

import Foundation
import UIKit

class MainTabbarController: UITabBarController {
    
    // MARK: - Properties
    var upperLineView: UIView!
    let spacing: CGFloat = 12
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        self.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    
    // MARK: - Helpers

    func configureViewControllers() {
        
        let home =  templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "home_unselected"), selectedImage: UIImage(imageLiteralResourceName: "home_selected"), rootViewController: ViewControllerA())
        let search = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "search_unselected"), selectedImage: UIImage(imageLiteralResourceName: "search_selected"), rootViewController: ViewControllerB())
        let notifications = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "like_unselected"), selectedImage: UIImage(imageLiteralResourceName: "like_selected"), rootViewController: ViewControllerC())
        let profile = templateNavigationController(unselectedImage: UIImage(imageLiteralResourceName: "profile_unselected"), selectedImage: UIImage(imageLiteralResourceName: "profile_selected"), rootViewController: ViewControllerD())
        
        viewControllers = [home,search,notifications,profile]
        
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .white
    }

    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime{
            upperLineView.removeFromSuperview()
        }
        upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 4))
        upperLineView.backgroundColor = UIColor.systemPink
        tabBar.addSubview(upperLineView)
    }
}

extension MainTabbarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
