//
//  CustomCell.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/22/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
    func dateWasSelected(selectedDateString: String)
    
    func maritalStatusSwitchChangedState(isOn: Bool)
    
    func textfieldTextWasChanged(newText: String, parentCell: CustomCell)
    
    func sliderDidChangeValue(newSliderValue: String)
}

class CustomCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var labelInMarital: UILabel!
    @IBOutlet weak var switcher: UISwitch!

    @IBOutlet weak var slider: UISlider!
    
    var delegate: CustomCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if textField != nil {
            textField.delegate = self
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func didTouchSetButton(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        let dateString = dateFormatter.string(from: datePicker.date)
        
        if delegate != nil {
            delegate.dateWasSelected(selectedDateString: dateString)
        }
    }
    
    @IBAction func doOnOffSwitch(_ sender: Any) {
        if delegate != nil {
            delegate.maritalStatusSwitchChangedState(isOn: switcher.isOn)
        }
    }
    
    @IBAction func valueChangedSlider(_ sender: Any) {
        if delegate != nil {
            delegate.sliderDidChangeValue(newSliderValue: "\(Int(slider.value))")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if delegate != nil {
            delegate.textfieldTextWasChanged(newText: textField.text!, parentCell: self)
        }
        
        return true
    }
    
}
