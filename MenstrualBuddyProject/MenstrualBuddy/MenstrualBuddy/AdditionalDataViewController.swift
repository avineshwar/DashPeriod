//
//  AdditionalDataViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 07/12/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit

class AdditionalDataViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    var date = String()
    var startCycle = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor(red: 254.0/255.0, green: 184.0/255.0, blue: 198.0/255.0, alpha: 1.00)
        dateLabel.text = date
        startLabel.text = startCycle
        


        // Do any additional setup after loading the view.
    }

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
