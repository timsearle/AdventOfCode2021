import XCTest
import AdventOfCode2021

class DayFiveTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [Vent] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayFive-sample" : "DayFive", withExtension: "txt")!
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .map { $0.components(separatedBy: " -> ") }
            .flatMap {
                let startNums = $0[0].components(separatedBy: ",").map { Int($0)! }
                let endNums = $0[1].components(separatedBy: ",").map { Int($0)! }
                return Vent(startPos: Coordinate(xPos: startNums[0], yPos: startNums[1]),
                            endPos: Coordinate(xPos: endNums[0], yPos: endNums[1]))
            }
    }
    
    func testDayFive_1_sample() {
        let vents = makeInput(sample: true)
        let dayFive = DayFive(vents: vents)
        XCTAssertEqual(dayFive.partOne(), 5)
    }
    
    func testDayFive_1() {
        let vents = makeInput()
        let dayFive = DayFive(vents: vents)
        XCTAssertEqual(dayFive.partOne(), 6461)
    }
    
    func testDayFive_2_sample() {
        let vents = makeInput(sample: true)
        let dayFive = DayFive(vents: vents)
        XCTAssertEqual(dayFive.partTwo(), 12)
    }
    
    func testDayFive_2() {
        let vents = makeInput()
        let dayFive = DayFive(vents: vents)
        XCTAssertEqual(dayFive.partTwo(), 18065)
    }
}
