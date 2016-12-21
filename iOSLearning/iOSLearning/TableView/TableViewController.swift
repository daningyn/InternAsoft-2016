//
//  TableViewController.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/20/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let arrayColor = ["Green", "Aero", "Bisque", "Buff", "Cherry", "Pink", "Red", "Yellow", "Violet", "Folly"]
    var indexOfColor = 4
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = self.arrayColor[indexOfColor]
        case 1:
            cell.textLabel?.text = "\(self.date)"
        default:
            break
        }
        
        return cell
    }
    
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Picker View"
        case 1:
            return "Date Picker"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.showAlert(indexPath: indexPath)
        case 1:
            self.showAlertDatePicker()
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension TableViewController {
    
    func showAlert(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Chose Color", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
        let pickerFrame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: 150)
        let picker = UIPickerView(frame: pickerFrame)
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(indexOfColor, inComponent: 0, animated: true)
        alert.view.addSubview(picker)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {(_) in
            self.indexOfColor = picker.selectedRow(inComponent: 0)
            self.tableView.reloadData()
            alert.dismiss(animated: true, completion: nil)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertDatePicker() {
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 30, width: self.view.bounds.width, height: 150))
        datePicker.datePickerMode = .dateAndTime
        let alert = UIAlertController(title: "Date Picker", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
        alert.view.addSubview(datePicker)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {(_) in
            self.date = datePicker.date
            self.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension TableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayColor.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayColor[row]
    }
    
}




