//
//  ViewController.swift
//  WebViewExample
//
//  Created by moxDroid on 2020-03-24.
//  Copyright © 2020 moxDroid. All rights reserved.
//

import UIKit
//Need to use
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLambtonUrl()
    }
    
    
    func loadLambtonUrl()
    {
        let url = URL(string: "https://www.lambtoncollege.ca/")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
    }
    
    func loadHtmlString()
    {
        let htmlString = "<h1>Hello World</h1>"
        myWebKitView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    
    

    @IBAction func btnNavigation(_ sender: UIBarButtonItem)
    {
        switch sender.tag {
        case 0://Home Button is pressed
             loadLambtonUrl()
        case 1://Prev Button is pressed
            if myWebKitView.canGoBack
            {
                print("Go back")
                myWebKitView.goBack()
            }else
            {
                print("Can't Go back")
            }
        case 2://next Button is pressed
            if myWebKitView.canGoForward
            {
               print("Go Next")
                myWebKitView.goForward()
            }
            else
            {
                print("Can't Go Next")
            }
        case 3:// refresh button is pressed
            
                myWebKitView.reload()
        default:
            print("No Navigation action found...")
        }
    }
    
    
    @IBAction func btnHistoryClick(_ sender: UIBarButtonItem) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil);
          let HistoryTableViewController = storyBoard.instantiateViewController(withIdentifier: "HistoryTableViewController") as! historyViewController;
          
          HistoryTableViewController.History = myWebKitView.backForwardList;
          
          navigationController?.show(HistoryTableViewController, sender: self);
    }
    
    
}

