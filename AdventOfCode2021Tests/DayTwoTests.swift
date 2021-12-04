import XCTest
import AdventOfCode2021

class DayTwoTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [(String, Int)] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayTwo-sample" : "DayTwo", withExtension: "txt")!
        var entries = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
        entries.removeLast()
        let split = entries.map { $0.components(separatedBy: " ") }
        var input = [(String, Int)]()

        for entry in split {
            input.append((entry[0], Int(entry[1])!))
        }

        return input
    }

    func testDayTwo_1_sample() {
        let dayTwo = DayTwo(input: makeInput(sample: true))
        XCTAssertEqual(dayTwo.partOne(), 150)
    }

    func testDayTwo_1() {
        let dayTwo = DayTwo(input: makeInput())
        XCTAssertEqual(dayTwo.partOne(), 2070300)
    }

    func testDayTw_2_sample() {
        let dayTwo = DayTwo(input: makeInput(sample: true))
        XCTAssertEqual(dayTwo.partTwo(), 900)
    }

    func testDayTwo_2() {
        let dayTwo = DayTwo(input: makeInput())
        XCTAssertEqual(dayTwo.partTwo(), 2078985210)
    }
}
