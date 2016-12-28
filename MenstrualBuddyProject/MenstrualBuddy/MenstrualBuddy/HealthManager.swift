//
//  HealthManager.swift
//  MenstrualBuddy
//
//  Created by Shristi Hingle on 03/12/16.
//  Copyright © 2016 Shristi Hingle. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {
    let healthKitStore:HKHealthStore = HKHealthStore()
    
    func authorizeHealthKit(_ completion: ((_ success:Bool, _ error:NSError?) -> Void)!)
    {
        let typestoRead = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.menstrualFlow)!
            ])
        
        let typestoShare = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.menstrualFlow)!
            ])
        
        self.healthKitStore.requestAuthorization(toShare: typestoShare, read: typestoRead) { (success, error) -> Void in
            if success == false {
                NSLog(" Display not allowed")
            }
            else
            {
                NSLog("Success")
            }
        }
    }
    
    func saveMenstruationInformation(startDate:Date , endDate:Date) {
        // date and date are NSDate objects
        //print("here1")
        if let menstrualType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.menstrualFlow) {
            
            // we create our new object we want to push in Health app
            let object = HKCategorySample(type:menstrualType, value: HKCategoryValueMenstrualFlow.heavy.rawValue, start: startDate, end: endDate, metadata: [HKMetadataKeyMenstrualCycleStart: true] )
            
            // at the end, we save it
            healthKitStore.save(object, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    print("Error")
                    return
                }
                
                if success {
                    print("My new data was saved in HealthKit")
                    
                } else {
//                    print ("\(object))")
                }
                
            })
            
        }
        
    }
    
    func retrieveMenstruationInformation(_ completion: (([AnyObject]?, NSError?) -> Void)!)  {
        //print("here1")
        // first, we define the object type we want
        if let menstrualType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.menstrualFlow) {
            
            // Use a sortDescriptor to get the recent data first
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            
            // we create our query with a block completion to execute
            let query = HKSampleQuery(sampleType: menstrualType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    
                    // something happened
                    return
                    
                }
                
                if let result = tmpResult {
                    
                    // do something with my data
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            _ = (sample.value == HKCategoryValueMenstrualFlow.heavy.rawValue) ? "Heavy" : "Menstrual Flow"
//                            print("Healthkit Menstrual Flow: \(sample.startDate) \(sample.endDate) - value: \(value)")
                        }
                    }

                        completion?(tmpResult,error as NSError?)
                }
                
               
            }
            
            
            // finally, we execute our query
            healthKitStore.execute(query)
        }
    }

    
}
