import XCTest
import AdventOfCode2021

class DayElevenTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> [[Int]] {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayEleven-sample" : "DayEleven", withExtension: "txt")!
        
        return try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()
            .map { $0.compactMap { Int(String($0)) } }
    }
    
    func testDayEleven_1_sample() {
        let values = makeInput(sample: true)
        let dayEleven = DayEleven(values: values)
        XCTAssertEqual(dayEleven.partOne(), 1656)
    }
    
    func testDayEleven_1() {
        let values = makeInput()
        let dayEleven = DayEleven(values: values)
        XCTAssertEqual(dayEleven.partOne(), 1700)
    }
    
    func testDayEleven_2_sample() {
        let values = makeInput(sample: true)
        let dayEleven = DayEleven(values: values)
        XCTAssertEqual(dayEleven.partTwo(), 195)
    }
    
    func testDayEleven_2() {
        let values = makeInput()
        let dayEleven = DayEleven(values: values)
        XCTAssertEqual(dayEleven.partTwo(), 273)
    }
}
