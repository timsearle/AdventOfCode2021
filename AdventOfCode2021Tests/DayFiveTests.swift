import XCTest
import AdventOfCode2021

class DayFiveTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> Void {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayFive-sample" : "DayFive", withExtension: "txt")!
    }

    func testDayFive_1_sample() {
        _ = makeInput(sample: true)
        let dayFive = DayFive()
        XCTAssertEqual(dayFive.partOne(), -1)
    }

    func testDayFive_1() {
        _ = makeInput()
        let dayFive = DayFive()
        XCTAssertEqual(dayFive.partOne(), -1)
    }

    func testDayFive_2_sample() {
        _ = makeInput(sample: true)
        let dayFive = DayFive()
        XCTAssertEqual(dayFive.partTwo(), -1)
    }
    
    func testDayFive_2() {
        _ = makeInput()
        let dayFive = DayFive()
        XCTAssertEqual(dayFive.partTwo(), -1)
    }
}
