import Foundation

public final class DayTwo {
    private let input: [(String, Int)]

    public init(input: [(String, Int)]) {
        self.input = input
    }

    public func partOne() -> Int {
        var horizontal = 0
        var depth = 0

        for (instruction, value) in input {
            switch instruction {
            case "forward":
                horizontal += value
            case "down":
                depth += value
            case "up":
                depth -= value
            default:
                break
            }
        }

        return horizontal * depth
    }

    public func partTwo() -> Int {
        var horizontal = 0
        var depth = 0
        var aim = 0

        for (instruction, value) in input {
            switch instruction {
            case "forward":
                horizontal += value
                depth += aim * value    
            case "down":
                aim += value
            case "up":
                aim -= value
            default:
                break
            }
        }

        return horizontal * depth
    }
}
