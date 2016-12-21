//
//  SearchBarDemo.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/21/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class SearchBarDemo: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var isRightButtonEditing: Bool = false
    
    let listCity = ["New York", "San Francisco", "Los Angeles", "Washington", "Mesa", "Phoenix", "Boston", "Boise", "Fresno", "San Jose", "Raleigh", "Austin", "Wichita", "Kansas City", "Virginia Beach", "Indianapolis", "Chicago", "Arlington", "Albuquerque", "Denver", "Sacramento", "Bakersfield", "Saint Paul", "El Paso", "Lincoln"]
    var shownCity = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.shownCity = self.listCity.sorted{$0<$1}
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let rightButton = UIBarButtonItem(title: "Edit Title", style: .plain, target: self, action: #selector(self.didTouchButton))
        self.navigationItem.rightBarButtonItem = rightButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTouchButton() {
        if self.isRightButtonEditing == false {
            self.isRightButtonEditing = true
            self.navigationItem.rightBarButtonItem?.title = "Editing Title"
        } else {
            self.isRightButtonEditing = false
            self.navigationItem.rightBarButtonItem?.title = "Edit Title"
        }
    }
    
    func search(query: String) -> [String] {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return listCity.filter({($0.range(of: query) != nil)})
                                  .sorted {$0<$1}
        } else {
            return listCity.filter({($0.range(of: query) != nil)})
                                  .sorted {$0>$1}
        }
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        if self.segmentControl.selectedSegmentIndex == 0 {
            self.shownCity = self.shownCity.sorted{$0<$1}
        } else {
            self.shownCity = self.shownCity.sorted{$0>$1}
        }
        self.tableView.reloadData()
    }

}

extension SearchBarDemo: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shownCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = self.shownCity[indexPath.row]
        
        return cell
    }
    
}

extension SearchBarDemo: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isRightButtonEditing == true {
            self.navigationController?.navigationBar.topItem?.title = self.shownCity[indexPath.row]
        }
    }
    
}

extension SearchBarDemo: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            self.shownCity = self.listCity
            self.tableView.reloadData()
        } else {
            self.shownCity = self.search(query: searchBar.text!)
            self.tableView.reloadData()
        }
    }
    
}












