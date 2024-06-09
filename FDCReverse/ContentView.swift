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
    
    var body: some View {
        VStack {
            Button("reverse", action: reverse)
            Stepper("\(arrLen) digits", value: $arrLen, in: 1...12)
            Button("reverse array", action: reverseArray)
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
}

#Preview {
    ContentView()
}
