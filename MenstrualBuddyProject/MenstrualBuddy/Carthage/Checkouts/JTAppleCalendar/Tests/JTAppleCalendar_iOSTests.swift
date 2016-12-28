//
//  JTAppleCalendar_iOSTests.swift
//  JTAppleCalendar iOSTests
//
//  Created by JayT on 2016-08-10.
//
//

 import XCTest // 121
 @testable import JTAppleCalendar

 class JTAppleCalendar_iOSTests: XCTestCase {
    let calendarView = JTAppleCalendarView()
    let formatter: DateFormatter = {
        let aFormatter = DateFormatter()
        aFormatter.dateFormat = "yyyy MM dd"
        return aFormatter
    }()
    
    var startDate = Date()
    var endDate = Date()
    
    
    override func setUp() {
        startDate = formatter.date(from: "2016 01 01")!
        endDate = formatter.date(from: "2017 12 01")!
    }
    
    func testConfigurationParametersDefaultBehavior() {
        print("testing default parameters")
        var params = ConfigurationParameters(startDate: Date(), endDate: Date())
        assert(params.generateInDates == .forAllMonths,   "All months should be default")
        assert(params.generateOutDates == .tillEndOfGrid, "Till Grid should be default should be default")
        assert(params.numberOfRows == 6, "Rows should be 6")
        assert(params.firstDayOfWeek == .sunday, "First day should be sunday")
        assert(params.hasStrictBoundaries == true, "strict should be true")
        params = ConfigurationParameters(startDate: Date(), endDate: Date(), numberOfRows: 1)
        assert(params.numberOfRows == 1, "Rows should be 1")
        assert(params.hasStrictBoundaries == false, "strict should be false")
    }
    
    func testLayoutGeneratorOnDefaults() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.totalSections == 24, "There should be 24 sections.")
        for index in 0...23 {
            assert(val.monthMap[index] == index, "value of \(index) should be located in the map")
        }
        assert(val.totalDays == 42 * 24 , "Total month cells should be 1008")
    }
    
    func testLayoutGeneratorOnThreeRow() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 3)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.totalSections  == 48, "There should be 48 sections")
        assert(val.monthMap[22] == 11, "Index 22 should be 11")
        assert(val.monthMap[23] == 11, "Index 22 should be 11")
    }
    func testLayoutGeneratorOnTwoRow() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 2)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.monthMap[71] == 23, "Last val should be 23")
        assert(val.totalSections  == 72, "There should be 72 sections")
    }
    func testLayoutGeneratorWithOffInAndOffOut() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 2, generateInDates: .off, generateOutDates: .off)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.monthMap[70] == 23, "Last val should be 23")
        assert(val.totalSections  == 71, "There should be 71 sections")
    }
    func testLayoutGeneratorOnDefaultss() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.totalSections == 24, "There should be 24 sections.")
        for index in 0...23 {
            assert(val.monthMap[index] == index, "value of \(index) should be located in the map")
        }
        assert(val.totalDays == 42 * 24 , "Total month cells should be 1008")
    }
    
    func testLayoutGeneratorOnThreeRows() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 3)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.totalSections  == 48, "There should be 48 sections")
        assert(val.monthMap[22] == 11, "Index 22 should be 11")
        assert(val.monthMap[23] == 11, "Index 22 should be 11")
    }
    func testLayoutGeneratorOnTwoRows() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 2)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.monthMap[71] == 23, "Last val should be 23")
        assert(val.totalSections  == 72, "There should be 72 sections")
    }
    func testLayoutGeneratorWithOffInAndOffOuts() {
        let params = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 2, generateInDates: .off, generateOutDates: .off)
        let layoutGenerator = JTAppleDateConfigGenerator()
        let val = layoutGenerator.setupMonthInfoDataForStartAndEndDate(params)
        assert(val.months.count  == 24, "There should be 24 months")
        assert(val.monthMap[70] == 23, "Last val should be 23")
        assert(val.totalSections  == 71, "There should be 71 sections")
    }
    func testConfigurationParametersDefaultBehaviors() {
        print("testing default parameters")
        var params = ConfigurationParameters(startDate: Date(), endDate: Date())
        assert(params.generateInDates == .forAllMonths,   "All months should be default")
        assert(params.generateOutDates == .tillEndOfGrid, "Till Grid should be default should be default")
        assert(params.numberOfRows == 6, "Rows should be 6")
        assert(params.firstDayOfWeek == .sunday, "First day should be sunday")
        assert(params.hasStrictBoundaries == true, "strict should be true")
        params = ConfigurationParameters(startDate: Date(), endDate: Date(), numberOfRows: 1)
        assert(params.numberOfRows == 1, "Rows should be 1")
        assert(params.hasStrictBoundaries == false, "strict should be false")
    }
    func testConfigurationParametersDefaultBehaviorss() {
        print("testing default parameters")
        var params = ConfigurationParameters(startDate: Date(), endDate: Date())
        assert(params.generateInDates == .forAllMonths,   "All months should be default")
        assert(params.generateOutDates == .tillEndOfGrid, "Till Grid should be default should be default")
        assert(params.numberOfRows == 6, "Rows should be 6")
        assert(params.firstDayOfWeek == .sunday, "First day should be sunday")
        assert(params.hasStrictBoundaries == true, "strict should be true")
        params = ConfigurationParameters(startDate: Date(), endDate: Date(), numberOfRows: 1)
        assert(params.numberOfRows == 1, "Rows should be 1")
        assert(params.hasStrictBoundaries == false, "strict should be false")
    }
    func testConfigurationParametersDefaultBehaviorsss() {
        print("testing default parameters")
        var params = ConfigurationParameters(startDate: Date(), endDate: Date())
        assert(params.generateInDates == .forAllMonths,   "All months should be default")
        assert(params.generateOutDates == .tillEndOfGrid, "Till Grid should be default should be default")
        assert(params.numberOfRows == 6, "Rows should be 6")
        assert(params.firstDayOfWeek == .sunday, "First day should be sunday")
        assert(params.hasStrictBoundaries == true, "strict should be true")
        params = ConfigurationParameters(startDate: Date(), endDate: Date(), numberOfRows: 1)
        assert(params.numberOfRows == 1, "Rows should be 1")
        assert(params.hasStrictBoundaries == false, "strict should be false")
    }
}
