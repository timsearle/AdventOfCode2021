import Foundation

public final class DayTen {
    let lines: [String]
    let openMap: [Character: Character] = ["[":"]","(":")","{":"}","<":">"]
    let scoreMap: [Character: Int] = [")": 3, "]": 57, "}": 1197, ">": 25137]
    let scoreMap2: [Character: Int] = [")": 1, "]": 2, "}": 3, ">": 4]

    public init(lines: [String]) {
        self.lines = lines
    }
    
    public func partOne() -> Int {
        var sum = 0
        
        for line in lines {
            var stack = [Character]()
        
            for char in line {
                if char == "(" || char == "[" || char == "{" || char == "<" {
                    stack.append(openMap[char]!)
                } else {
                    guard let last = stack.popLast(), last == char else {
                        sum += scoreMap[char]!
                        break
                    }
                }
            }
        }
        
        return sum
    }

    public func partTwo() -> Int {
        var results = [Int]()
        for line in lines {
            let chars = remainingCharacters(line)
            if chars.isEmpty {
                continue
            }
            let nums = chars.map { scoreMap2[$0]! }

            var sum = 0

            for num in nums {
                sum *= 5
                sum += num
            }
            results.append(sum)
        }
        
        let sorted = results.sorted()
        return sorted[(sorted.count / 2)]
    }

    private func remainingCharacters(_ line: String) -> [Character] {
        var stack = [Character]()

        for char in line {
            if char == "(" || char == "[" || char == "{" || char == "<" {
                stack.append(openMap[char]!)
            } else {
                guard let last = stack.popLast(), last == char else {
                    return []
                }
            }
        }

        return stack.reversed()
    }
}
