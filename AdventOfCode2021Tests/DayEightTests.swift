import XCTest
import AdventOfCode2021

class DayEightTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [DigitalValues] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayEight-sample" : "DayEight", withExtension: "txt")!
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .map {
                let values = $0.components(separatedBy: " | ")
                return DigitalValues(input: values[0].components(separatedBy: " "), output: values[1].components(separatedBy: " "))
            }
    }

    func testDayEight_1_sample() {
        let input = makeInput(sample: true)
        let dayEight = DayEight(values: input)
        XCTAssertEqual(dayEight.partOne(), 26)
    }

    func testDayEight_1() {
        let input = makeInput()
        let dayEight = DayEight(values: input)
        XCTAssertEqual(dayEight.partOne(), 488)
    }

    func testDayEight_2_sample() {
        let input = makeInput(sample: true)
        let dayEight = DayEight(values: input)
        XCTAssertEqual(dayEight.partTwo(), 61229)
    }

    func testDayEight_2() {
        let input = makeInput()
        let dayEight = DayEight(values: input)
        XCTAssertEqual(dayEight.partTwo(), 1040429)
    }
}
