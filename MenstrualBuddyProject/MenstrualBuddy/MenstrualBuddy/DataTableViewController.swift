//
//  DataTableViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 03/12/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit
import HealthKit

class DataTableViewController: UITableViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var healthManager:HealthManager = HealthManager()
    let kAddDataReturnOKSegue = "addDataOKSegue"
    let kAddDataSegue  = "addDataSegue"
    var cell: UITableViewCell!
    
    var menstrualData = [HKCategorySample]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor(red: 254.0/255.0, green: 184.0/255.0, blue: 198.0/255.0, alpha: 1.00)

        self.clearsSelectionOnViewWillAppear = false

        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 200
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("in view")
        
        self.healthManager.retrieveMenstruationInformation({ (results, error) -> Void in
            //print("result \(results)")

            if( error != nil )
            {
                print("Error reading data: \(error?.localizedDescription)")
                return;
            }
            else
            {
                print("Data read successfully!")
            }
            
            self.menstrualData = results as! [HKCategorySample]
            //print ("date \(self.menstrualData[0].startDate)")
            if self.menstrualData.count > 0{
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.tableView.reloadData()
                });

            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print ("\(self.menstrualData.count)")
        return self.menstrualData.count
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if( segue.identifier == kAddDataSegue )
        {

        }
        if  (segue.identifier == "pushData"){
            if let additionalDataViewController = segue.destination as? AdditionalDataViewController{
                let index = tableView.indexPathForSelectedRow?.row
                if menstrualData.count == 0{
                    additionalDataViewController.date = "No data"
                    additionalDataViewController.startCycle = "No Data"
                }
                else
                {
                    let mData  = self.menstrualData[index!]
                    additionalDataViewController.date = dateFormatter.string(from: mData.startDate)
                    let cycleInfo = mData.metadata!
                    let cycleDate = cycleInfo["HKMenstrualCycleStart"]! as! Int
                    if cycleDate == 0{
                        
                        additionalDataViewController.startCycle = "yes"
                        
                    }
                    else
                    {
                        additionalDataViewController.startCycle = "no"
                        
                    }

                }
            }
            
        }

        
    }

    
    @IBAction func unwindToSegue (_ segue : UIStoryboardSegue) {
        
        if( segue.identifier == kAddDataReturnOKSegue )
        {
            if let addViewController:AddDataTableViewController = segue.source as? AddDataTableViewController {
                
                //print("\(addViewController.startDate!)")
                // 2. Save the workout
                self.healthManager.saveMenstruationInformation(startDate: addViewController.startDate!, endDate: addViewController.startDate!)
            }
        }
        
    }

    lazy var dateFormatter:DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter;
        
    }()

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        cell = tableView.dequeueReusableCell(withIdentifier: "datacellid", for: indexPath) as UITableViewCell

        let mData  = self.menstrualData[indexPath.row]
        let startDate = dateFormatter.string(from: mData.startDate)
        let cycleInfo = mData.metadata!
        let cycleDate = cycleInfo["HKMenstrualCycleStart"]! as! Int
        
        if cycleDate == 0{
            cell.backgroundColor = UIColor(red: 250.0/255.0, green: 17.0/255.0, blue: 79.0/255.0, alpha: 1.0)

        }
        cell.textLabel!.text = startDate
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

//
//    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.none
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
