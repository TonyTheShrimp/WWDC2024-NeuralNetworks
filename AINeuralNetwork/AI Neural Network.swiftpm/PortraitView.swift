//
//  PortraitView.swift
//  AI Neurons Network
//
//  Created by Wentao Ma on 2024/2/16.
//

import SwiftUI

struct PortraitView: View {
    @Binding var pageIndex:Int
    @Binding var stepIndex:Int
    @Binding var isFromFrontPage:Bool
    
    @State private var isAnimating = false
    
    @State private var nextPageIndex = 0
    @State private var nextStepIndex = 0
    
    @State private var subViewTextOpacity = 1.0
    @State private var tapTextOpacity = 0.0
    
    @State private var aniViewDoAnimation = true
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                
                // Custom top bar
                AnyView(TopBarView(pageIndex:$pageIndex,stepIndex:$stepIndex, width:geometry.size.width, height:geometry.size.height*0.06))
                    .offset(x:0, y: isFromFrontPage ? -0.08*geometry.size.height : 0)
                
                VStack(spacing: 0) {
                    if(pageIndex == 1){
                        AnyView(NeuralNetworkAnimationView(stepIndex:stepIndex, doAnimation: aniViewDoAnimation))
                            .frame(width: geometry.size.width, height: geometry.size.width*5/6)
                            //.opacity(isFromFrontPage ? 0.0 : 1.0)
                        AnyView(NeuralNetworkTextView(textOpacity:subViewTextOpacity, stepIndex:stepIndex)
                            .frame(width: geometry.size.width, height:geometry.size.height*0.94 - geometry.size.width*5/6)
                            .offset(x: 0, y: isFromFrontPage ? geometry.size.height*0.4 : 0))
                        
                    }
                    else if(pageIndex == 2){
                        AnyView(TrainNetworkAnimationView(stepIndex:stepIndex))
                            .frame(width: geometry.size.width, height: geometry.size.width*5/6)
                        
                        AnyView(TrainNetworkTextView(stepIndex:stepIndex))
                    }
                }
                .position(x:geometry.size.width/2,y:geometry.size.height*0.53)
                .edgesIgnoringSafeArea(.bottom) // Makes the layout extend to the bottom edge of the screen
                .onTapGesture {
                    
                    if(pageIndex==1){
                        if(stepIndex<6){
                            nextPageIndex = pageIndex
                            nextStepIndex = stepIndex + 1
                        }
                        else {
                            nextStepIndex = 1
                            nextPageIndex = 2
                        }
                    }
                    else if(pageIndex==2){
                        if(stepIndex<2){
                            nextPageIndex = pageIndex
                            nextStepIndex = stepIndex + 1
                        }
                    }
                    
                    print("Before Ani:"+String(nextPageIndex)+"---"+String(nextStepIndex))
                    
                    withAnimation(Animation.linear(duration: 0.3)) {
                        subViewTextOpacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        // 动画完成后要执行的代码
                        print("动画完成!")
                        print("After Ani:"+String(nextPageIndex)+"---"+String(nextStepIndex))
                        stepIndex = nextStepIndex
                        pageIndex = nextPageIndex
                        
                        tapTextOpacity = 0.0
                        
                        withAnimation(Animation.linear(duration: 0.3)) {
                            subViewTextOpacity = 1.0
                        }
                        aniViewDoAnimation = true
                        withAnimation(.easeInOut(duration: 0.6)) {
                            aniViewDoAnimation.toggle()
                        }
                    }
                }
            } // GeometryReader of view
            .onAppear(){
                if(isFromFrontPage){
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isFromFrontPage.toggle()
                    }
                }
                withAnimation(.easeInOut(duration: 0.6)) {
                    aniViewDoAnimation.toggle()
                }
                
            }
        } // VStack of view
    } // View body
    
}


