import XCTest
import AdventOfCode2021

class DayNineTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [[Int]] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayNine-sample" : "DayNine", withExtension: "txt")!
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .map { $0.compactMap { Int(String($0)) }}
    }

    func testDayNine_1_sample() {
        let values = makeInput(sample: true)
        let dayNine = DayNine(values: values)
        XCTAssertEqual(dayNine.partOne(), 15)
    }

    func testDayNine_1() {
        let values = makeInput()
        let dayNine = DayNine(values: values)
        XCTAssertEqual(dayNine.partOne(), 512)
    }

    func testDayNine_2_sample() {
        let values = makeInput(sample: true)
        let dayNine = DayNine(values: values)
        XCTAssertEqual(dayNine.partTwo(), 1134)
    }
    func testDayNine_2() {
        let values = makeInput()
        let dayNine = DayNine(values: values)
        XCTAssertEqual(dayNine.partTwo(), 1600104)
    }
}
