import Foundation
import Algorithms

public enum Fold {
    case vertical(Int)
    case horizontal(Int)
}

public final class DayThirteen {
    let grid: [[String]]
    let folds: [Fold]
    
    public init(grid: [[String]], folds: [Fold]) {
        self.folds = folds
        self.grid = grid
    }
    
    public func partOne() -> Int {
        var (a, b) = split(grid: grid, at: folds[0])

        if case .vertical = folds[0] {
            fold(b: b, onto: &a, up: true)
        } else {
            fold(b: b, onto: &a, up: false)
        }

        return a
            .flatMap { $0 }
            .filter { $0 == "#" }
            .count
    }

    public func partTwo() {
        var grid = grid

        for foldInstruction in folds {
            var (a, b) = split(grid: grid, at: foldInstruction)

            if case .vertical = foldInstruction {
                fold(b: b, onto: &a, up: true)
            } else {
                fold(b: b, onto: &a, up: false)
            }

            grid = a
        }

        // Print the result
        for row in grid.reversed() {
            print(row, terminator: "")
        }
    }

    private func split(grid: [[String]], at fold: Fold) -> ([[String]], [[String]]) {
        switch fold {
        case let .horizontal(val):
            let a = Array(grid[0..<val])
            let b = Array(grid[val + 1..<grid.count])
            return (a, b)
        case let .vertical(val):
            var a = [[String]]()
            var b = [[String]]()
            for row in grid {
                a.append(Array(row[0..<val]))
                b.append(Array(row[val + 1..<row.count]))
            }

            return (a, b)
        }
    }

    private func fold(b: [[String]], onto a: inout [[String]], up: Bool) {
        let half = up ? b.map { Array($0.reversed()) } : Array(b.reversed())

        for (i, row) in half.enumerated() {
            for (j, val) in row.enumerated() where val == "#" {
                a[i][j] = "#"
            }
        }
    }
}
