//
//  ImageViewController.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/20/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit


class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var opacySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alphaSliderValueChanged(_ sender: Any) {
        self.imageView.alpha = CGFloat(alphaSlider.value)
    }
    
    @IBAction func opacySliderValueChanged(_ sender: Any) {
        self.imageView.layer.opacity = opacySlider.value
    }

}
