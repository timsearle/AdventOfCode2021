import XCTest
import AdventOfCode2021

class DayOneTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [Int] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayOne-sample" : "DayOne", withExtension: "txt")!
        return try! String(contentsOf: inputURL).components(separatedBy: .newlines).compactMap { Int($0) }
    }

    func testDayOne_1_sample() {
        let dayOne = DayOne(input: makeInput(sample: true))
        XCTAssertEqual(dayOne.partOne(), 7)
    }

    func testDayOne_1() {
        let dayOne = DayOne(input: makeInput())
        XCTAssertEqual(dayOne.partOne(), 1154)
    }

    func testDayOne_2_sample() {
        let dayOne = DayOne(input: makeInput(sample: true))
        XCTAssertEqual(dayOne.partTwo(), 5)
    }

    func testDayOne_2() {
        let dayOne = DayOne(input: makeInput())
        XCTAssertEqual(dayOne.partTwo(), 1127)
    }
}
