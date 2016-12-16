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
        self.addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updateAt), options: [.old, .new], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateConfiguration(_ sender: Any) {
        configurationManager.updateConfiguration()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updateAt) {
            timerLabel.text = configurationManager.updateAt
        }
    }

}
