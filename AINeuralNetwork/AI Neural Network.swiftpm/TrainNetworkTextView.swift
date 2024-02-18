//
//  TrainNetworkTextView.swift
//  AI Neurons Network
//
//  Created by Xiaoyu Ma on 2024/2/16.
//

import SwiftUI

struct TrainNetworkTextView: View {
    var stepIndex: Int
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                if(stepIndex == 0){
                    // Top part - Fills the remaining space
                    Text("Train the model")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("he Neural network, sometimes called model, must be trained before use. Training is a crucial process that enables neural networks to learn from data, adapt to complex patterns, generalize to new situations, and perform various tasks accurately and efficiently. I will use a simple neural network to show how to train a model.")
                }
                else if(stepIndex==1){
                    // Top part - Fills the remaining space
                    Text("Demo ")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("This model uses human weight and height to forecast sex. There are two input nodes in the input layer: weight and height. There is only one hidden layer with two neurons and one neuron in the output layer. We use a Supervised Machine Learning Model, which means manipulating the labeled dataset to train the model—each training example pairs with an output label of known results. There are four data pairs with human's weight and height and result with 0 mean male and 1 for female.")
                }
                else if(stepIndex==2){
                    // Top part - Fills the remaining space
                    Text("Activation Function")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Press the button and use a random number to initialize the model. Then, use the first data to forward the model.")
                }else if(stepIndex==3){
                    // Top part - Fills the remaining space
                    Text("Gaps")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Since we know the correct result, we see the gap between the current output and the correct result. We will use all data to feedforward the model to get all gaps.")
                }else if(stepIndex==4){
                    // Top part - Fills the remaining space
                    Text("Loss Measure Function")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Then, we use a loss-measure function to calculate the prediction of the current model. We can know how to adjust the parameters to reduce each gap from the activation function. We call the process \"Backpropagation\". We can do it on all gaps one by one.")
                }else if(stepIndex==5){
                    // Top part - Fills the remaining space
                    Text("Keep training")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Now, we have finished one epoch of training. The training process reduced the prediction slightly. Keep training the model. ")
                }else if(stepIndex==6){
                    // Top part - Fills the remaining space
                    Text("Test result")
                        .font(.system(size: min(geometry.size.width / 20, 32)))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Now, we can test our model. You can input some weight and height data to see the result.")
                    Text("(Since this is a straightforward model, we just used four pairs of data to train it. So it can work well with average data. A model used in the real world can typically be trained by a large amount of data and thousands or even millions of epochs.)")
                }
                Spacer()
                if(stepIndex<2){
                    Text("Tap to continue...")
                }
                
            }
            
        }// 位置移动动画
           
    }
}

