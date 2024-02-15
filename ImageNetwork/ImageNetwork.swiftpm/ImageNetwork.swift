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
    
    var inputTotal = 0.0
    var output = 0.0
    
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
        inputTotal = numSwfit.Dot(data1:inputs,data2:weights) + bias
        output =  sigmoid(value:inputTotal)
        
        return output
    }
    
    
    static func TestNeuron() ->Neuron {
        let weights = [0.0, 1.0] // w1 = 0, w2 = 1
        let bias = 4.0                   // b = 4
        let neuron = Neuron(weights:weights, bias:bias)

        return neuron
    }
    
}

class NeuronData: Codable {
    var weights:Vector
    var bias:Double
    
    enum CodingKeys: String, CodingKey {
        case weights,bias
    }
    
    init( neuron:Neuron) {
        self.weights = neuron.weights
        self.bias = neuron.bias
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weights = try values.decode(Vector.self, forKey: .weights)
        bias = try values.decode(Double.self, forKey: .bias)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weights, forKey: .weights)
        try container.encode(bias, forKey: .bias)
    }
}

class ImageNetworkData: Codable {
    var neuronData:[NeuronData]
    var outputWeight:[Double]
    var outputBias:Double
    
    enum CodingKeys: String, CodingKey {
        case neuronData,outputWeight,outputBias
    }
    
    init(neuronLayer:[Neuron],weight:[Double], bias:Double) {
        neuronData = [NeuronData]()
        for i in 0..<neuronLayer.count {
            neuronData.append(NeuronData(neuron:neuronLayer[i]))
        }
        outputWeight = weight
        outputBias = bias
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        neuronData = try values.decode([NeuronData].self, forKey: .neuronData)
        outputWeight = try values.decode([Double].self, forKey: .outputWeight)
        outputBias = try values.decode(Double.self, forKey: .outputBias)
        
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(neuronData, forKey: .neuronData)
        try container.encode(outputWeight, forKey: .outputWeight)
        try container.encode(outputBias, forKey: .outputBias)
    }
}

class ImageNetwork {
  /*
  A neural network with:
    - 25 inputs
    - a hidden layer with 2 neurons (h1, h2)
    - an output layer with 1 neuron (o1)
  Each neuron has the same weights and bias:
    - w = [0, 1]
    - b = 0
  */
    var hidenLayer = [Neuron]()
    var output = Neuron(weights:[0.0],bias:0.0)
    
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
    
    let inputNumber = 25
    
    init(neuronNumber:Int) {
       
        for _ in 0..<neuronNumber {
            var weights = [Double]()
            for _ in 0..<inputNumber {
                weights.append(Double.random(in: 0.0...1.0))
            }
            let neuron = Neuron(weights:weights,bias:Double.random(in: 0.0...1.0))
            hidenLayer.append(neuron)
        }
        
        
        var weights = [Double]()
        for _ in 0..<neuronNumber {
            weights.append(Double.random(in: 0.0...1.0))
        }
        output = Neuron(weights:weights,bias:Double.random(in: 0.0...1.0))
    }
    
    func ShowLayer() {
        print("HiddenLayer")
        for i in 0..<hidenLayer.count {
            print("Neuron: Weights"+String(i))
            for j in 0..<hidenLayer[i].weights.count {
                print(hidenLayer[i].weights[j])
            }
            print("Bias:"+String(hidenLayer[i].bias))
        }
    }
    
    func feedforward(values:Vector) -> Double {
        var outputs = [Double]()
    
        for j in 0..<hidenLayer.count {
            outputs.append(hidenLayer[j].feedforward(inputs: values))
        }
        
        return output.feedforward(inputs:outputs)
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
                //let x = data[i]
                let y_true = all_y_trues[i]
                /*
                // --- Do a feedforward (we'll need these values later)
                let sum_h1 = w1 * x[0] + w2 * x[1] + b1
                var ho1 = sigmoid(value:sum_h1)

                let sum_h2 = w3 * x[0] + w4 * x[1] + b2
                var ho2 = sigmoid(value:sum_h2)

                let sum_o1 = w5 * ho1 + w6 * ho2 + b3
                var oo1 = sigmoid(value:sum_o1)*/
                let y_pred = feedforward(values: data[i])

                // --- Calculate partial derivatives.
                // --- Naming: d_L_d_w1 represents "partial L / partial w1"
                let d_L_d_ypred = -2 * (y_true - y_pred)

                // Neuron o1
                //var deltaW = [Double]()
                
                for i in 0..<output.weights.count {
                    let neuron = hidenLayer[i]
                    let deltaW = neuron.output*deriv_sigmoid(value:output.inputTotal)
                    output.weights[i] -= learn_rate * d_L_d_ypred * deltaW
                }
                let deltaB = deriv_sigmoid(value:output.inputTotal)
                output.bias -= learn_rate * d_L_d_ypred * deltaB
                
                for k in 0..<hidenLayer.count {
                    for l in 0..<hidenLayer[k].weights.count{
                        hidenLayer[k].weights[l] -=
                            learn_rate * d_L_d_ypred *
                            output.weights[k]*deriv_sigmoid(value:output.inputTotal) *
                        data[i][l]*deriv_sigmoid(value:hidenLayer[k].inputTotal);
                    }
                    hidenLayer[k].bias -=
                        learn_rate * d_L_d_ypred *
                    output.weights[k]*deriv_sigmoid(value:output.inputTotal) *
                    deriv_sigmoid(value:hidenLayer[k].inputTotal)
                }
                /*
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
                 */
            }
            // --- Calculate total loss at the end of each 10 epoch
            if( epoch % 10 == 0) {
                var y_preds=[Double]()
                for i in 0..<data.count {
                    y_preds.append( feedforward(values:data[i]) )
                }
                
                let loss = mse_loss(targets:all_y_trues, values:y_preds)
                print("Epoch "+String(epoch)+" loss: "+String(loss))
            }
        }
        var y_preds=[Double]()
        for i in 0..<data.count {
            y_preds.append( feedforward(values:data[i]) )
        }
        let loss = mse_loss(targets:all_y_trues, values:y_preds)
        print("Epoch "+String(epochs)+" loss: "+String(loss))
        // Save train result
        
    }
    
    func SaveTrainResult() {
        ShowLayer()
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + dataFile
        // Check if file exist
        if !FileManager.default.fileExists(atPath: path) {
            FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        }
        let networkData = ImageNetworkData(neuronLayer:hidenLayer,weight:output.weights,bias:output.bias)
        
        let fileHandle = FileHandle(forWritingAtPath: path)!
        
        let jsonData = try! JSONEncoder().encode(networkData)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        fileHandle.write(jsonString.data(using: .utf8)!)
        try? fileHandle.close()
    }
    
    func LoadTrainResult() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + dataFile
        
        print(path)
        // Check if file exist
        if !FileManager.default.fileExists(atPath: path) {
            FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        }
        
        let jsonString = try! String(contentsOfFile:path, encoding: String.Encoding.utf8)
        let jsonData = jsonString.data(using: .utf8)!
        let networkData = try! JSONDecoder().decode(ImageNetworkData.self, from: jsonData)
        
        for i in 0..<hidenLayer.count {
            hidenLayer[i].weights = networkData.neuronData[i].weights
            hidenLayer[i].bias = networkData.neuronData[i].bias
        }
        output.weights = networkData.outputWeight
        output.bias = networkData.outputBias
        
        ShowLayer()
    }
    
    let dataFile = "Trained.json"
    
    let bits = [1,2,4,8,16,32]
    
    func DoTrain(epochs:Int) {
        var fileData:AllData
        
        if let filePath = Bundle.main.path(forResource: "DocumentsAllData", ofType: "json") {
        do {
            var data = [[Double]]()
            var all_y_trues = [Double]()
            let jsonString = try String(contentsOfFile: filePath)
            let jsonData = jsonString.data(using: .utf8)!
            fileData = try! JSONDecoder().decode(AllData.self, from: jsonData)
            
            for i in 0..<fileData.data[0].data.count {
                for j in 0..<fileData.data[0].data[i].data.count {
                    var tempData=[Double]()
                    for k in 0..<fileData.data[0].data[i].data[j].data.count {
                        for l in 0...4 {
                            if fileData.data[0].data[i].data[j].data[k]&bits[l] == 0 {
                                tempData.append(-1.0)
                            }
                            else {
                                tempData.append(1.0)
                            }
                        }
                    }
                    data.append(tempData)
                    all_y_trues.append(Double(i)/Double(fileData.data[0].data.count-1))
                }
            }
            
            print("Before train....")
            DoTest()
            
            train( data:data, all_y_trues:all_y_trues, epochs:epochs)
            
            print("After train....")
            DoTest()
      
        } catch {
            print("Error reading file:", error.localizedDescription)
        }
    } else {
        print("File not found.")
    }



  }
    func DoTest(){
                let emily0 = [-1.0, -1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0,
                               1.0,  1.0,  1.0,  1.0,  1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0
                             ]
                let emily1 = [-1.0, -1.0, -1.0, -1.0, -1.0,
                             -1.0, -1.0, -1.0, -1.0, -1.0,
                              1.0,  1.0, -1.0, -1.0, -1.0,
                             -1.0, -1.0,  1.0, -1.0, -1.0,
                             -1.0, -1.0, -1.0,  1.0,  1.0
                             ]
                let emily2 = [-1.0, -1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0,
                               1.0,  1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0,  1.0,  1.0,  1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0
                             ]
                
                let emily3 = [-1.0, -1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0,
                               1.0,  1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0,  1.0,  1.0,  1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0
                             ]
                let emily4 = [-1.0, -1.0, -1.0, -1.0, -1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0,
                               1.0, -1.0, -1.0, -1.0, -1.0,
                              -1.0,  1.0,  1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0, -1.0, -1.0
                             ]
                
                let frank0 = [-1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0]
        
                let frank1 = [-1.0, -1.0,  1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0, -1.0,  1.0, -1.0,
                              -1.0, -1.0,  1.0,  1.0, -1.0]
                
                let frank2 = [-1.0, -1.0, 1.0,  1.0, -1.0,
                             -1.0, -1.0, -1.0,  1.0, -1.0,
                             -1.0, -1.0, -1.0,  1.0, -1.0,
                             -1.0, -1.0, -1.0,  1.0, -1.0,
                             -1.0, -1.0, -1.0, -1.0,  1.0]
                
                let frank3 = [-1.0, -1.0, 1.0, -1.0, -1.0,
                             -1.0, -1.0, -1.0, 1.0, -1.0,
                             -1.0, -1.0, -1.0, 1.0, -1.0,
                             -1.0, -1.0, -1.0, 1.0, -1.0,
                             -1.0, -1.0, 1.0, -1.0, -1.0]
                
                let Tony  = [-1.0,  1.0, -1.0,  1.0, -1.0,
                             -1.0, -1.0,  1.0, -1.0, -1.0,
                             -1.0,  1.0, -1.0,  1.0, -1.0,
                             -1.0, -1.0, -1.0, -1.0,  1.0,
                             -1.0, -1.0, -1.0, -1.0, -1.0]
                
                let Winnie = [-1.0,-1.0, -1.0, -1.0,  1.0,
                             -1.0, -1.0, -1.0,  1.0,  1.0,
                              1.0, -1.0,  1.0, -1.0, -1.0,
                             -1.0,  1.0,  1.0, -1.0, -1.0,
                              1.0, -1.0,  1.0, -1.0, -1.0]
        print("Emily0: " + String(feedforward(values:emily0)) ) // 0.951 - F
        print("Emily1: " + String(feedforward(values:emily1)) ) // 0.951 - F
        print("Emily2: " + String(feedforward(values:emily2)) ) // 0.951 - F
        print("Emily3: " + String(feedforward(values:emily3)) ) // 0.951 - F
        print("Emily4: " + String(feedforward(values:emily4)) ) // 0.951 - F
        print("Frank0: " + String(feedforward(values:frank0)) ) // 0.039 - M
        print("Frank1: " + String(feedforward(values:frank1)) ) // 0.039 - M
        print("Frank2: " + String(feedforward(values:frank2)) ) // 0.039 - M
        print("Frank3: " + String(feedforward(values:frank3)) ) // 0.039 - M
        print("Tony  : " + String(feedforward(values:Tony)) ) // 0.039 - M
        print("Winnie: " + String(feedforward(values:Winnie)) ) // 0.039 - M
    }
    
}
