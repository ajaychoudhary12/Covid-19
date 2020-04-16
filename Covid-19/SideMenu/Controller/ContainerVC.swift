//
//  ContainerVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
  
  private var tabViewController: MainTabBarController!
  private var tabNavigationController: UINavigationController!
  private var expanded = false
  private var leftVC: SideMenuVC?
  private let centerPanelExpandedOffset: CGFloat = 90
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    tabViewController = MainTabBarController()
    tabViewController.sidePanelDelegate = self
    
    tabNavigationController = UINavigationController(rootViewController: tabViewController)
    tabNavigationController.navigationBar.barTintColor = .white
    tabNavigationController.view.backgroundColor = .red
    view.addSubview(tabNavigationController.view)
    addChild(tabNavigationController)
    tabNavigationController.didMove(toParent: self)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true
  }
   
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.navigationBar.isHidden = false
  }
}

extension ContainerVC: MainTabBarViewControllerDelegate {
  
  func toggleLeftPanel() {
      let notAlreadyExpanded = (expanded != true)
      if notAlreadyExpanded {
          addLeftVC()
      }
      animateLeftPanel(shouldExpand: notAlreadyExpanded)
  }
  
  func addLeftVC() {
      guard leftVC == nil else { return }
      let vc = SideMenuVC()
      addChildSidePanelController(vc)
      leftVC = vc
  }
  
  func addChildSidePanelController(_ leftViewController: SideMenuVC) {
    view.insertSubview(leftViewController.view, at: 0)

    addChild(leftViewController)
    leftViewController.didMove(toParent: self)
  }
  
  func animateLeftPanel(shouldExpand: Bool) {
    if shouldExpand {
      expanded = true
      animateCenterPanelXPosition(targetPosition: tabNavigationController.view.frame.width - centerPanelExpandedOffset)
    } else {
      animateCenterPanelXPosition(targetPosition: 0) { _ in
        self.expanded = false
        self.leftVC?.view.removeFromSuperview()
        self.leftVC = nil
      }
    }
  }
  
  func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.tabNavigationController.view.frame.origin.x = targetPosition
      },
      completion: completion)
  }
  
}
