//
//  ViewController.swift
//  Web
//
//  Created by comsoft on 05/11/2019.
//  Copyright © 2019 comsoft. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) { //외부매개변수가 없음
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
        myWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new , context: nil)
        //웹뷰가 데이터를 가져오는지 관찰 관찰자추가 메소드,웹뷰가 로딩?
    }
    
    override func viewDidLoad() { //실행시 보여지는 화면
        super.viewDidLoad()
        loadWebPage("http://blog.naver.com/susy0106")
        // Do any additional setup after loading the view.
    }
    
    //등록한 키패스의 값이 바뀌게 되면 이 메소드 호출
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if myWebView.isLoading {
                myActivityIndicator.startAnimating()
                myActivityIndicator.isHidden = false
            } else {
                myActivityIndicator.stopAnimating()
                myActivityIndicator.isHidden = true
            }
        }
    }

    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://blog.naver.com/susy0106")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.google.co.kr/")
    }

    @IBAction func btnGoSite3(_ sender: UIButton) {
        loadWebPage("https://www.youtube.com")
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

