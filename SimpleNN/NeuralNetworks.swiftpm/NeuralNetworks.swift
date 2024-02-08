//
//  NeuralNetworks.swift
//  NeuralNetworks
//
//  Created by Wentao Ma on 2024/2/8.
//

import Foundation

class Neuron {
    var weights:Vector
    var bias:Double
    
    init( weights:Vector, bias:Double) {
        self.weights = weights
        self.bias = bias
    }
    
    func sigmoid(value:Double) -> Double {
        //  function: f(x) = 1 / (1 + e^(-x))
        return 1 / (1 + numSwfit.Exp(value:-1*value))
    }

    func feedforward(inputs:Vector) -> Double {
        // Dot mul inputs with weights, add bias, then output
        let total = numSwfit.Dot(data1:inputs,data2:weights) + bias
        return sigmoid(value:total)
    }
    
    
    static func TestNeuron() ->Neuron {
        let weights = [0.0, 1.0] // w1 = 0, w2 = 1
        let bias = 4.0                   // b = 4
        let neuron = Neuron(weights:weights, bias:bias)

        return neuron
    }
    
}

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
    var h1: Neuron
    var h2: Neuron
    var o1: Neuron
    
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
    
    var b1: Double
    var b2: Double
    var b3: Double
    
    
    
    init() {
        let weights = [0.0, 1.0]
        let bias = 0.0

        // The Neuron class here is from the previous section
        h1 = Neuron(weights:weights, bias:bias)
        h2 = Neuron(weights:weights, bias:bias)
        o1 = Neuron(weights:weights, bias:bias)
        
         w1 = Double.random(in: 0.0...1.0)
         w2 = Double.random(in: 0.0...1.0)
         w3 = Double.random(in: 0.0...1.0)
         w4 = Double.random(in: 0.0...1.0)
         w5 = Double.random(in: 0.0...1.0)
         w6 = Double.random(in: 0.0...1.0)
        
         b1 = Double.random(in: 0.0...1.0)
         b2 = Double.random(in: 0.0...1.0)
         b3 = Double.random(in: 0.0...1.0)
        
    }
    
    func feedforward(value:Vector) -> Double {
        let ho1 = sigmoid(value:w1 * value[0] + w2 * value[1] + b1)
        let ho2 = sigmoid(value:w3 * value[0] + w4 * value[1] + b2)
        let oo1 = sigmoid(value:w5 * ho1 + w6 * ho2 + b3)
        return oo1
    }
    
    func train(data:Matrix, all_y_trues:Vector, epochs:Int) {
        /*
        - data is a (n x 2) numpy array, n = # of samples in the dataset.
        - all_y_trues is a numpy array with n elements.
          Elements in all_y_trues correspond to those in data.
        */
        let learn_rate = 0.1
        
        for epoch in 0..<epochs {
            for i in 0..<data.count {
                let x = data[i]
                let y_true = all_y_trues[i]
                
                // --- Do a feedforward (we'll need these values later)
                let sum_h1 = w1 * x[0] + w2 * x[1] + b1
                var ho1 = sigmoid(value:sum_h1)

                let sum_h2 = w3 * x[0] + w4 * x[1] + b2
                var ho2 = sigmoid(value:sum_h2)

                let sum_o1 = w5 * ho1 + w6 * ho2 + b3
                var oo1 = sigmoid(value:sum_o1)
                let y_pred = oo1

                // --- Calculate partial derivatives.
                // --- Naming: d_L_d_w1 represents "partial L / partial w1"
                let d_L_d_ypred = -2 * (y_true - y_pred)

                // Neuron o1
                let d_ypred_d_w5 = ho1 * deriv_sigmoid(value:sum_o1)
                let d_ypred_d_w6 = ho2 * deriv_sigmoid(value:sum_o1)
                let d_ypred_d_b3 = deriv_sigmoid(value:sum_o1)

                let d_ypred_d_h1 = w5 * deriv_sigmoid(value:sum_o1)
                let d_ypred_d_h2 = w6 * deriv_sigmoid(value:sum_o1)

                // Neuron h1
                let d_h1_d_w1 = x[0] * deriv_sigmoid(value:sum_h1)
                let d_h1_d_w2 = x[1] * deriv_sigmoid(value:sum_h1)
                let d_h1_d_b1 = deriv_sigmoid(value:sum_h1)

                // Neuron h2
                let d_h2_d_w3 = x[0] * deriv_sigmoid(value:sum_h2)
                let d_h2_d_w4 = x[1] * deriv_sigmoid(value:sum_h2)
                let d_h2_d_b2 = deriv_sigmoid(value:sum_h2)

                // --- Update weights and biases
                // Neuron h1
                w1 -= learn_rate * d_L_d_ypred * d_ypred_d_h1 * d_h1_d_w1
                w2 -= learn_rate * d_L_d_ypred * d_ypred_d_h1 * d_h1_d_w2
                b1 -= learn_rate * d_L_d_ypred * d_ypred_d_h1 * d_h1_d_b1

                // Neuron h2
                w3 -= learn_rate * d_L_d_ypred * d_ypred_d_h2 * d_h2_d_w3
                w4 -= learn_rate * d_L_d_ypred * d_ypred_d_h2 * d_h2_d_w4
                b2 -= learn_rate * d_L_d_ypred * d_ypred_d_h2 * d_h2_d_b2

                // Neuron o1
                w5 -= learn_rate * d_L_d_ypred * d_ypred_d_w5
                w6 -= learn_rate * d_L_d_ypred * d_ypred_d_w6
                b3 -= learn_rate * d_L_d_ypred * d_ypred_d_b3
            }
            // --- Calculate total loss at the end of each 10 epoch
            if( epoch % 10 == 0) {
                var y_preds=[Double]()
                for i in 0..<data.count {
                    y_preds.append( feedforward(value:data[i]) )
                }
                
                let loss = mse_loss(targets:all_y_trues, values:y_preds)
                print("Epoch "+String(epoch)+" loss: "+String(loss))
            }
        }
    }
    
    func DoTrain() {
        let data = [
            [-2.0, -1.0],  // Alice
          [25.0, 6.0],   // Bob
          [17.0, 4.0],   // Charlie
          [-15.0, -6.0], // Diana
        ]
        let all_y_trues = [
          1.0, // Alice
          0.0, // Bob
          0.0, // Charlie
          1.0, // Diana
        ]
        
        let emily = [-7.0, -3.0] // 128 pounds, 63 inches
        let frank = [20.0, 2.0]  // 155 pounds, 68 inches
        
        print("Before train....")
        print("Emily: " + String(feedforward(value:emily)) ) // 0.951 - F
        print("Frank: " + String(feedforward(value:frank)) ) // 0.039 - M
        
        train( data:data, all_y_trues:all_y_trues, epochs:1000)
        
        print("After train....")
        print("Emily: " + String(feedforward(value:emily)) ) // 0.951 - F
        print("Frank: " + String(feedforward(value:frank)) ) // 0.039 - M
    }
    
}
