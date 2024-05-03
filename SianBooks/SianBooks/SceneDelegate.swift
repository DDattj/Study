//
//  SceneDelegate.swift
//  SianBooks
//
//  Created by 이시안 on 5/1/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        setTabBar()
        window?.makeKeyAndVisible()
    }
    
    func setTabBar(){
        let tabBar = UITabBarController()
        
        let MainVC = MainViewController()
        let mainNavController = UINavigationController(rootViewController: MainVC)
        mainNavController.navigationBar.setBackgroundImage(UIImage(), for: .default) // 네비게이션컨트롤러 없애고 싶으면 네비게이션 컨트롤러를 불러와준 후 배경을 투명하게 만들면 된다!
        MainVC.tabBarItem = UITabBarItem(title: "도서관", image: UIImage(systemName: "books.vertical"), tag: 0)
        
        let MyVC = MyPageViewController()
        let myNavController = UINavigationController(rootViewController: MyVC)
        myNavController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        MyVC.tabBarItem = UITabBarItem(title: "내 서재", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        
        tabBar.viewControllers = [mainNavController, myNavController]
        tabBar.selectedIndex = 0
        
        window?.rootViewController = tabBar
    }
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    
}

