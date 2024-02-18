//
//  LandscapView.swift
//  AI Neurons Network
//
//  Created by Wentao Ma on 2024/2/16.
//

import SwiftUI

struct LandscapView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("AI Neural Network")
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .font(.system(size: min(geometry.size.width / 10, 60)))
                    .foregroundColor(mainTextColor)
            }.background(mainBGColor)
        }
    }
}

#Preview {
    LandscapView()
}
