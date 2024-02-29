//
//  FrontView.swift
//  AI Neural Network
//
//  Created by Wentao Ma on 2024/2/24.
//

import SwiftUI

struct FrontView: View {
    @Binding var pageIndex : Int
    
    @State private var isAnimating = false
    @State private var textOpacity = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack { //  screen
                 Text("AI Neural Network")
                    .frame(width: geometry.size.width*0.8, height: geometry.size.height/10)
                    .font(.system(size: min(geometry.size.width / 10, 72)))
                    .foregroundColor(mainTextColor)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    //.offset(x:  0, y: geometry.size.height * -0.38)
                    .onAppear(){
                        print("AI NN")
                    }
                .frame(width: geometry.size.width, height: geometry.size.height*0.75)
                .position(x: geometry.size.width/2, y: geometry.size.height*0.34)
                .background(mainBGColor)
                
                Image( "NeuralNetwork") // Placeholder image, replace with your own
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.2)
                    .position(x: geometry.size.width/2, y: geometry.size.height*0.54)
                    .opacity(isAnimating ? 1.0 : 0.0)
                
                Rectangle()
                        .fill(.red)
                        .frame(width: geometry.size.width, height: geometry.size.height*0.01)
                        .position(x: geometry.size.width/2, y:isAnimating ? geometry.size.height*0.755 : geometry.size.height*(0.755+0.255) )

                    
                Rectangle()
                    .fill(contentBGColor)
                    .frame(width: geometry.size.width, height: geometry.size.height*0.28)
                    .position(x: geometry.size.width/2, y: isAnimating ? geometry.size.height*0.9 :  geometry.size.height * (0.9+0.255) )
                
                Text("A neural network is a type of artificial intelligence (AI) model that is inspired by the structure and function of biological neural networks, such as the human brain. It's a fundamental component of many modern machine learning and deep learning algorithms.")
                    .frame(width: geometry.size.width*0.8, height: geometry.size.height*0.2)
                    .position(x: geometry.size.width/2, y: isAnimating ? geometry.size.height*0.85 : geometry.size.height*(0.85+0.255) )
                    .font(.system(size: min(geometry.size.width / 14, 24)))
                    .foregroundColor(contentTextColor)
                    //.opacity(isAnimating ? 0.0 : 1.0)
                Text("Tap to continue...")
                    .frame(width: geometry.size.width*0.8, height: geometry.size.height*0.08)
                    .opacity(textOpacity)
                    .position(x: geometry.size.width/2, y:isAnimating ? geometry.size.height*0.98 : geometry.size.height*(0.98 + 0.255) )
                    .font(.system(size: min(geometry.size.width / 14, 24)))
                    .foregroundColor(contentTextColor)
                    .onAppear {
                        // This is a loop of animation
                        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                           textOpacity = 0.2
                        }
                    }
                    .italic()
            }   // Whole screen
            .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
            .background(mainBGColor)
            .onTapGesture {
                // Action to perform on tap
                withAnimation(.easeInOut(duration: 0.4)) {
                    isAnimating.toggle()
                }
                
                playSound(filename:"Button2")
                // 动画结束后的操作
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    // 动画完成后要执行的代码
                    print("动画完成!")
                    pageIndex = 1
                    //isFromFrontPage = true
                }
            }   //  GeometryReader of screen
        }
        .onAppear(){
            withAnimation(.easeInOut(duration: 1.4)) {
                isAnimating.toggle()
            }
        }
        .statusBar(hidden: true) // This hides the status bar
    }
}
/*
#Preview {
    var pageIndex = 0
    FrontView(pageIndex:pageIndex)
    //Text("Hello")
}*/
