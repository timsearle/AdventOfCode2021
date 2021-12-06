import Foundation

public final class DaySix {
    let fish: [Int]
    
    public init(fish: [Int]) {
        self.fish = fish
    }
    
    public func partOne() -> Int {
        optimisedSimulate(iterations: 80)
    }

    
    public func partTwo() -> Int {
        optimisedSimulate(iterations: 256)
    }

    private func optimisedSimulate(iterations: Int) -> Int {
        var dictionary = fish.reduce(into: [Int: Int]()) { partialResult, value in
            partialResult[value, default: 0] += 1
        }

        for _ in 0..<iterations {
            var newDictionary = [Int: Int]()

            for key in dictionary.keys {
                if key == 0 {
                    newDictionary[8, default: 0] += dictionary[key]!
                    newDictionary[6, default: 0] += dictionary[key]!
                } else {
                    newDictionary[key - 1, default: 0] += dictionary[key]!
                }
            }

            dictionary = newDictionary
        }

        return dictionary.values.reduce(0, +)
    }
}
