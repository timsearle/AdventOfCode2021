import Foundation

public class Board {
    public var grid: [[Int]]
    public var ignore = false
    
    public init(grid: [[Int]]) {
        self.grid = grid
    }
    
    public func update(number: Int) {
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == number {
                    grid[row][col] = -1
                }
            }
        }
    }
    
    public func hasWon() -> Bool {
        for row in 0..<grid.count {
            var hasWonRow = true
            
            for col in 0..<grid[row].count {
                if grid[row][col] != -1 {
                    hasWonRow = false
                    break
                }
            }
            
            if hasWonRow {
                return true
            }
        }
        
        for row in 0..<grid.count {
            var hasWonCol = true
            
            for col in 0..<grid[row].count {
                if grid[col][row] != -1 {
                    hasWonCol = false
                    break
                }
            }
            
            if hasWonCol {
                return true
            }
        }
        
        return false
    }
}

public final class DayFour {
    private let numbers: [Int]
    private let boards: [Board]
    
    public init(numbers: [Int], boards: [Board]) {
        self.numbers = numbers
        self.boards = boards
    }
    
    public func partOne() -> Int {
        playBingo()
    }
    
    private func score(for board: Board, finalNumber: Int) -> Int {
        var sum = 0
        for row in board.grid {
            for col in row {
                if col != -1 {
                    sum += col
                }
            }
        }
        
        return sum * finalNumber
    }
    
    private func playBingo(removingBoards: Bool = false) -> Int {
        for (offset, number) in numbers.enumerated() {
            for board in boards {
                guard !board.ignore else {
                    continue
                }
                
                board.update(number: number)
                
                // None can win before 5 numbers
                guard offset >= 4, board.hasWon() else {
                    continue
                }
                
                guard removingBoards else {
                    return score(for: board, finalNumber: number)
                }
                
                board.ignore = true
                
                let isMoreBoards = !boards.filter { !$0.ignore }.isEmpty
                
                guard removingBoards && isMoreBoards else {
                    return score(for: board, finalNumber: number)
                }
            }
        }
        
        return 0
    }
    
    public func partTwo() -> Int {
        playBingo(removingBoards: true)
    }
}
