import XCTest
import AdventOfCode2021

class DaySevenTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [Int] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DaySeven-sample" : "DaySeven", withExtension: "txt")!
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .flatMap {
                $0.components(separatedBy: ",").compactMap { Int($0) }
            }
    }

    func testDaySeven_1_sample() {
        let crabs = makeInput(sample: true)
        let daySeven = DaySeven(crabPositions: crabs)
        XCTAssertEqual(daySeven.partOne(), 37)
    }

    func testDaySeven_1() {
        let crabs = makeInput()
        let daySeven = DaySeven(crabPositions: crabs)
        XCTAssertEqual(daySeven.partOne(), 352997)
    }

    func testDaySeven_2_sample() {
        let crabs = makeInput(sample: true)
        let daySeven = DaySeven(crabPositions: crabs)
        XCTAssertEqual(daySeven.partTwo(), 168)
    }

    func testDaySeven_2() {
        let crabs = makeInput()
        let daySeven = DaySeven(crabPositions: crabs)
        XCTAssertEqual(daySeven.partTwo(), 101571302)
    }
}
