//
//  CollectionViewController.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/21/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CellTextField", bundle: nil), forCellWithReuseIdentifier: "CellTextField")
        self.collectionView.register(UINib(nibName: "CellToolBar", bundle: nil), forCellWithReuseIdentifier: "CellToolBar")
        let scroll = UICollectionViewFlowLayout()
        scroll.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = scroll
        self.stepper.autorepeat = false
        self.stepper.minimumValue = 0
        self.stepper.stepValue = 1
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChangedStepper(_ sender: Any) {
        self.collectionView.scrollToItem(at: IndexPath(item: Int(self.stepper.value), section: 0), at: .centeredHorizontally, animated: true)
        self.pageControl.currentPage = Int(self.stepper.value)
    }

}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = 3
        self.stepper.maximumValue = 2
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTextField", for: indexPath) as! CellTextField
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        self.stepper.value = Double(self.pageControl.currentPage)
    }
    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height-(self.navigationController?.navigationBar.bounds.height)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}






