import XCTest
import AdventOfCode2021

class DayThreeTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [[Int]] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayThree-sample" : "DayThree", withExtension: "txt")!
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .map { $0.map { $0 == "0" ? 0 : 1 } }

    }

    func testDayThree_1_sample() {
        let dayThree = DayThree(input: makeInput(sample: true))
        XCTAssertEqual(dayThree.partOne(), 198)
    }

    func testDayThree_1() {
        let dayThree = DayThree(input: makeInput())
        XCTAssertEqual(dayThree.partOne(), 3813416)
    }

    func testDayThree_2_sample() {
        let dayThree = DayThree(input: makeInput(sample: true))
        XCTAssertEqual(dayThree.partTwo(), 230)
    }

    func testDayThree_2() {
        let dayThree = DayThree(input: makeInput())
        XCTAssertEqual(dayThree.partTwo(), 2990784)
    }
}
