//
//  AddDataTableViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 03/12/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit

class AddDataTableViewController: UITableViewController {

    @IBOutlet var dateCell:DatePickerCell!
    
    func datetimeWithDate(_ date:Date) -> Date? {
        
        
        let currentCalendar = Calendar.current
        let datecomponentsNow = currentCalendar.dateComponents([.year, .month, .day], from: date)
        let sDate = currentCalendar.date(from: datecomponentsNow)
        return sDate;    }
    
    
    var startDate:Date? {
        get {
            
            return datetimeWithDate(dateCell.date as Date)
        }
    }
    
    
//    func updateOKButtonStatus() {
//        
//        self.navigationItem.rightBarButtonItem?.isEnabled = ( distanceCell.doubleValue > 0 && caloriesCell.doubleValue > 0 && distanceCell.doubleValue > 0);
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor(red: 254.0/255.0, green: 184.0/255.0, blue: 198.0/255.0, alpha: 1.00)
        dateCell.inputMode = .date

        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let startDate = Date()
        
        dateCell.date = startDate;
        
        let formatter = LengthFormatter()
        formatter.unitStyle = .long
        //self.navigationItem.rightBarButtonItem?.isEnabled  = false
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
//    @IBAction func textFieldValueChanged(_ sender:AnyObject ) {
//        updateOKButtonStatus()
//    }
    
    

}
