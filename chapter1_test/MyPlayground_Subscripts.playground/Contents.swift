//: Playground - noun: a place where people can play

import UIKit

//下标（Subscripts）

//下标语法
//subscript(index: Int) -> Int {
//    get {
//        //返回一个适当的Int类型的值
//    }
//    set {
//        //执行适当的赋值操作
//    }
//}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times there is \(threeTimesTable[6])")

//下标用法
var numberOfLegs = ["spider": 8, "ant": 6,"cat": 4]
numberOfLegs["bird"] = 2

//下标选项
struct Matrix {
    let rows: Int, colums: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.colums = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < colums
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row: row, column: column),"index out of range")
            return grid[(row * colums) + column]
        }
        set {
            assert(indexIsValidForRow(row: row, column: column),"index out of range")
            grid[(row * colums) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
//let someValue = matrix[2,2]
// 断言将会触发，因为 [2, 2] 已经超过了 matrix 的范围
