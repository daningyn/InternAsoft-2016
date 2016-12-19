//
//  WhoToFollowVC.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/19/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit
import RxSwift

class WhoToFollowVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let requestStream: Observable<String> = Observable.just("https://api.github.com/users")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "WhoToFollowTableViewCell", bundle: nil), forCellReuseIdentifier: "WhoToFollowCell")
        self.tableView.layoutMargins = UIEdgeInsets.zero
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        let responseStream = requestStream.flatMap({url -> Observable<String> in
            print(url)
            return Observable.just("https://api.github.com/users")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Who To Follow"
    }

}

extension WhoToFollowVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhoToFollowCell", for: indexPath)
        
        return cell
    }
    
}

extension WhoToFollowVC: UITableViewDelegate {
    
    
    
}
