//
//  SceneDelegate.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = createTabBarController()
    window?.makeKeyAndVisible()
  }
  
  private func createHomeNC() -> UINavigationController {
    let homeVC = HomeVC()
    homeVC.title = "Home"
    homeVC.tabBarItem.image = UIImage(named: "home")
    return UINavigationController(rootViewController: homeVC)
  }
  
  private func createSocialVC() -> UIViewController {
    let socialVC = SocialVC()
    socialVC.title = "Social"
    socialVC.tabBarItem.image = UIImage(named: "earth")
    return socialVC
  }
  
  private func createHealthVC() -> UINavigationController {
    let healthVC = HealthVC()
    healthVC.title = "Health"
    healthVC.tabBarItem.image = UIImage(named: "update")
    return UINavigationController(rootViewController: healthVC)
  }
  
  private func createTabBarController() -> UITabBarController {
    let tabBar = UITabBarController()
    UITabBar.appearance().tintColor = .systemPink
    tabBar.viewControllers = [createHomeNC(), createSocialVC(), createHealthVC()]
    return tabBar
  }

}
