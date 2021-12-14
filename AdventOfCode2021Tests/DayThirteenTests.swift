import XCTest
import AdventOfCode2021

class DayThirteenTests: XCTestCase {
    private func makeInput(sample: Bool = false) -> ([[String]], [Fold]) {
        let inputURL = Bundle(for: type(of: self)).url(forResource: sample ? "DayThirteen-sample" : "DayThirteen", withExtension: "txt")!
        
        let lines = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .dropLast()

        var foldsBegin = 0
        var coords = [(Int, Int)]()

        for (offset, line) in lines.enumerated() {
            guard !line.isEmpty else {
                foldsBegin = offset + 1
                break
            }

            let comps = line.components(separatedBy: ",")
            coords.append((Int(comps[0])!, Int(comps[1])!))
        }

        var folds = [Fold]()

        for i in foldsBegin..<lines.count {
            let line = lines[i].replacingOccurrences(of: "fold along ", with: "")

            let coord = line.components(separatedBy: "=")

            if coord[0] == "x" {
                folds.append(.horizontal(Int(coord[1])!))
            } else {
                folds.append(.vertical(Int(coord[1])!))
            }
        }

        var minX = Int.max
        var maxX = 0

        var minY = Int.max
        var maxY = 0

        for coord in coords {
            let (x, y) = coord
            minX = min(x, minX)
            minY = min(y, minY)
            maxX = max(x, maxX)
            maxY = max(y, maxY)
        }

        let adjustedCoords = coords.map { x, y in
            return (x - minX, y - minY)
        }

        let adjustedFolds = folds.map { fold -> Fold in
            switch fold {
            case let .vertical(value):
                return Fold.vertical(value -  minY)
            case let .horizontal(value):
                return Fold.horizontal(value -  minX)
            }
        }

        let cols = Array(repeating: ".", count: (maxY - minY) + 1)
        var grid = Array(repeating: cols, count: (maxX - minX) + 1)

        for (row, col) in adjustedCoords {
            grid[row][col] = "#"
        }

        return (grid, adjustedFolds)
    }
    
    func testDayThirteen_1_sample() {
        let values = makeInput(sample: true)
        let dayThirteen = DayThirteen(grid: values.0, folds: values.1)
        XCTAssertEqual(dayThirteen.partOne(), 17)
    }
    
    func testDayThirteen_1() {
        let values = makeInput()
        let dayThirteen = DayThirteen(grid: values.0, folds: values.1)
        XCTAssertEqual(dayThirteen.partOne(), 607)
    }

    func testDayThirteen_2() {
        let values = makeInput()
        let dayThirteen = DayThirteen(grid: values.0, folds: values.1)
        dayThirteen.partTwo()
    }
}
