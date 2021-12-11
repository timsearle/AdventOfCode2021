import XCTest
import AdventOfCode2021

class DayTenTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [String] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayTen-sample" : "DayTen", withExtension: "txt")!
        
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
    }

    func testDayTen_1_sample() {
        let lines = makeInput(sample: true)
        let dayTen = DayTen(lines: lines)
        XCTAssertEqual(dayTen.partOne(), 26397)
    }

    func testDayTen_1() {
        let lines = makeInput()
        let dayTen = DayTen(lines: lines)
        XCTAssertEqual(dayTen.partOne(), 266301)
    }

    func testDayTen_2_sample() {
        let lines = makeInput(sample: true)
        let dayTen = DayTen(lines: lines)
        XCTAssertEqual(dayTen.partTwo(), 288957)
    }

    func testDayTen_2() {
        let lines = makeInput()
        let dayTen = DayTen(lines: lines)
        XCTAssertEqual(dayTen.partTwo(), 3404870164)
    }
}
