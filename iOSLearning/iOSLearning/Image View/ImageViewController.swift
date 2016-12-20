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
    @IBOutlet weak var scrollRight: NSLayoutConstraint!
    @IBOutlet weak var scrollLeft: NSLayoutConstraint!
    @IBOutlet weak var scrollTop: NSLayoutConstraint!
    @IBOutlet weak var scrollBot: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
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
    
    @IBAction func didTouchButton(_ sender: Any) {
        if scrollRight.constant == 0 {
            button.setTitle("Disable Scroll", for: .normal)
            scrollRight.constant = 50
            scrollBot.constant = 50
            scrollTop.constant = 50
            scrollLeft.constant = 50
        } else {
            button.setTitle("Enable Scroll", for: .normal)
            scrollRight.constant = 0
            scrollBot.constant = 0
            scrollTop.constant = 0
            scrollLeft.constant = 0
        }
    }

}
