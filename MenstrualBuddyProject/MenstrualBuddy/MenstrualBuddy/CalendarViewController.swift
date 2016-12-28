//
//  CalendarViewController.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 26/11/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import UIKit
import FSCalendar
import HealthKit
class CalendarViewController: UIViewController,FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    var healthManager:HealthManager = HealthManager()
    var menstrualData = [HKCategorySample]()
    
    
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    private let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    
    override func viewDidLoad() {
    super.viewDidLoad()
    super.view.backgroundColor = UIColor(red: 254.0/255.0, green: 184.0/255.0, blue: 198.0/255.0, alpha: 1.00)
        if revealViewController() != nil {
                revealViewController().rearViewRevealWidth = 200
                menuButton.target = revealViewController()
                menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
                view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            }

        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        self.calendar.select(self.formatter.date(from: "2016/12/04")!)
        //        self.calendar.scope = .week
        self.calendar.scopeGesture.isEnabled = true
        self.healthManager.retrieveMenstruationInformation({ (results, error) -> Void in
            //            print("result \(results)")
            
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
        })
        //        calendar.allowsMultipleSelection = true
        
        // Uncomment this to test month->week and week->month transition
        /*
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
         self.calendar.setScope(.Week, animated: true)
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
         self.calendar.setScope(.Month, animated: true)
         }
         }
         */
        
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "2016/01/01")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "2017/10/31")!
    }
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        let day: Int! = self.gregorian.component(.day, from: date)
//        return day % 5 == 0 ? day/5 : 0;
//    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
       print("change page to \(self.formatter.string(from: calendar.currentPage))")
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("calendar did select date \(self.formatter.string(from: date))")
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    lazy var dateFormatter:DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter;
        
    }()

    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        for mData in menstrualData{
            let sample  = mData
            if sample.startDate == date{
                return UIImage(named: "User Female-50")
            }

        }
        return nil
    }

    
}

