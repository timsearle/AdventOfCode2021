import Foundation

public final class DayEleven {
    let values: [[Int]]
    
    public init(values: [[Int]]) {
        self.values = values
    }
    
    public func partOne() -> Int {
        var grid = values
        var flashes = 0
        var allFlashed = false
        
        for _ in 0..<100 {
            incrementOctopuses(&grid,
                               flashCount: &flashes,
                               allFlashed: &allFlashed)
        }
        
        return flashes
    }
    
    public func partTwo() -> Int {
        var grid = values
        var flashes = 0
        var allFlashed = false
        var count = 0
        
        while true {
            count += 1
            incrementOctopuses(&grid, flashCount: &flashes, allFlashed: &allFlashed)
            if allFlashed {
                return count
            }
        }
    }
    
    private func incrementOctopuses(_ grid: inout [[Int]], flashCount: inout Int, allFlashed: inout Bool) {
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                incrementNeighbours(coord: (i, j), in: &grid, flashCount: &flashCount)
            }
        }
        
        var all = true
        
        // Clear flashes
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 10 {
                    grid[i][j] = 0
                } else {
                    all = false
                }
            }
        }
        
        allFlashed = all
    }
    
    private func incrementNeighbours(coord: (Int, Int), in grid: inout [[Int]], flashCount: inout Int) {
        let (row, col) = coord
        
        guard grid[row][col] != 10 else {
            return
        }
        
        grid[row][col] += 1
        
        guard grid[row][col] == 10 else {
            return
        }
        
        flashCount += 1
        
        for r in (row - 1...row + 1) {
            for c in (col - 1...col + 1) {
                guard (r,c) != (row,col),
                      r >= 0 && c >= 0,
                      r < grid.count && c < grid[r].count else {
                          continue
                      }
                
                incrementNeighbours(coord: (r, c), in: &grid, flashCount: &flashCount)
            }
        }
    }
}
