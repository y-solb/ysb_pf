//
//  DetailViewController.swift
//  Table
//
//  Created by bglee on 2018. 10.
//  Copyright © 2018년 bglee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    var receiveItem2 = ""
    
    @IBOutlet var lblItem: UILabel!
    @IBOutlet var imItem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
       imItem.image=UIImage(named:receiveItem2)
    }
    
    func reciveItem(_ item: String)
    {
        receiveItem = item
    }
    func reciveItem2(_ item: String)
    {
        receiveItem2 = item
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


