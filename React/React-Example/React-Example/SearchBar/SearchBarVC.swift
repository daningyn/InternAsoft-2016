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
    var shownCity = [String]()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        shownCity = self.searchBar.rx.text.orEmpty.asDriver()
            .throttle(0.3)
            .distinctUntilChanged()
            .flatMapLatest { query -> Driver<String> in
                if query.isEmpty {
                    return Driver.just(RepositoriesState.empty)
                }
                
                return search(query: query)
            }
            .observeOn(MainScheduler.instance)
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        
        return cell
    }
    
}

extension SearchBarVC: UITableViewDelegate {
    
}


