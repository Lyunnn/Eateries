//
//  EateriesTests.swift
//  EateriesTests
//
//  Created by Lin Yun Kee on 27/4/21.
//

import XCTest
@testable import Eateries

class EateriesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    let restList1 = Restaurant(imgName: "https://www.insidegoldcoast.com.au/wp-content/uploads/2017/08/DSC_0189-1200x800.jpg", restName: "BSKT Cafe", location: "4 Lavarack Rd, GC", note: "Dog and kid friendly", review: [ReviewViewModel(reviews: Review(name: "Lin Yun Kee", comment: "Nice restaurant!"))])
    let restList2 = Restaurant(imgName: "https://www.insidegoldcoast.com.au/wp-content/uploads/2019/10/504A8731-2-1200x814.jpg", restName: "DB Kitchen & Bar", location: "1 The Concourse Benowa, GC", note: "Start from 7am", review: [ReviewViewModel(reviews: Review(name: "Kyle", comment: "Delicious food!"))])
    let restList3 = Restaurant(imgName: "https://b.zmtcdn.com/data/pictures/1/16613961/76fb875422e913f3938c21ff77e02489.jpg", restName: "No Name Lane", location: "GC", note: "Breakfast | Lunch | Bar", review: [ReviewViewModel(reviews: Review(name: "Jason", comment: "Great services!"))])

    func testImgName() throws {
        let test = ["https://www.insidegoldcoast.com.au/wp-content/uploads/2017/08/DSC_0189-1200x800.jpg", "https://www.insidegoldcoast.com.au/wp-content/uploads/2019/10/504A8731-2-1200x814.jpg", "https://b.zmtcdn.com/data/pictures/1/16613961/76fb875422e913f3938c21ff77e02489.jpg"]
        XCTAssertEqual(restList1.imgName, test[0])
        XCTAssertEqual(restList2.imgName, test[1])
        XCTAssertEqual(restList3.imgName, test[2])
    }
    
    func testRestName() throws {
        let test = ["BSKT Cafe", "DB Kitchen & Bar", "No Name Lane"]
        XCTAssertEqual(restList1.restName, test[0])
        XCTAssertEqual(restList2.restName, test[1])
        XCTAssertEqual(restList3.restName, test[2])
    }
    
    func testLocation() throws {
        let test = ["4 Lavarack Rd, GC", "1 The Concourse Benowa, GC", "GC"]
        XCTAssertEqual(restList1.location, test[0])
        XCTAssertEqual(restList2.location, test[1])
        XCTAssertEqual(restList3.location, test[2])
    }
    
    func testNote() throws {
        let test = ["Dog and kid friendly", "Start from 7am", "Breakfast | Lunch | Bar"]
        XCTAssertEqual(restList1.note, test[0])
        XCTAssertEqual(restList2.note, test[1])
        XCTAssertEqual(restList3.note, test[2])
    }
    
    func testReviewName() throws {
        let test = ["Lin Yun Kee", "Kyle", "Jason"]
        let model1: ReviewViewModel = ReviewViewModel(reviews: Review(name: "Lin Yun Kee", comment: "Nice restaurant!"))
        let model2: ReviewViewModel = ReviewViewModel(reviews: Review(name: "Kyle", comment: "Delicious food!"))
        let model3: ReviewViewModel = ReviewViewModel(reviews: Review(name: "Jason", comment: "Great services!"))
        XCTAssertEqual(model1.reviews.name, test[0])
        XCTAssertEqual(model2.reviews.name, test[1])
        XCTAssertEqual(model3.reviews.name, test[2])
    }
    
    func testReviewComment() throws {
        let test = ["Nice restaurant!", "Delicious food!", "Great services!"]
        let model1: ReviewViewModel = ReviewViewModel(reviews: Review(name: "Lin Yun Kee", comment: "Nice restaurant!"))
        let model2: ReviewViewModel = ReviewViewModel(reviews: Review(name: "Kyle", comment: "Delicious food!"))
        let model3: ReviewViewModel = ReviewViewModel(reviews: Review(name: "Jason", comment: "Great services!"))
        XCTAssertEqual(model1.reviews.comment, test[0])
        XCTAssertEqual(model2.reviews.comment, test[1])
        XCTAssertEqual(model3.reviews.comment, test[2])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
