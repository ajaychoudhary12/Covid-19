//
//  SocialCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 08/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit
import WebKit

class SocialCell: UICollectionViewCell {
  
  private let webView = WKWebView()
  var urlString: String? {
    didSet {
      guard let urlString = urlString else { return }
      guard let url = URL(string: urlString) else { return }
      webView.load(URLRequest(url: url))
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    setupWebView()
  }
  
  private func setupWebView() {
    addSubview(webView)
    webView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = webView.topAnchor.constraint(equalTo: topAnchor)
    let leading = webView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let trailing = webView.trailingAnchor.constraint(equalTo: trailingAnchor)
    let bottom = webView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
  }
  
}
