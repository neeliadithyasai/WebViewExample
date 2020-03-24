//
//  historyViewController.swift
//  WebViewExample
//
//  Created by adithyasai neeli on 2020-03-24.
//  Copyright © 2020 moxDroid. All rights reserved.
//

import UIKit
import WebKit

class historyViewController: UIViewController {

    var History :WKBackForwardList?;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
    
   extension historyViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return History!.backList.count;
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        
        cell.textLabel?.text = History!.backList[indexPath.row].title;

        // Configure the cell...
        return cell
    }

}


