//
//  ListItemViewController.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/20/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let array = ["Alert"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ListItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = self.array[indexPath.row]
        
        return cell
    }
    
}

extension ListItemViewController: UITableViewDelegate {
    
    
    
}
