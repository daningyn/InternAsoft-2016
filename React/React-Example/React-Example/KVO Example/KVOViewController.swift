//
//  KVOViewController.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/16/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class KVOViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateConfiguration(_ sender: Any) {
        configurationManager.updateConfiguration()
    }

}
