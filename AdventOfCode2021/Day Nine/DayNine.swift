import Foundation

public final class DayNine {
    let values: [[Int]]
    
    public init(values: [[Int]]) {
        self.values = values
    }
    
    public func partOne() -> Int {
        var sum = 0
        for row in 0..<values.count {
            for col in 0..<values[row].count {
                let neighbours = adjacents(of: (row, col))
                sum += neighbours.filter { values[row][col] >= $0 }.isEmpty ? values[row][col] + 1 : 0
            }
        }

        return sum
    }

    public func partTwo() -> Int {
        var basins = [[Int]]()
        var copy = values

        for row in 0..<values.count {
            for col in 0..<values[row].count {
                if copy[row][col] != -1 && values[row][col] != 9 {
                    var basin = [Int]()
                    visitNeighbours(around: (row,col), copy: &copy, basin: &basin)
                    basins.append(basin)
                }
            }
        }

        return basins
            .map {
                $0.count
            }
            .max(count: 3)
            .reduce(1, *)
    }

    private func visitNeighbours(around: (Int, Int), copy: inout [[Int]], basin: inout [Int]) {
        let (row, col) = around

        guard copy[row][col] != -1 && values[row][col] != 9 else {
            return
        }

        basin.append(values[row][col])

        copy[row][col] = -1

        if row - 1 >= 0 {
            visitNeighbours(around: (row - 1, col), copy: &copy, basin: &basin)
        }

        if row + 1 < values.count {
            visitNeighbours(around: (row + 1, col), copy: &copy, basin: &basin)
        }

        if col - 1 >= 0 {
            visitNeighbours(around: (row, col - 1), copy: &copy, basin: &basin)
        }

        if col + 1 < values[row].count {
            visitNeighbours(around: (row, col + 1), copy: &copy, basin: &basin)
        }
    }

    private func adjacents(of coord: (Int, Int)) -> [Int] {
        let (row, col) = coord

        var result = [Int]()

        if row - 1 >= 0 {
            result.append(values[row - 1][col])
        }

        if row + 1 < values.count {
            result.append(values[row + 1][col])
        }

        if col - 1 >= 0 {
            result.append(values[row][col - 1])
        }

        if col + 1 < values[0].count {
            result.append(values[row][col + 1])
        }

        return result
    }
}
