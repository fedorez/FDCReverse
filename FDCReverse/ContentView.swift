//
//  ContentView.swift
//  FDCReverse
//
//  Created by Denis Fedorets on 09.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var showDetails = false
    //@State private var selectedPick = 1
    @State private var arrLen = 8
    
    @State private var numLines = 8
    @State private var numCols = 8
    
    var body: some View {
        VStack {
            Button("test reverse", action: reverse)
            Stepper("\(arrLen) digits", value: $arrLen, in: 1...12)
            Button("reverse array", action: reverseArray)
            Stepper("\(numLines) lines", value: $numLines, in: 1...12)
            Stepper("\(numCols) cols", value: $numCols, in: 1...12)
            Button("reverse matrix", action: reverseMatrix)
        }
        .padding()
    }
    
    func reverse() {
        var a = 6, b = 7
        print("a = \(a) and b = \(b)")
        swap2digitsByRef(firstDigit: &a, secondDigit: &b)
        print("a = \(a) and b = \(b)")
    }
    
    func reverseArray() {
        var arrOfInt = (1...arrLen).map( {_ in Int.random(in: 1...10)} )
        print(arrOfInt)
        reverseArrayOfInt(arrayOfInt: &arrOfInt)
        print(arrOfInt)
    }
    
    func reverseMatrix() {
        var matrix = generateMatrix(numofLines: numLines, numOfCols: numCols)
        print(matrix)
        let numOfLoops = numLines/2
        var cursor = 0
        for _ in 1...numOfLoops {
            var aux: Int
            for currCol in 0..<numCols {
                aux = matrix[cursor][currCol]
                matrix[cursor][currCol] = matrix[cursor + 1][currCol]
                matrix[cursor + 1][currCol] = aux
            }
            cursor = cursor + 2
        }
        print(matrix)
    }
    
    func swap2digitsByRef(firstDigit a: inout Int, secondDigit b: inout Int) {
        a = a + b
        b = a - b
        a = a - b
    }
    
    func reverseArrayOfInt(arrayOfInt arr: inout [Int]) {
        let numOfLoops = arr.count/2
        guard numOfLoops > 0 else {return}
        var leftIndex = 0
        var rightIndex = arr.count-1
        var aux: Int
        for _ in 1...numOfLoops {
            aux = arr[rightIndex]
            arr[rightIndex]=arr[leftIndex]
            arr[leftIndex] = aux
            leftIndex = leftIndex + 1
            rightIndex = rightIndex - 1
        }
    }
    
    func generateRandomVector(size: Int) -> [Int] {
            guard size > 0 else {
                return [Int]()
            }
        let result = Array(repeating: 0, count: size)
        return result.map{_ in Int.random(in: 0...9)}
    }
    
    func generateMatrix(numofLines: Int, numOfCols: Int)->[[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: numOfCols), count: numofLines)
        for i in 0..<numofLines {
            result[i] = generateRandomVector(size: numOfCols)
        }
        return result
    }
}

#Preview {
    ContentView()
}
