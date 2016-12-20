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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alert = UIAlertController(title: "This is Alert", message: nil, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Show Action Sheet Alert", style: .default, handler: { (_) in
                let actionSheetAlert = UIAlertController(title: "This is Action Sheet Alert", message: nil, preferredStyle: .actionSheet)
                let option1 = UIAlertAction(title: "Option 1", style: .default, handler: nil)
                let option2 = UIAlertAction(title: "Option 2", style: .default, handler: nil)
                let option3 = UIAlertAction(title: "Option 3", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                    actionSheetAlert.dismiss(animated: true, completion: nil)
                })
                actionSheetAlert.addAction(option1)
                actionSheetAlert.addAction(option2)
                actionSheetAlert.addAction(option3)
                actionSheetAlert.addAction(cancel)
                self.present(actionSheetAlert, animated: true, completion: nil)
            })
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
        default:
            break
        }
    }
    
}








