//
//  AdvancedTableViewController.swift
//  iOSLearning
//
//  Created by Danh Nguyen on 12/22/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class AdvancedTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cellDescriptors: NSMutableArray!
    
    var visibleRowsPerSection = [[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CustomNameCell", bundle: nil), forCellReuseIdentifier: "CustomNameCell")
        self.tableView.register(UINib(nibName: "CustomBirthdayCell", bundle: nil), forCellReuseIdentifier: "CustomBirthdayCell")
        self.tableView.register(UINib(nibName: "CustomMaritalCell", bundle: nil), forCellReuseIdentifier: "CustomMaritalCell")
        self.tableView.register(UINib(nibName: "CustomFavoriteSportCell", bundle: nil), forCellReuseIdentifier: "CustomFavoriteSportCell")
        self.tableView.register(UINib(nibName: "CustomFavoriteColorCell", bundle: nil), forCellReuseIdentifier: "CustomFavoriteColorCell")
        self.tableView.register(UINib(nibName: "CustomLevelCell", bundle: nil), forCellReuseIdentifier: "CustomLevelCell")
        self.tableView.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "NormalCell")
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCellDescriptors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCellDescriptors() {
        if let path = Bundle.main.path(forResource: "CellDescriptor", ofType: "plist") {
            cellDescriptors = NSMutableArray(contentsOfFile: path)
            getIndicesOfVisibleRows()
            tableView.reloadData()
        }
    }
    
    func getIndicesOfVisibleRows() {
        visibleRowsPerSection.removeAll()
        
        for currentSectionCells in cellDescriptors {
            var visibleRows = [Int]()
            
            for (row, value) in (currentSectionCells as! [[String: AnyObject]]).enumerated() {
                if value["isVisible"] as! Bool == true {
                    visibleRows.append(row)
                }
            }
            
            visibleRowsPerSection.append(visibleRows)
        }
    }
    
    func getCellDescriptorForIndexPath(indexPath: NSIndexPath) -> [String: AnyObject] {
        let indexOfVisibleRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        let cellDescriptor = (cellDescriptors as Array)[indexPath.section][indexOfVisibleRow] as! [String: AnyObject]
        return cellDescriptor
    }

}


//#MARK: - UITableView Delegate
extension AdvancedTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath: indexPath as NSIndexPath)
        
        switch currentCellDescriptor["cellIdentifier"] as! String {
        case "NormalCell":
            return 60.0
            
        case "CustomBirthdayCell":
            return 270.0
            
        default:
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexOfTappedRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        
        if ((cellDescriptors as Array)[indexPath.section][indexOfTappedRow] as! NSDictionary).value(forKey: "isExpandable") as! Bool == true {
            var shouldExpandAndShowSubRows = false
            if ((cellDescriptors as Array)[indexPath.section][indexOfTappedRow] as! NSDictionary).value(forKey: "isExpanded") as! Bool == false {
                // In this case the cell should expand.
                shouldExpandAndShowSubRows = true
            }
            
            ((cellDescriptors as Array)[indexPath.section][indexOfTappedRow] as! NSDictionary).setValue(shouldExpandAndShowSubRows, forKey: "isExpanded")
            
            for i in (indexOfTappedRow + 1)...(indexOfTappedRow + (((cellDescriptors as Array)[indexPath.section][indexOfTappedRow] as! NSDictionary).value(forKey: "additionalRows") as! Int)) {
                ((cellDescriptors as Array)[indexPath.section][i] as! NSDictionary).setValue(shouldExpandAndShowSubRows, forKey: "isVisible")
            }
        }
        else {
            if ((cellDescriptors as Array)[indexPath.section][indexOfTappedRow] as! NSDictionary).value(forKey: "cellIdentifier") as! String == "CustomBirthdayCell" {
                var indexOfParentCell: Int!
                
                var i = indexOfTappedRow - 1
                while i>=0 {
                    if ((cellDescriptors as Array)[indexPath.section][i] as! NSDictionary).value(forKey: "isExpandable") as! Bool == true {
                        indexOfParentCell = i
                        break
                    }
                    i-=1
                }
                
                
                ((cellDescriptors as Array)[indexPath.section][indexOfParentCell] as! NSDictionary).setValue((tableView.cellForRow(at: indexPath) as! CustomCell).textLabel?.text, forKey: "primaryTitle")
                ((cellDescriptors as Array)[indexPath.section][indexOfParentCell] as! NSDictionary).setValue(false, forKey: "isExpanded")
                
                for i in (indexOfParentCell + 1)...(indexOfParentCell + (((cellDescriptors as Array)[indexPath.section][indexOfParentCell] as! NSDictionary).value(forKey: "additionalRows") as! Int)) {
                    ((cellDescriptors as Array)[indexPath.section][i] as! NSDictionary).setValue(false, forKey: "isVisible")
                }
            }
        }
        
        getIndicesOfVisibleRows()
        tableView.reloadSections(NSIndexSet(index: indexPath.section) as IndexSet, with: UITableViewRowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Personal"
            
        case 1:
            return "Preferences"
            
        default:
            return "Work Experience"
        }
    }
    
}


//#MARK: - UITableView DataSource
extension AdvancedTableViewController: UITableViewDataSource, CustomCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if cellDescriptors != nil {
            return cellDescriptors.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleRowsPerSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath: indexPath as NSIndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellDescriptor["cellIdentifier"] as! String, for: indexPath) as! CustomCell
        
        if currentCellDescriptor["cellIdentifier"] as! String == "NormalCell" {
            if let primaryTitle = currentCellDescriptor["primaryTitle"] {
                cell.textLabel?.text = primaryTitle as? String
            }
            
            if let secondaryTitle = currentCellDescriptor["secondaryTitle"] {
                cell.detailTextLabel?.text = secondaryTitle as? String
            }
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "CustomNameCell" {
            cell.textField.placeholder = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "CustomMaritalCell" {
            cell.labelInMarital.text = currentCellDescriptor["primaryTitle"] as? String
            
            let value = currentCellDescriptor["value"] as? String
            cell.switcher.isOn = (value == "true") ? true : false
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "CustomFavoriteSportCell" || currentCellDescriptor["cellIdentifier"] as! String == "CustomFavoriteColorCell" {
            cell.textLabel?.text = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "CustomLevelCell" {
            let value = currentCellDescriptor["value"] as! String
            cell.slider.value = (value as NSString).floatValue
        }
        
        cell.delegate = self
        
        return cell
    }
    
    //#MARK: Custom Delegate
    
    func dateWasSelected(selectedDateString: String) {
        let dateCellSection = 0
        let dateCellRow = 3
        
        ((cellDescriptors as Array)[dateCellSection][dateCellRow] as! NSDictionary).setValue(selectedDateString, forKey: "primaryTitle")
        tableView.reloadData()
    }
    
    func maritalStatusSwitchChangedState(isOn: Bool) {
        let maritalSwitchCellSection = 0
        let maritalSwitchCellRow = 6
        
        let valueToStore = (isOn) ? "true" : "false"
        let valueToDisplay = (isOn) ? "Married" : "Single"
        
        ((cellDescriptors as Array)[maritalSwitchCellSection][maritalSwitchCellRow] as! NSDictionary).setValue(valueToStore, forKey: "value")
        ((cellDescriptors as Array)[maritalSwitchCellSection][maritalSwitchCellRow - 1] as! NSDictionary).setValue(valueToDisplay, forKey: "primaryTitle")
        tableView.reloadData()
    }
    
    func textfieldTextWasChanged(newText: String, parentCell: CustomCell) {
        let parentCellIndexPath = tableView.indexPath(for: parentCell)
        
        let currentFullname = ((cellDescriptors as Array)[0][0] as! NSDictionary).value(forKey: "primaryTitle") as! String
        let fullnameParts = currentFullname.components(separatedBy: " ")
        
        var newFullname = ""
        
        if parentCellIndexPath?.row == 1 {
            if fullnameParts.count == 2 {
                newFullname = "\(newText) \(fullnameParts[1])"
            }
            else {
                newFullname = newText
            }
        }
        else {
            newFullname = "\(fullnameParts[0]) \(newText)"
        }
        
        ((cellDescriptors as Array)[0][0] as! NSDictionary).setValue(newFullname, forKey: "primaryTitle")
        tableView.reloadData()
    }
    
    func sliderDidChangeValue(newSliderValue: String) {
        ((cellDescriptors as Array)[2][0] as! NSDictionary).setValue(newSliderValue, forKey: "primaryTitle")
        ((cellDescriptors as Array)[2][1] as! NSDictionary).setValue(newSliderValue, forKey: "value")
        
        tableView.reloadSections(NSIndexSet(index: 2) as IndexSet, with: UITableViewRowAnimation.none)
    }
    
}

extension Array {
    
    func isContains(of array: [String]) -> Bool {
        var selfArray = [String]()
        for i in self {
            selfArray.append(i as! String)
        }
        let selfSet = Set(selfArray)
        let arraySet = Set(array)
        return arraySet.isSubset(of: selfSet)
        
    }
    
}









