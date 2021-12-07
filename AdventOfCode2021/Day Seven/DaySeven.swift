import Foundation

public final class DaySeven {
    let crabPositions: [Int]
    
    public init(crabPositions: [Int]) {
        self.crabPositions = crabPositions
    }
    
    public func partOne() -> Int {
        minPositions()
    }

    private func minPositions(multiplier: Bool = false) -> Int {
        let (min, max) = crabPositions.minAndMax()!

        var sums = [Int]()
        var sum = 0

        for i in min...max {
            for crab in crabPositions {
                let n = abs(i - crab)
                if multiplier {
                    sum += (n * (n + 1)) / 2
                } else {
                    sum += n
                }
            }

            sums.append(sum)
            sum = 0
        }

        return sums.min()!
    }
    
    public func partTwo() -> Int {
        minPositions(multiplier: true)
    }
}
