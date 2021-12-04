import Foundation
import Algorithms

public final class DayOne {
    private let input: [Int]

    public init(input: [Int]) {
        self.input = input
    }

    private func countDifferences(_ array: [Int]) -> Int {
        var count = 0
        
        for (offset, entry) in array.enumerated().dropFirst() where entry > array[offset - 1] {
            count += 1
        }

        return count
    }

    public func partOne() -> Int {
        countDifferences(input)
    }

    public func partTwo() -> Int {
        let windows = input.windows(ofCount: 3)
        let sums = windows.map { $0.reduce(0, +) }
        return countDifferences(sums)
    }
}
