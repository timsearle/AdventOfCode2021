import Foundation

public struct DigitalValues {
    public let input: [String]
    public let output: [String]

    public init(input: [String], output: [String]) {
        self.input = input
        self.output = output
    }
}

struct SegmentDisplay {
    var one: Set<String.Element> = []
    var two: Set<String.Element> = []
    var three: Set<String.Element> = []
    var four: Set<String.Element> = []
    var five: Set<String.Element> = []
    var six: Set<String.Element> = []
    var seven: Set<String.Element> = []
    var eight: Set<String.Element> = []
    var nine: Set<String.Element> = []
    
    var all: [Set<String.Element>] {
        [one, two, three, four, five, six, seven, eight, nine]
    }
    
    func checkDigit(for string: String) -> Int {
        let compare = Set(string)
        for i in 0..<9 {
            if compare == all[i] {
                return i + 1
            }
        }
        
        return 0
    }
}

public final class DayEight {
    let values: [DigitalValues]
    
    public init(values: [DigitalValues]) {
        self.values = values
    }
    
    public func partOne() -> Int {
        var sum = 0

        for value in values {
            for entry in value.output {
                if entry.count == 2 || entry.count == 4 || entry.count == 7 || entry.count == 3 {
                    sum += 1
                }
            }
        }

        return sum
    }

    public func partTwo() -> Int {
        var sum = 0

        for value in values {            
            var segment = SegmentDisplay()
            
            segment.one = Set(value.input.filter { $0.count == 2 }.first!)
            segment.seven = Set(value.input.filter { $0.count == 3 }.first!)
            segment.four = Set(value.input.filter { $0.count == 4 }.first!)
            segment.eight = Set(value.input.filter { $0.count == 7 }.first!)
            
            let sixes = value.input.filter { $0.count == 6 }
                            
            for entry in sixes {
                let set = Set(entry.map { $0 })
                let result = segment.one.subtracting(set)
                if !result.isEmpty {
                    let fives = value.input.filter { $0.count == 5 }
                    segment.six = set
                    
                    for five in fives {
                        let setFive = Set(five.map { $0 })
                        let new = setFive.union(result)
                        if new != setFive {
                            segment.nine = new
                            segment.five = setFive
                        } else if segment.one.isSubset(of: setFive) {
                            segment.three = setFive
                        } else {
                            segment.two = setFive
                        }
                    }
                }
            }
            
            let digits = value.output.map { segment.checkDigit(for: $0) }
            
            sum += Int(digits.map { String($0) }.joined())!
        }
        
        return sum
    }
}
