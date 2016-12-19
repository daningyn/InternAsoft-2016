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
    internal var arrayCar = AppDelegate.shareInstanced.cars

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
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

extension CarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Do you want to rename this car?", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = self.arrayCar[indexPath.row].model
        }
        let okButton = UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if textField?.text != "" {
                self.arrayCar[indexPath.row].model = (textField?.text)!
                self.arrayCar[indexPath.row].rename(newName: (textField?.text)!)
                self.tableView.reloadData()
            }
            
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


