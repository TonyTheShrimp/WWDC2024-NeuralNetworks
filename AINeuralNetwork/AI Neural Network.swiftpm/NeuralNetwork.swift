//
//  NeuralNetworks.swift
//  NeuralNetworks
//
//  Created by Wentao Ma on 2024/2/8.
//

import Foundation

class NeuralNetwork {
  /*
  A neural network with:
    - 2 inputs
    - a hidden layer with 2 neurons (h1, h2)
    - an output layer with 1 neuron (o1)
  Each neuron has the same weights and bias:
    - w = [0, 1]
    - b = 0
  */
    
    
    func sigmoid(value:Double) -> Double {
        //  function: f(x) = 1 / (1 + e^(-x))
        return 1 / (1 + numSwfit.Exp(value:-1*value))
    }
    
    func deriv_sigmoid(value:Double)->Double{
        // Derivative of sigmoid: f'(x) = f(x) * (1 - f(x))
        let fx = sigmoid(value:value)
        return fx * (1 - fx)
    }
      
    func mse_loss(targets:Vector, values:Vector) -> Double{
        var sum = 0.0
        for i in 0..<targets.count {
            sum += (targets[i] - values[i]) * (targets[i] - values[i])
        }
        sum = sum / Double(targets.count)
        return sum
    }
    
    var w1: Double
    var w2: Double
    var w3: Double
    var w4: Double
    var w5: Double
    var w6: Double
    
    var wv1: Double
    var wv2: Double
    var wv3: Double
    var wv4: Double
    var wv5: Double
    var wv6: Double
    
    var b1: Double
    var b2: Double
    var b3: Double
    
    var sum_n1: Double
    var sum_n2: Double
    var sum_n3: Double
    
    var no1: Double
    var no2: Double
    var no3: Double
    
    var outputDelta: Double
    
    var mseLoss: Double
    
    var feedForwardResult = [Double]()
    
    var trainData = [
        [-12.0, -1.0],
        [-21.0, -4.0],
        [ 15.0,  4.0],
        [  7.0,  3.0],
        [  7.0,  3.0]
        ]
    let targetResult = [
      1.0,
      1.0,
      0.0,
      0.0,
      0.0
    ]
    
    var reulstDelta = [0.0,0.0,0.0,0.0,0.0]
    
    init() {
        
        w1 = -1
        w2 = -1
        w3 = -1
        w4 = -1
        w5 = -1
        w6 = -1
        
        wv1 = -1
        wv2 = -1
        wv3 = -1
        wv4 = -1
        wv5 = -1
        wv6 = -1
       
        b1 = -1
        b2 = -1
        b3 = -1
        
        sum_n1 = -1
        sum_n2 = -1
        sum_n3 = -1
        
        no1 = -1
        no2 = -1
        no3 = -1
        
        outputDelta = -1
        
        mseLoss = -1
    }
    
    func resetNetwork() {
        
        w1 = Double.random(in: 0.0...1.0)
        w2 = Double.random(in: 0.0...1.0)
        w3 = Double.random(in: 0.0...1.0)
        w4 = Double.random(in: 0.0...1.0)
        w5 = Double.random(in: 0.0...1.0)
        w6 = Double.random(in: 0.0...1.0)
       
        b1 = Double.random(in: 0.0...1.0)
        b2 = Double.random(in: 0.0...1.0)
        b3 = Double.random(in: 0.0...1.0)
        
        sum_n1 = -1
        sum_n2 = -1
        sum_n3 = -1
        
        no1 = -1
        no2 = -1
        no3 = -1
        
        outputDelta = -1
        
        mseLoss = -1
    }
    
    func feedforward(index:Int) {
        feedforward(value:trainData[index])
        
        reulstDelta[index] = abs(no3-targetResult[index])
    }
    
    func feedforward(value:Vector) {
        wv1 = w1 * value[0]
        wv2 = w2 * value[1]
        sum_n1 = w1 * value[0] + w2 * value[1] + b1
        no1 = sigmoid(value:sum_n1)

        wv3 = w3 * value[0]
        wv4 = w4 * value[1]
        sum_n2 = w3 * value[0] + w4 * value[1] + b2
        no2 = sigmoid(value:sum_n2)

        wv5 = w5 * no1
        wv6 = w6 * no2
        sum_n3 = w5 * no1 + w6 * no2 + b3
        no3 = sigmoid(value:sum_n3)
    }
    
    let learn_rate = 0.1
    
    func Backpropagation(index:Int){
        let outputDelta = -2 * (targetResult[index] - no3)

        // Neuron o1
        let deltaW5 = no1 * deriv_sigmoid(value:sum_n3)
        let deltaW6 = no2 * deriv_sigmoid(value:sum_n3)
        let deltaB3 = deriv_sigmoid(value:sum_n3)

        let deltaN1 = w5 * deriv_sigmoid(value:sum_n3)
        let deltaN2 = w6 * deriv_sigmoid(value:sum_n3)

        // Neuron h1
        let deltaW1 = trainData[index][0] * deriv_sigmoid(value:sum_n1)
        let deltaW2 = trainData[index][1] * deriv_sigmoid(value:sum_n1)
        let deltaB1 = deriv_sigmoid(value:sum_n1)

        // Neuron h2
        let deltaW3 = trainData[index][0] * deriv_sigmoid(value:sum_n2)
        let deltaW4 = trainData[index][1] * deriv_sigmoid(value:sum_n2)
        let deltaB2 = deriv_sigmoid(value:sum_n2)

        // --- Update weights and biases
        // Neuron h1
        w1 -= learn_rate * outputDelta * deltaN1 * deltaW1
        w2 -= learn_rate * outputDelta * deltaN1 * deltaW2
        b1 -= learn_rate * outputDelta * deltaN1 * deltaB1

        print("DW1:"+String(learn_rate * outputDelta * deltaN1 * deltaW1)+"   DW2:"+String(learn_rate * outputDelta * deltaN1 * deltaW2)+"   DB1:"+String(learn_rate * outputDelta * deltaN1 * deltaB1))
        // Neuron h2
        w3 -= learn_rate * outputDelta * deltaN2 * deltaW3
        w4 -= learn_rate * outputDelta * deltaN2 * deltaW4
        b2 -= learn_rate * outputDelta * deltaN2 * deltaB2

        print("DW3:"+String(learn_rate * outputDelta * deltaN2 * deltaW3)+"   DW4:"+String(learn_rate * outputDelta * deltaN2 * deltaW4)+"   DB2:"+String(learn_rate * outputDelta * deltaN2 * deltaB2))
        // Neuron o1
        w5 -= learn_rate * outputDelta * deltaW5
        w6 -= learn_rate * outputDelta * deltaW6
        b3 -= learn_rate * outputDelta * deltaB3
        
        print("DW5:"+String(learn_rate * outputDelta * deltaW5)+"   DW6:"+String(learn_rate * outputDelta * deltaW6)+"   DB3:"+String(learn_rate * outputDelta * deltaB3))
    }
    
    func calMseLoss() -> Double {
        feedForwardResult.removeAll()
        for i in 0..<trainData.count {
            feedforward(index:i)
            feedForwardResult.append( no3 )
        }
        
        mseLoss = mse_loss(targets:targetResult, values:feedForwardResult)
        
        return mseLoss
    }
    
    func train(epochs:Int) {
        /*
        - data is a (n x 2) numpy array, n = # of samples in the dataset.
        - all_y_trues is a numpy array with n elements.
          Elements in all_y_trues correspond to those in data.
        */
        
        
        for epoch in 0..<epochs {
            
            trainOnce()
        }
    }
    
    func trainOnce() {
        //for i in 0..<trainData.count {
        for i in 0..<4 {
            //let x = trainData[i]
            //let target = targetResult[i]
            
            // --- Do a feedforward (we'll need these values later)
            feedforward(index: i)
            
            // --- Calculate partial derivatives.
            // --- Naming: d_L_d_w1 represents "partial L / partial w1"
            Backpropagation(index: i)
        }
    }
    
    
}
