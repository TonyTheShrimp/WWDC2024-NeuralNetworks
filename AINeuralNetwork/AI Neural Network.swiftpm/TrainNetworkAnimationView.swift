//
//  TrainNetworkAnimationView.swift
//  AI Neurons Network
//
//  Created by Xiaoyu Ma on 2024/2/16.
//

import SwiftUI

struct TrainNetworkAnimationView: View {
    var stepIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            // Bottom part - Square with height equal to the screen's width
            ZStack {
                // Rectangle background
                Rectangle()
                    .fill(Color.blue.opacity(0.3)) // Light blue rectangle
                    .frame(width: geometry.size.width, height: geometry.size.width) // Example size, adjust as needed
                
                // Images
                Image(systemName: "photo") // Placeholder image, replace with your own
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .position(x: 100, y: 100) // Position the first image
                
                Image(systemName: "photo.fill") // Another placeholder image, replace with your own
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .position(x: 200, y: 200) // Position the second image
                
                // Drawing lines
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 50))
                    path.addLine(to: CGPoint(x: 250, y: 250))
                    path.move(to: CGPoint(x: 250, y: 50))
                    path.addLine(to: CGPoint(x: 50, y: 250))
                }
                .stroke(Color.red, lineWidth: 2) // Line color and thickness
                
                // Text elements
                Text("Top Text")
                    .position(x: 350, y: 20) // Adjust position as needed
                
                Text("Middle Text")
                    .position(x: 350, y: 350) // Adjust position as needed
                
                Text("Bottom Text")
                    .position(x: 350, y: 280) // Adjust position as needed
            }// Ensure ZStack fits the rectangle size
            .foregroundColor(.blue) // Just for demonstration, you can customize it
        }
    }
}


