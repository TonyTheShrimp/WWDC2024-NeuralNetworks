//
//  numSwift.swift
//  NeuralNetworks
//
//  Created by Wentao Ma on 2024/2/8.
//
import Swift
import Foundation

import Accelerate

typealias Matrix = Array<[Double]>
typealias Vector = [Double]

class numSwfit {
    static func Exp( value:Double) -> Double {
        return exp(value)
    }
    
    static func Dot( data:Vector, value:Double) -> Vector {
        var n = value
        var result = Vector(repeating: 0.0, count: data.count)
        vDSP_vsmulD(data, 1, &n, &result, 1, vDSP_Length(data.count))
        return result
    }
    
    static func Dot( data:Matrix, value:Double) -> Matrix {
        let result = data.map({Dot(data: $0, value: value)})
        return result
    }
    
    static func Dot( data1:Vector, data2:Vector) -> Double {
        var sum = 0.0
        for i in 0..<data1.count {
            sum += data1[i] * data2[i]
        }
        return sum
    }
}
