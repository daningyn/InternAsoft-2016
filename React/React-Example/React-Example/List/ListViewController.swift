//
//  ListViewController.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/19/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var array: [String] = ["KVO Example", "Who to follow", "Search Bar Not Use Networking"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Example"
    }

}

//#MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = self.array[indexPath.row]
        
        return cell
    }
    
}


//#MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(KVOViewController(nibName: "KVOViewController", bundle: nil), animated: true)
        case 1:
            self.navigationController?.pushViewController(WhoToFollowVC(nibName: "WhoToFollowVC", bundle: nil), animated: true)
        case 2:
            self.navigationController?.pushViewController(SearchBarVC(nibName: "SearchBarVC", bundle: nil), animated: true)
        default:
            break
        }
    }
    
}
