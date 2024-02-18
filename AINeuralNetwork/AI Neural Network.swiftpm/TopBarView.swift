//
//  TopBarView.swift
//  AI Neurons Network
//
//  Created by Wentao Ma on 2024/2/16.
//

import SwiftUI

struct TopBarView: View {
    @Binding var pageIndex:Int
    @Binding var stepIndex:Int
    
    var width:Double
    var height:Double
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:width,height:height)
                .background(contentBGColor)
            HStack {
                /*
                // Left button
                Button(action: {
                    // Action for the left button
                    print("Left button tapped")
                    if(stepIndex==0){
                        pageIndex -= 1
                    }
                    else {
                        stepIndex -= 1
                    }
                }) {
                    Text("Pre") // Example icon, customize as needed
                        .font(.system(size: min(height/5, 20)))
                }
                .padding()*/

                Spacer()

                // Title in the middle
                if(pageIndex==1){
                    Text("Neural Network")
                        .font(.system(size: min(height/3, 24)))
                }
                else if(pageIndex==2){
                    Text("Train Model")
                        .font(.system(size: min(height/3, 24)))
                }
                

                Spacer()
/*
                // Right button
                Button(action: {
                    // Action for the right button
                    print("Right button tapped")
                    switch(pageIndex){
                    case 1:
                        if(stepIndex==7){
                            pageIndex += 1
                        }
                        else {
                            stepIndex += 1
                        }
                    case 2:
                        stepIndex += 1
                    default:
                        stepIndex += 1
                    }
                }) {
                    Text("Next")// Example icon, customize as needed
                        .font(.system(size: min(height/5, 20)))
                }
                .padding()*/
            }
            .foregroundColor(contentTextColor)
        }
        .edgesIgnoringSafeArea([.top, .leading, .trailing])
        // Customize background color as needed
    }
}


