//
//  CarViewController.swift
//  MVVMDemo
//
//  Created by Danh Nguyen on 12/18/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    internal let arrayCar = AppDelegate.shareInstanced.cars

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        let carViewModel = self.arrayCar[indexPath.row]
        cell.textLabel?.text = "\(carViewModel.model)"
        cell.detailTextLabel?.text = "\(carViewModel.kilowatts) HP"
        if let url = URL(string: carViewModel.photoURL) {
            if let data = NSData(contentsOf: url) {
                cell.imageView!.image = UIImage(data: data as Data)
            }        
        }
        
        return cell
    }

}


