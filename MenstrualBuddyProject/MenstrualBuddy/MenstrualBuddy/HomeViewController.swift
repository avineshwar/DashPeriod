//
//  HomeViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 26/11/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit
import HealthKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lastEntryOnLabel: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var healthManager:HealthManager = HealthManager()
    var menstrualData = [HKCategorySample]()
    var latestEntryOn = Date()


    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor(red: 254.0/255.0, green: 184.0/255.0, blue: 198.0/255.0, alpha: 1.00)
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 200
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
        self.healthManager.retrieveMenstruationInformation({ (results, error) -> Void in
//                        print("result \(results)")
            
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
            if self.menstrualData.count != 0 {
               self.latestEntryOn = (self.menstrualData.first?.startDate)!
             self.lastEntryOnLabel.text = self.dateFormatter.string(from: self.latestEntryOn)
                
            }
            else{
                self.lastEntryOnLabel.text = "No Data"
            }
        })
        
        


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        if self.menstrualData.count != 0 {
            self.latestEntryOn = (self.menstrualData.first?.startDate)!
            self.lastEntryOnLabel.text = self.dateFormatter.string(from: self.latestEntryOn)
            
        }
        else{
            self.lastEntryOnLabel.text = "No Data"
        }
        
    }
    
    lazy var dateFormatter:DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter;
        
    }()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
