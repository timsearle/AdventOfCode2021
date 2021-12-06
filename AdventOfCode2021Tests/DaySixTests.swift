import XCTest
import AdventOfCode2021

class DaySixTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [Int] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DaySix-sample" : "DaySix", withExtension: "txt")!
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .flatMap {
                $0.components(separatedBy: ",").compactMap { Int($0) }
            }
    }

    func testDaySix_1_sample() {
        let fish = makeInput(sample: true)
        let daySix = DaySix(fish: fish)
        XCTAssertEqual(daySix.partOne(), 5934)
    }

    func testDaySix_1() {
        let fish = makeInput()
        let daySix = DaySix(fish: fish)
        XCTAssertEqual(daySix.partOne(), 352195)
    }

    func testDaySix_2_sample() {
        let fish = makeInput(sample: true)
        let daySix = DaySix(fish: fish)
        XCTAssertEqual(daySix.partTwo(), 26984457539)
    }

    func testDaySix_2() {
        let fish = makeInput()
        let daySix = DaySix(fish: fish)
        XCTAssertEqual(daySix.partTwo(), 1600306001288)
    }
}
