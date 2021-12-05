import Foundation

public struct Vent {
    public let startPos: Coordinate
    public let endPos: Coordinate
    
    public init(startPos: Coordinate, endPos: Coordinate) {
        self.startPos = startPos
        self.endPos = endPos
    }
}

public struct Coordinate: Hashable {
    public let xPos: Int
    public let yPos: Int
    
    public init(xPos: Int, yPos: Int) {
        self.xPos = xPos
        self.yPos = yPos
    }
}

public final class DayFive {
    let vents: [Vent]
    
    public init(vents: [Vent]) {
        self.vents = vents
    }
    
    public func partOne() -> Int {
        var seabed = [Coordinate: Int]()
        
        vents.forEach {
            markLocations($0, on: &seabed)
        }
        
        return seabed.values.filter { $0 != 1 }.count
    }
    
    private func markLocations(_ vent: Vent, on seabed: inout [Coordinate: Int], shouldIncludeDiagonal: Bool = false) {
        if vent.startPos.xPos == vent.endPos.xPos {
            // increment/decrement through y
            for i in stride(from: vent.startPos.yPos, through: vent.endPos.yPos, by: vent.startPos.yPos > vent.endPos.yPos ? -1 : 1) {
                seabed[Coordinate(xPos: vent.startPos.xPos, yPos: i), default: 0] += 1
            }
        } else if vent.startPos.yPos == vent.endPos.yPos {
            // increment/decrement through x
            for i in stride(from: vent.startPos.xPos, through: vent.endPos.xPos, by: vent.startPos.xPos > vent.endPos.xPos ? -1 : 1) {
                seabed[Coordinate(xPos: i, yPos: vent.startPos.yPos), default: 0] += 1
            }
        } else if shouldIncludeDiagonal {
            // Diagonal coordinates
            for (x, y) in
            zip(stride(from: vent.startPos.xPos, through: vent.endPos.xPos, by: vent.startPos.xPos > vent.endPos.xPos ? -1 : 1),
                stride(from: vent.startPos.yPos, through: vent.endPos.yPos, by: vent.startPos.yPos > vent.endPos.yPos ? -1 : 1)) {
                seabed[Coordinate(xPos: x, yPos: y), default: 0] += 1
            }
        }        
    }
    
    public func partTwo() -> Int {
        var seabed = [Coordinate: Int]()
        
        vents.forEach {
            markLocations($0, on: &seabed, shouldIncludeDiagonal: true)
        }
        
        return seabed.values.filter { $0 != 1 }.count
    }
}
