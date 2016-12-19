//
//  SearchBarVC.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/16/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchBarVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let listCity = ["New York", "San Francisco", "Los Angeles", "Washington", "Mesa", "Phoenix", "Boston", "Boise", "Fresno", "San Jose", "Raleigh", "Austin", "Wichita", "Kansas City", "Virginia Beach", "Indianapolis", "Chicago", "Arlington", "Albuquerque", "Denver", "Sacramento", "Bakersfield", "Saint Paul", "El Paso", "Lincoln"]
    var shownCity = ["New York", "San Francisco", "Los Angeles", "Washington", "Mesa", "Phoenix", "Boston", "Boise", "Fresno", "San Jose", "Raleigh", "Austin", "Wichita", "Kansas City", "Virginia Beach", "Indianapolis", "Chicago", "Arlington", "Albuquerque", "Denver", "Sacramento", "Bakersfield", "Saint Paul", "El Paso", "Lincoln"]
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        searchBar.rx.text
            .filter{$0 != nil}
            .map { $0! }
            .debounce(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.characters.count >= 0 }
            .subscribe {[unowned self] (query) in
                if query.element! == "" {
                    self.shownCity = self.listCity
                } else {
                    self.shownCity = self.search(query: query.element!)
                }
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Search City"
    }
    
    func search(query: String) -> [String] {
        return listCity.filter({($0.range(of: query) != nil)})
    }

}


extension SearchBarVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shownCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = self.shownCity[indexPath.row]
        
        return cell
    }
    
}

extension SearchBarVC: UITableViewDelegate {
    
}


