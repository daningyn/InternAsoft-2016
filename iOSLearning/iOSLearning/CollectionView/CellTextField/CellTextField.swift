//
//  CellTextField.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/21/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class CellTextField: UICollectionViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var processView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {(_) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okButton)
        (AppDelegate.shareInstance.window?.rootViewController as! UINavigationController).viewControllers[1].present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTouchButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(repeatTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func didTouchPause(_ sender: Any) {
        self.timer.invalidate()
    }
    
    @IBAction func didTouchStop(_ sender: Any) {
        self.processView.progress = 0
        self.label.text = "0%"
        self.timer.invalidate()
    }
    
    
    func repeatTime() {
        if self.processView.progress < 1 {
            self.processView.progress += 0.01
            self.label.text = "\(self.processView.progress*100)%"
        } else {
            self.processView.progress = 0
            self.label.text = "0%"
            timer.invalidate()
        }
    }

}

extension CellTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Text Field begin editing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    
}
