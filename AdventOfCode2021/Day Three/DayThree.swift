import Foundation

public final class DayThree {
    private let input: [[Int]]

    public init(input: [[Int]]) {
        self.input = input
    }

    public func partOne() -> Int {
        let count = input[0].count

        var gamma = [Int]()

        for i in 0..<count {
            var zeroCount = 0
            var oneCount = 0

            for log in input {
                if log[i] == 1 {
                    oneCount += 1
                } else {
                    zeroCount += 1
                }
            }

            gamma.append(zeroCount > oneCount ? 0 : 1)
        }

        let decGamma = Int(gamma.map { String($0) }.joined(), radix: 2)!
        let decEpsilon = Int(gamma.map { $0 == 0 ? "1" : "0" }.joined(), radix: 2)!

        return decGamma * decEpsilon
    }

    public func partTwo() -> Int {
        return oxygen() * co2()
    }

    private func co2() -> Int {
        var inputs = input

        let upper = inputs[0].count

        for i in 0..<upper {
            if inputs.count == 1 {
                break
            }
            var zeroCountIndexes = [Int]()
            var oneCountIndexes = [Int]()

            for log in inputs.enumerated() {
                if log.element[i] == 1 {
                    oneCountIndexes.append(log.offset)
                } else {
                    zeroCountIndexes.append(log.offset)
                }
            }

            if oneCountIndexes.count < zeroCountIndexes.count {
                inputs = inputs.enumerated().filter { oneCountIndexes.contains($0.offset) }.map { $0.element }
            } else if oneCountIndexes.count > zeroCountIndexes.count || oneCountIndexes.count == zeroCountIndexes.count {
                inputs = inputs.enumerated().filter { zeroCountIndexes.contains($0.offset) }.map { $0.element }
            }
        }

        return Int(inputs[0].map { String($0) }.joined(), radix: 2)!
    }

    private func oxygen() -> Int {
        var inputs = input
        let upper = inputs[0].count

        for i in 0..<upper {
            if inputs.count == 1 {
                break
            }
            var zeroCountIndexes = Set<Int>()
            var oneCountIndexes = Set<Int>()

            for log in inputs.enumerated() {
                if log.element[i] == 1 {
                    oneCountIndexes.insert(log.offset)
                } else {
                    zeroCountIndexes.insert(log.offset)
                }
            }

            if oneCountIndexes.count > zeroCountIndexes.count || oneCountIndexes.count == zeroCountIndexes.count {
                inputs = inputs.enumerated().filter { oneCountIndexes.contains($0.offset) }.map { $0.element }
            } else if oneCountIndexes.count < zeroCountIndexes.count {
                inputs = inputs.enumerated().filter { zeroCountIndexes.contains($0.offset) }.map { $0.element }
            }
        }
        return Int(inputs[0].map { String($0) }.joined(), radix: 2)!
    }
}
