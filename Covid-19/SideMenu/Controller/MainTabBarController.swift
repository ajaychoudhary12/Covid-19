//
//  MainTabBarController.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

protocol MainTabBarViewControllerDelegate {
    func toggleLeftPanel()
}

class MainTabBarController: UITabBarController {
  
  var sidePanelDelegate: MainTabBarViewControllerDelegate?
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    tabBar.barTintColor = .white
    self.navigationItem.title = "Covid-19"
    self.tabBar.tintColor = .systemPink
    viewControllers = [createHomeNC(), createSocialVC(), createSymptomCheckerVC(), createHealthVC()]
    setupNavBarItem()
  }
  
  private func setupNavBarItem() {
    let button = UIButton(type: .system)
    let image = shrinkImage(image: UIImage(named: "menu")!, scaledToSize: CGSize(width: 30, height: 30))
    button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
    button.imageView?.contentMode = .scaleAspectFill
    button.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
  }
  
  private func shrinkImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
    image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
  }
  
  //MARK: - Logic
  
  @objc private func profileAction() {
    sidePanelDelegate?.toggleLeftPanel()
  }
}

extension MainTabBarController {
  private func createHomeNC() -> UINavigationController {
    let homeVC = HomeVC()
    homeVC.title = "Home"
    homeVC.tabBarItem.image = UIImage(named: "home")
    return UINavigationController(rootViewController: homeVC)
  }
  
  private func createSocialVC() -> UIViewController {
    let socialVC = SocialVC()
    socialVC.title = "Social"
    socialVC.tabBarItem.image = UIImage(named: "globe")
    return socialVC
  }
  
  private func createSymptomCheckerVC() -> UIViewController {
    let symptomCheckerVC = SymptomCheckerVC()
    symptomCheckerVC.title = "Symptom"
    symptomCheckerVC.tabBarItem.image = UIImage(named: "symptom")
    return symptomCheckerVC
  }
  
  private func createHealthVC() -> UINavigationController {
    let healthVC = HealthVC()
    healthVC.title = "Health"
    healthVC.tabBarItem.image = UIImage(named: "health")
    return UINavigationController(rootViewController: healthVC)
  }
}
