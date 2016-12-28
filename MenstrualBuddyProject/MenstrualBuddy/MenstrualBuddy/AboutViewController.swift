//
//  AboutViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 26/11/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var aboutText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor(red: 254.0/255.0, green: 184.0/255.0, blue: 198.0/255.0, alpha: 1.00)
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 200
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        aboutText.text = "Dash Period stores your menstrual cycle information simply by clicking a dash button.\n Developed by: Shristi Hingle \n Vinod Tiwari \n Avineshwar Pratap Singh"
        


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
