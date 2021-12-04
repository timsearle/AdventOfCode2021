import XCTest
import AdventOfCode2021

class DayFourTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> ([Int], [Board]) {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayFour-sample" : "DayFour", withExtension: "txt")!
        let lines = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .map { $0.components(separatedBy: "") }

        let numbers = lines[0][0]
            .components(separatedBy: ",")
            .compactMap { Int($0) }
        
        var rows = [[Int]]()
        var boards = [Board]()
        
        for i in 2..<lines.count {
            guard lines[i][0] != "" else {
                boards.append(Board(grid: rows))
                rows.removeAll()
                continue
            }
            
            rows.append(lines[i][0]
                            .components(separatedBy: " ")
                            .filter { $0 != "" }
                            .compactMap { Int($0) })
        }
        
        return (numbers, boards)
    }

    func testDayFour_1_sample() {
        let (numbers, boards) = makeInput(sample: true)
        let dayFour = DayFour(numbers:  numbers, boards: boards)
        XCTAssertEqual(dayFour.partOne(), 4512)
    }

    func testDayFour_1() {
        let (numbers, boards) = makeInput()
        let dayFour = DayFour(numbers:  numbers, boards: boards)
        XCTAssertEqual(dayFour.partOne(), 5685)
    }

    func testDayFour_2_sample() {
        let (numbers, boards) = makeInput(sample: true)
        let dayFour = DayFour(numbers:  numbers, boards: boards)
        XCTAssertEqual(dayFour.partTwo(), 1924)
    }
    
    func testDayFour_2() {
        let (numbers, boards) = makeInput()
        let dayFour = DayFour(numbers:  numbers, boards: boards)
        XCTAssertEqual(dayFour.partTwo(), 21070)
    }
}
