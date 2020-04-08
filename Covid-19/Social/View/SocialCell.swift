//
//  SocialCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 08/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit
import WebKit

protocol WebViewDelegate {
  func didFinish()
  func didFail()
}

class SocialCell: UICollectionViewCell {
  
  var delegate: WebViewDelegate?
  
  private let webView = WKWebView()
  var urlString: String? {
    didSet {
      guard let urlString = urlString else { return }
      guard let url = URL(string: urlString) else { return }
      let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 0.5)
      webView.load(urlRequest)
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
    backgroundColor = .systemGroupedBackground
    setupWebView()
  }
  
  private func setupWebView() {
    addSubview(webView)
    webView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = webView.topAnchor.constraint(equalTo: topAnchor)
    let leading = webView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4)
    let trailing = webView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
    let bottom = webView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    webView.navigationDelegate = self
    webView.allowsBackForwardNavigationGestures = false
  }
  
}

extension SocialCell: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    delegate?.didFinish()
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    delegate?.didFail()
  }
}
