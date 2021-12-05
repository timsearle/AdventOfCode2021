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
    
    private func markLocations(_ vent: Vent, on seabed: inout [Coordinate: Int]) {
        // Only caring about horizontal or vertical lines
        
        if vent.startPos.xPos == vent.endPos.xPos {
            // increment/decrement through y
            let range = vent.startPos.yPos > vent.endPos.yPos ? vent.endPos.yPos...vent.startPos.yPos : vent.startPos.yPos...vent.endPos.yPos
            for i in range {
                seabed[Coordinate(xPos: vent.startPos.xPos, yPos: i), default: 0] += 1
            }
        } else if vent.startPos.yPos == vent.endPos.yPos {
            // increment/decrement through x
            let range = vent.startPos.xPos > vent.endPos.xPos ? vent.endPos.xPos...vent.startPos.xPos : vent.startPos.xPos...vent.endPos.xPos
            for i in range {
                seabed[Coordinate(xPos: i, yPos: vent.startPos.yPos), default: 0] += 1
            }
        }
    }
    
    public func partTwo() -> Int {
        0
    }
}
