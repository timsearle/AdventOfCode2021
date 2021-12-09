import Foundation

public struct DigitalValues {
    public let input: [String]
    public let output: [String]

    public init(input: [String], output: [String]) {
        self.input = input
        self.output = output
    }
}

public final class DayEight {
    let values: [DigitalValues]

    let lookup = ["acedgfb".sorted(): 8,
                  "cdfbe".sorted(): 5,
                  "gcdfa".sorted(): 2,
                  "fbcad".sorted(): 3,
                  "dab".sorted(): 7,
                  "cefabd".sorted(): 9,
                  "cdfgeb".sorted(): 6,
                  "eafb".sorted(): 4,
                  "cagedb".sorted(): 0,
                  "ab".sorted(): 1]
    
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

//        for value in values {
//            var digits = [String]()
//            for entry in value.output {
//                print(entry)
//                digits.append(String(lookup[entry.sorted()]!))
//            }
//            sum += Int(digits.joined())!
//        }

        return sum
    }
}
