//
//  AboutViewController.swift
//  BullsEye
//
//  Created by NGUYENLONGTIEN on 12/4/19.
//  Copyright © 2019 NGUYENLONGTIEN. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        setupLayout()
        // Do any additional setup after loading the view.
    }
    let webViewContainer:WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = UIColor.lightGray
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            let request = URLRequest(url: url)
            webView.load(request)
        }
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    let CloseButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Close", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setBackgroundImage(UIImage(named: "Button-Normal"), for: UIControl.State.normal)
        button.setTitleColor(UIColor(red: 96/255, green: 30/255, blue: 0, alpha: 1), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleClosebutton), for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc func handleClosebutton(){
        navigationController?.popViewController(animated: true)
    }
    func setupLayout(){
        view.addSubview(CloseButton)
        view.addSubview(webViewContainer)
        //but anchor for webViewContainer
        webViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        webViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        webViewContainer.topAnchor.constraint(equalTo: view.topAnchor,constant: 20).isActive = true
        webViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -80).isActive = true
        
        //but anchor for CloseButton
        CloseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        CloseButton.topAnchor.constraint(equalTo: webViewContainer.bottomAnchor,constant: 20).isActive = true
        CloseButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        CloseButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
