//
//  NeuronsNetworkTextView.swift
//  AI Neurons Network
//
//  Created by Wentao Ma on 2024/2/16.
//

import SwiftUI

struct NeuralNetworkTextView: View {
    var textOpacity: Double
    
    var stepIndex: Int
    
    
    @State var textHide = true
    @State private var tapTextOpacity = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                if(stepIndex == 0){
                    // Top part - Fills the remaining space
                    Text("Artificial Neuron")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity)
                    Text("At the core of a neural network are artificial neurons or nodes. Same as neurons of humans. Each neuron receives input signals, processes them, and produces an output signal.")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity )
                }
                else if(stepIndex==1){
                    // Top part - Fills the remaining space
                    Text("Connection")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity )
                    Text("Neurons are connected to previous neurons by connections, also known as edges or weights. Each connection has an associated weight that modulates the signal passed from one neuron to another. These weights are adjusted during learning to optimize the network's performance.")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity )
                }
                else if(stepIndex==2){
                    // Top part - Fills the remaining space
                    Text("Activation Function")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity)
                    Text("We add a bias value to the weighted sum of its inputs inside the neuron and then apply an activation function to the result. This function introduces non-linearity into the network, allowing it to learn complex patterns and relationships in the data. Then, the neuron generates the output value as input to the next neuron.")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity)
                }else if(stepIndex==3){
                    // Top part - Fills the remaining space
                    Text("Layers")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity)
                    Text("A large number of neurons are connected together to form a neural network. A typical neural network contains three main layers: the input, hidden, and output.")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity)
                }else if(stepIndex==4){
                    // Top part - Fills the remaining space
                    Text("Input Layer")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity)
                    Text("The input layer is the first layer in a neural network and is responsible for receiving input data. In this layer, each node represents a feature from the dataset.")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity)
                }else if(stepIndex==5){
                    // Top part - Fills the remaining space
                    Text("Hidden Layers")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity)
                    Text("Hidden layers are between the input and output layers. Neurons in the hidden layers are connected to all nodes in the previous layer. A giant model can contain nearly a hundred hidden layers with thousands of neurons per layer. Hidden layers adjust the weights of the connections between  nodes to learn combinations and abstract representations of the data.")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity)
                }
                else if(stepIndex==6){
                    // Top part - Fills the remaining space
                    Text("Output Layer")
                        .font(.system(size: min(geometry.size.width / 14, 32)))
                        .fontWeight(.bold)
                        .padding(.bottom, geometry.size.height/16)
                        .opacity(textOpacity)
                    Text("The output layer is the final layer in a neural network and is responsible for producing the output results. The number and type of nodes in the output layer depend on the requirements of the specific task (e.g., classification, regression).")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(textOpacity)
                }
                Spacer()
                if(textOpacity>0.95){
                    Text("Tap to continue...")
                        .font(.system(size: min(geometry.size.width / 16, 28)))
                        .opacity(tapTextOpacity)
                        .onAppear {
                            tapTextOpacity = 0.0
                            // 在文本出现时开始动画
                            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                                // 无限循环切换颜色
                                tapTextOpacity = 1.0
                            }
                        }
                }
                
            }
            .padding(.horizontal,geometry.size.width/16)
            .padding(.top, geometry.size.height/10)
            .foregroundColor(contentTextColor)
        }
        .background(contentBGColor)
    }
}

