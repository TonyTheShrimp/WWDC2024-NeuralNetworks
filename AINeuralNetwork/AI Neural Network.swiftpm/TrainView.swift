//
//  TrainView.swift
//  AI Neural Network
//
//  Created by Wentao Ma on 2024/2/23.
//

import SwiftUI
import Combine

class AnimationViewModel: ObservableObject {
    @Published var changeText = false
    
    func updateValue(shouldChangeText: Bool) {
        DispatchQueue.main.async {
            self.changeText = shouldChangeText
        }
    }
}

struct TrainView: View {
    @State var stepIndex = 0
    @State var disableAllButtons = true
    @State var showPage = false
    
    let aniViewHeight = [0.75, 0.75]
    let contentViewPosY = [0.875, 0.875]
    
    @State var isBtnResetPressed = false
    @State var isBtnForwardPressed = false
    @State var isBtnBackPressed = false
    @State var isBtnTrain1Pressed = false
    @State var isBtnTrain10Pressed = false
    @State var isBtnTrain100Pressed = false
    @State var isBtnTestPressed = false
    
    @State var trainDataIndex = 0
    
    @State var w1Text = "--"
    @State var w1Scale = 1.0
    @State var w1Color = contentTextColor
    
    @State var w2Text = "--"
    @State var w2Scale = 1.0
    @State var w2Color = contentTextColor
    
    @State var w3Text = "--"
    @State var w3Scale = 1.0
    @State var w3Color = contentTextColor
    
    @State var w4Text = "--"
    @State var w4Scale = 1.0
    @State var w4Color = contentTextColor
    
    @State var w5Text = "--"
    @State var w5Scale = 1.0
    @State var w5Color = contentTextColor
    
    @State var w6Text = "--"
    @State var w6Scale = 1.0
    @State var w6Color = contentTextColor
    
    @State var wv1Text = "--"
    @State var wv1Scale = 1.0
    @State var wv1Color = mainTextColor
    
    @State var wv2Text = "--"
    @State var wv2Scale = 1.0
    @State var wv2Color = mainTextColor
    
    @State var wv3Text = "--"
    @State var wv3Scale = 1.0
    @State var wv3Color = mainTextColor
    
    @State var wv4Text = "--"
    @State var wv4Scale = 1.0
    @State var wv4Color = mainTextColor
    
    @State var wv5Text = "--"
    @State var wv5Scale = 1.0
    @State var wv5Color = mainTextColor
    
    @State var wv6Text = "--"
    @State var wv6Scale = 1.0
    @State var wv6Color = mainTextColor
    
    @State var b1Text = "--"
    @State var b1Scale = 1.0
    @State var b1Color = contentTextColor
    
    @State var b2Text = "--"
    @State var b2Scale = 1.0
    @State var b2Color = contentTextColor
    
    @State var b3Text = "--"
    @State var b3Scale = 1.0
    @State var b3Color = contentTextColor
    
    @State var s1Text = "--"
    @State var s1Scale = 1.0
    @State var s1Color = mainTextColor
    
    @State var s2Text = "--"
    @State var s2Scale = 1.0
    @State var s2Color = mainTextColor
    
    @State var s3Text = "--"
    @State var s3Scale = 1.0
    @State var s3Color = mainTextColor
    
    @State var f1Text = "--"
    @State var f1Scale = 1.0
    @State var f1Color = mainTextColor
    
    @State var f2Text = "--"
    @State var f2Scale = 1.0
    @State var f2Color = mainTextColor
    
    @State var f3Text = "--"
    @State var f3Scale = 1.0
    @State var f3Color = mainTextColor
    
    @State var n1n2SumLineColor = mainTextColor
    @State var n1n2FuncLineColor = mainTextColor
    @State var n1n2OutputLineColor = mainTextColor
    @State var n3SumLineColor = mainTextColor
    @State var n3FuncLineColor = mainTextColor
    @State var n3OutputLineColor1 = mainTextColor
    @State var n3OutputLineColor2 = mainTextColor
    @State var n3OutputLineColor3 = mainTextColor
    
    @State var n1n2SumLineWidth = 2.0
    @State var n1n2FuncLineWidth = 2.0
    @State var n1n2OutputLineWidth = 2.0
    @State var n3SumLineWidth = 2.0
    @State var n3FuncLineWidth = 2.0
    @State var n3OutputLineWidth1 = 2.0
    @State var n3OutputLineWidth2 = 2.0
    @State var n3OutputLineWidth3 = 2.0
    
    
    @State var n1wBGColor = neuronBGColorDark
    @State var n1bBGColor = biasBGColorDark
    @State var n1wvBGColor = mainBGColor
    @State var n1sBGColor = mainBGColor
    @State var n1fBGColor = mainBGColor
    
    @State var n2wBGColor = neuronBGColorDark
    @State var n2bBGColor = biasBGColorDark
    @State var n2wvBGColor = mainBGColor
    @State var n2sBGColor = mainBGColor
    @State var n2fBGColor = mainBGColor
    
    @State var n3wBGColor = neuronBGColorDark
    @State var n3bBGColor = biasBGColorDark
    @State var n3wvBGColor = mainBGColor
    @State var n3sBGColor = mainBGColor
    @State var n3fBGColor = mainBGColor
    
    @State var weightText = "--"
    @State var weightScale = 1.0
    @State var weightColor = mainTextColor
    
    @State var heightText = "--"
    @State var heightScale = 1.0
    @State var heightColor = mainTextColor
    
    @State var averageTextScale = 1.0
    
    @State var dataRowTextColor = [mainTextColor,mainTextColor,mainTextColor,mainTextColor]
    @State var dataRowScale = [1.0,1.0,1.0,1.0]
    
    @State var dataRowBGColor = [dataBGColorDark,dataBGColorDark,dataBGColorDark,dataBGColorDark]
    
    @State var dataAverageColor = mainBGColor
    
    @State var averageToWeightColor = mainTextColor
    @State var weightOutLineColor = mainTextColor
    
    @State var averageToWeightWidth = 2.0
    @State var weightOutLineWidth = 2.0
    
    
    @State var weightBGColor = mainBGColor
    @State var heightBGColor = mainBGColor
    
    @State var dataDeltaText = ["--","--","--","--"]
    @State var dataResultText = ["--","--","--","--"]
    
    @State var dataDeltaBGColor =  [mainBGColor,mainBGColor,mainBGColor,mainBGColor]
    @State var dataDeltaTextScale =  [1.0,1.0,1.0,1.0]
    @State var dataResultBGColor =  [mainBGColor,mainBGColor,mainBGColor,mainBGColor]
    @State var dataResultTextScale =  [1.0,1.0,1.0,1.0]
    @State var dataResult = [0,0,0,0]
    
    @State var dataToAverageLineColor =  [mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor,mainTextColor]
    @State var dataToAverageLineWidth =  [2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0]
    
    @State var mseLossText = "--"
    @State var mseLossBGColor = mainBGColor
    @State var mseLossLineColor = mainTextColor
    @State var mseLossLineWidth = 2.0
    
    @State var backLine01 = mainBGColor
    @State var backLine02 = mainBGColor
    @State var backLine03 = mainBGColor
    
    @State var isResetDisable = false
    @State var isForwardDisable = true
    @State var isBackDisable = true
    @State var isTrain1Disable = true
    @State var isTrain10Disable = true
    
    @State var isForwardOnly = true
    
    @State var isFirstRoundFinished = false
    @State var roundOfTrain = 0
    
    
    @State var height = 0.0
    
    @State var canTest = false
    @State var testWeight = "0"
    @State var testHeight = "0"
    
    @State var testResult = "?"
    @State var testResultScale = 1.0
    
    
    @State var textOpacity = 1.0
    @State private var tapTextOpacity = 0.0
    
    let textAnimationDuration = 0.4
    
    var body: some View {
        ZStack {
            /*
             Button(action: {
             print("屏幕任何地方被点击")
             OnScreenTapped()
             }) {
             // 使用透明色填充整个屏幕，使其可点击
             Color.clear
             .edgesIgnoringSafeArea(.all) // 忽略安全区域，填充整个屏幕
             }*/
            
            GeometryReader { geometryView in
                let viewDir = geometryView.size.width>geometryView.size.height ? 0 : 1
                let fontScale = geometryView.size.width>geometryView.size.height ? 1 : 0.5
                
                // Bottom part - Square with height equal to the screen's width
                VStack {
                    GeometryReader { geometry in
                        let neuronTextFontSize = geometry.size.height*0.019
                        
                        let neuronBoxWidth = geometry.size.width*0.28
                        let neuronBoxHeight = neuronBoxWidth*0.42
                        let neuronCellWidth = geometry.size.width*0.06
                        let neuronCellHeight = neuronCellWidth*0.32
                        
                        let neuronCellDeltaX = neuronCellWidth*4/5
                        let neuronCellDeltaY = neuronCellHeight*1.5
                        
                        let neuronX1 = geometry.size.width*0.59
                        let neuronY1 = geometry.size.height*0.4
                        
                        let neuronX2 = neuronX1
                        let neuronY2 = neuronY1+neuronCellHeight*6.5
                        
                        let neuronX3 = geometry.size.width*0.85
                        let neuronY3 = (neuronY1+neuronY2)/2
                        
                        let inputLayerX = geometry.size.width*0.36
                        let inputLayerY = neuronY1 - neuronBoxHeight*0.75
                        
                        let trainDataX = geometry.size.width*0.15
                        let trainDataY = inputLayerY
                        
                        let trainDataBoxWidth = neuronCellWidth*4.5
                        
                        let trainDataCellHeight = neuronCellHeight
                        
                        // Table of train data
                        
                        
                        let tdHeightX = trainDataX+trainDataBoxWidth*2/5
                        let tdWeightX = trainDataX+trainDataBoxWidth/5
                        let tdSexX = trainDataX
                        let tdOutputX = trainDataX-trainDataBoxWidth*2/5
                        let tdDeltaX = trainDataX-trainDataBoxWidth/5
                        
                        let tdRow0 = trainDataY+trainDataCellHeight*2.5
                        let tdRow1 = trainDataY+trainDataCellHeight*3.5
                        let tdRow2 = trainDataY+trainDataCellHeight*4.5
                        let tdRow3 = trainDataY+trainDataCellHeight*5.5
                        let tdRow4 = trainDataY+trainDataCellHeight*6.5
                        
                        let tdToAverageLineX = tdHeightX+trainDataBoxWidth*0.16
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*1.2, y: neuronY3 + neuronCellDeltaY - neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*1.2, y: neuronY1 -  neuronCellHeight*3.5))
                            path.addLine(to: CGPoint(x: trainDataX-trainDataBoxWidth*0.2, y: neuronY1 -  neuronCellHeight*3.5))
                            path.addLine(to: CGPoint(x: trainDataX-trainDataBoxWidth*0.2, y: tdRow0-trainDataCellHeight*0.5))
                        }
                        .stroke(backLine01, lineWidth: 4)
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*1.8, y: neuronY3 - neuronCellDeltaY + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*1.8, y: neuronY3 - neuronCellDeltaY + neuronCellHeight*0.75))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*1.5, y: neuronY3 - neuronCellDeltaY + neuronCellHeight*0.75))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*1.5, y: neuronY1 - neuronCellDeltaY + neuronCellHeight*0.5))
                        }
                        .stroke(backLine02, lineWidth: 4)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*1.8, y: neuronY3 + neuronCellDeltaY - neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*1.8, y: neuronY3 + neuronCellDeltaY - neuronCellHeight*0.75))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*1.5, y: neuronY3 + neuronCellDeltaY - neuronCellHeight*0.75))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*1.5, y: neuronY2 + neuronCellDeltaY - neuronCellHeight*0.5))
                        }
                        .stroke(backLine03, lineWidth: 4)
                        
                        // Out box of AI Neural Network
                        Path { path in
                            let rect = CGRect(x: tdToAverageLineX*0.975, y: neuronY1 - neuronBoxHeight*1.5, width: neuronBoxWidth*2.41, height: neuronBoxHeight*3.2)
                            path.addRect(rect)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [10, 10]))
                        .foregroundColor(.blue)
                        
                        
                        Text("AI Neural Network")
                            .position(x: neuronX1, y: neuronY1 - neuronBoxHeight*1.2)
                            .font(.system(size: neuronTextFontSize*3*fontScale))
                            .bold()
                            .foregroundColor(.blue)
                        
                        Text("Input Layer")
                            .position(x: inputLayerX, y: inputLayerY)
                            .font(.system(size: neuronTextFontSize*2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("Hidden Layer")
                            .position(x: neuronX1, y: neuronY1 - neuronBoxHeight*0.75)
                            .font(.system(size: neuronTextFontSize*2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("Output Layer")
                            .position(x: neuronX3, y: neuronY1 - neuronBoxHeight*0.75)
                            .font(.system(size: neuronTextFontSize*2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        // -------------------------------- Neuron 1 -------------------------------------------
                        // Out box of neuron
                        Path { path in
                            let rect = CGRect(x: neuronX1-neuronBoxWidth*0.57, y: neuronY1 - neuronBoxHeight*0.58, width: neuronBoxWidth*0.92, height: neuronBoxHeight)
                            path.addRect(rect)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 5]))
                        .foregroundColor(.blue)
                        
                        Text("Neuron 1")
                            .position(x: neuronX1, y: neuronY1 - neuronBoxHeight*0.48)
                            .font(.system(size: neuronTextFontSize*1.5*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        // W1 ----------------------------
                        Image( "MultiIcon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(weightOutLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX1-neuronCellWidth*2-neuronCellHeight, y:  neuronY1-neuronCellDeltaY)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth*2, y: neuronY1 - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*2-neuronCellHeight*0.5, y: neuronY1 - neuronCellDeltaY))
                            
                        }
                        .stroke(weightOutLineColor, lineWidth: weightOutLineWidth)
                        
                        // box of W1
                        Rectangle()
                            .fill(n1wBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX1-neuronCellWidth*1.5, y: neuronY1 - neuronCellDeltaY)
                        
                        Rectangle()
                            .fill(n1wvBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 - neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX1-neuronCellWidth*2, y: neuronY1 - neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth*2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1 - neuronCellDeltaY-neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1 - neuronCellDeltaY+neuronCellHeight/2))
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(w1Text)
                            .scaleEffect(w1Scale)
                            .position(x: neuronX1-neuronCellWidth*1.5, y: neuronY1 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(w1Color)
                            .animation(.easeInOut, value: w1Color)
                        
                        // box of W1 value
                        
                        
                        Text(wv1Text)
                            .scaleEffect(wv1Scale)
                            .position(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(wv1Color)
                            .animation(.easeInOut, value: wv1Color)
                        
                        // W2 ----------------------------
                        Image( "MultiIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(weightOutLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX1-neuronCellWidth*2-neuronCellHeight, y:  neuronY1+neuronCellDeltaY)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth*2, y: neuronY1 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*2-neuronCellHeight*0.5, y: neuronY1 + neuronCellDeltaY))
                        }
                        .stroke(weightOutLineColor, lineWidth: weightOutLineWidth)
                        
                        Rectangle()
                            .fill(n1wBGColor)
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX1-neuronCellWidth*1.5, y: neuronY1 + neuronCellDeltaY )
                        
                        Rectangle()
                            .fill(n1wvBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 + neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX1-neuronCellWidth*2, y: neuronY1 + neuronCellDeltaY - neuronCellHeight/2, width: neuronCellWidth*2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1 + neuronCellDeltaY - neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1 + neuronCellDeltaY + neuronCellHeight/2))
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(w2Text)
                            .scaleEffect(w2Scale)
                            .position(x: neuronX1-neuronCellWidth*1.5, y: neuronY1 + neuronCellDeltaY )
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(w2Color)
                            .animation(.easeInOut, value: w2Color)
                        
                        // bg box of W2 Value
                        
                        
                        Text(wv2Text)
                            .scaleEffect(wv2Scale)
                            .position(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 + neuronCellDeltaY )
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(wv2Color)
                            .animation(.easeInOut, value: wv2Color)
                        
                        // B1 ----------------------------
                        Rectangle() // 创建一个矩形
                            .fill(n1bBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX1-neuronCellWidth*1.5, y: neuronY1 )
                        
                        
                        Path { path in
                            let rect = CGRect(x: neuronX1-neuronCellWidth*2, y: neuronY1-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1 + neuronCellDeltaY-neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1 + neuronCellDeltaY+neuronCellHeight/2))
                            
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        
                        Text(b1Text)
                            .scaleEffect(b1Scale)
                            .position(x: neuronX1-neuronCellWidth*1.5, y: neuronY1)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(b1Color)
                            .animation(.easeInOut, value: b1Color)
                        
                        // Symbol of plus
                        
                        Image( "plusIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2SumLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX1-neuronCellWidth*0.5, y:  neuronY1)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 - neuronCellDeltaY + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 - neuronCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*0.5, y: neuronY1 + neuronCellDeltaY - neuronCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth, y: neuronY1))
                            path.addLine(to: CGPoint(x: neuronX1-neuronCellWidth*0.5-neuronCellHeight*0.5, y: neuronY1))
                            
                            path.move(to: CGPoint(x: neuronX1-neuronCellWidth*0.5+neuronCellHeight*0.5, y: neuronY1))
                            path.addLine(to: CGPoint(x: neuronX1+neuronCellHeight/2, y: neuronY1))
                            path.addLine(to: CGPoint(x: neuronX1+neuronCellHeight/2, y: neuronY1-neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX1+neuronCellHeight, y: neuronY1-neuronCellDeltaY))
                            
                        } // 设置矩形的尺寸
                        .stroke(n1n2SumLineColor, lineWidth: n1n2SumLineWidth)
                        
                        // Box of sum
                        // bg box of W2 Value
                        Rectangle()
                            .fill(n1sBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX1+neuronCellHeight+neuronCellWidth*0.5, y: neuronY1 - neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX1+neuronCellHeight, y: neuronY1 - neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(s1Text)
                            .scaleEffect(s1Scale)
                            .position(x: neuronX1+neuronCellHeight+neuronCellWidth*0.5, y: neuronY1 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(s1Color)
                            .animation(.easeInOut, value: s1Color)
                        
                        Image( "funcIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2FuncLineColor)
                            .frame(width: geometry.size.width/30, height: geometry.size.width/30)
                            .position(x: neuronX1 + neuronCellWidth*0.5, y:  neuronY1)
                        
                        Image( "1+e2") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2FuncLineColor)
                            .frame(width: geometry.size.width/15, height: geometry.size.width/15)
                            .position(x: neuronX1 + neuronCellWidth*1.2, y:  neuronY1)
                        
                        // Box of f(x)
                        Rectangle()
                            .fill(n1fBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX1+neuronCellHeight+neuronCellWidth*0.5, y: neuronY1 + neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX1+neuronCellHeight, y: neuronY1 + neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        
                        Text(f1Text)
                            .scaleEffect(f1Scale)
                            .position(x:neuronX1+neuronCellHeight+neuronCellWidth*0.5, y: neuronY1 + neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(f1Color)
                            .animation(.easeInOut, value: f1Color)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX1+neuronCellDeltaX*0.6, y: neuronY1-geometry.size.width*0.0135))
                            path.addLine(to: CGPoint(x: neuronX1+neuronCellDeltaX*0.6, y: neuronY1 - neuronCellDeltaY + neuronCellHeight/2 ))
                            
                            path.move(to: CGPoint(x: neuronX1+neuronCellDeltaX*0.6, y: neuronY1 + geometry.size.width*0.0135))
                            path.addLine(to: CGPoint(x: neuronX1+neuronCellDeltaX*0.6, y: neuronY1 + neuronCellDeltaY-neuronCellHeight/2))
                        }
                        .stroke(n1n2FuncLineColor, lineWidth: n1n2FuncLineWidth)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX1+neuronCellWidth+neuronCellHeight, y: neuronY1 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*2.5, y: neuronY1 + neuronCellDeltaY))
                        }
                        
                        .stroke(n1n2OutputLineColor, lineWidth: n1n2OutputLineWidth)
                        
                        
                        
                        
                        // -------------------------------- Neuron 2 -------------------------------------------
                        // Out box of neuron
                        Path { path in
                            let rect = CGRect(x: neuronX2-neuronBoxWidth*0.57, y: neuronY2 - neuronBoxHeight*0.58, width: neuronBoxWidth*0.92, height: neuronBoxHeight)
                            path.addRect(rect)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 5]))
                        .foregroundColor(.blue)
                        
                        Text("Neuron 2")
                            .position(x: neuronX2, y: neuronY2 - neuronBoxHeight*0.48)
                            .font(.system(size: neuronTextFontSize*1.5*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        
                        // W3 ----------------------------
                        Image( "MultiIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(weightOutLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX2-neuronCellWidth*2-neuronCellHeight, y:  neuronY2-neuronCellDeltaY)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth*2, y: neuronY2 - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*2-neuronCellHeight*0.5, y: neuronY2 - neuronCellDeltaY))
                        }
                        .stroke(n1n2OutputLineColor, lineWidth: n1n2OutputLineWidth)
                        
                        // box of W3
                        Rectangle()
                            .fill(n2wBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX2-neuronCellWidth*1.5, y: neuronY2 - neuronCellDeltaY)
                        
                        Rectangle()
                            .fill(n2wvBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 - neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX2-neuronCellWidth*2, y: neuronY2 - neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth*2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2 - neuronCellDeltaY-neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2 - neuronCellDeltaY+neuronCellHeight/2))
                            
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(w3Text)
                            .scaleEffect(w3Scale)
                            .position(x: neuronX2-neuronCellWidth*1.5, y: neuronY2 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(w3Color)
                            .animation(.easeInOut, value: w3Color)
                        
                        // Box of W3 value
                        
                        Text(wv3Text)
                            .scaleEffect(wv3Scale)
                            .position(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(wv3Color)
                            .animation(.easeInOut, value: wv3Color)
                        
                        // W4 ----------------------------
                        Image( "MultiIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(weightOutLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX2-neuronCellWidth*2-neuronCellHeight, y:  neuronY2+neuronCellDeltaY)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth*2, y: neuronY2 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*2-neuronCellHeight*0.5, y: neuronY2 + neuronCellDeltaY))
                        }
                        .stroke(weightOutLineColor, lineWidth: weightOutLineWidth)
                        
                        Rectangle() // 创建一个矩形
                            .fill(n2wBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX2-neuronCellWidth*1.5, y: neuronY2 + neuronCellDeltaY )
                        
                        Rectangle()
                            .fill(n2wvBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX2-neuronCellWidth*2, y: neuronY2 + neuronCellDeltaY - neuronCellHeight/2, width: neuronCellWidth*2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2 + neuronCellDeltaY - neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2 + neuronCellDeltaY + neuronCellHeight/2))
                            
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(w4Text)
                            .scaleEffect(w4Scale)
                            .position(x: neuronX2-neuronCellWidth*1.5, y: neuronY2 + neuronCellDeltaY )
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(w4Color)
                            .animation(.easeInOut, value: w4Color)
                        
                        // Box of W4 value
                        
                        
                        Text(wv4Text)
                            .scaleEffect(wv4Scale)
                            .position(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY )
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(wv4Color)
                            .animation(.easeInOut, value: wv4Color)
                        
                        // B2 ----------------------------
                        Rectangle() // 创建一个矩形
                            .fill(n2bBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX2-neuronCellWidth*1.5, y: neuronY2 )
                        
                        
                        Path { path in
                            let rect = CGRect(x: neuronX2-neuronCellWidth*2, y: neuronY2-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2 + neuronCellDeltaY-neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2 + neuronCellDeltaY+neuronCellHeight/2))
                            
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        
                        
                        Text(b2Text)
                            .scaleEffect(b1Scale)
                            .position(x: neuronX2-neuronCellWidth*1.5, y: neuronY2)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(b2Color)
                            .animation(.easeInOut, value: b2Color)
                        
                        // Symbol of plus
                        
                        Image( "plusIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2SumLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX2-neuronCellWidth*0.5, y:  neuronY2)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 - neuronCellDeltaY + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 - neuronCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY - neuronCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth, y: neuronY2))
                            path.addLine(to: CGPoint(x: neuronX2-neuronCellWidth*0.5-neuronCellHeight*0.5, y: neuronY2))
                            
                            path.move(to: CGPoint(x: neuronX2-neuronCellWidth*0.5+neuronCellHeight*0.5, y: neuronY2))
                            path.addLine(to: CGPoint(x: neuronX2+neuronCellHeight/2, y: neuronY2))
                            path.addLine(to: CGPoint(x: neuronX2+neuronCellHeight/2, y: neuronY2-neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX2+neuronCellHeight, y: neuronY2-neuronCellDeltaY))
                            
                        }
                        .stroke(n1n2SumLineColor, lineWidth: n1n2SumLineWidth)
                        
                        // Box of sum
                        // Box of W3 value
                        Rectangle()
                            .fill(n2sBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX2+neuronCellHeight+neuronCellWidth*0.5, y: neuronY2 - neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX2+neuronCellHeight, y: neuronY2 - neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(s2Text)
                            .scaleEffect(s1Scale)
                            .position(x: neuronX2+neuronCellHeight+neuronCellWidth*0.5, y: neuronY2 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(s2Color)
                            .animation(.easeInOut, value: s2Color)
                        
                        Image( "funcIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2FuncLineColor)
                            .frame(width: geometry.size.width/30, height: geometry.size.width/30)
                            .position(x: neuronX2 + neuronCellWidth*0.5, y:  neuronY2)
                        
                        Image( "1+e2") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2FuncLineColor)
                            .frame(width: geometry.size.width/15, height: geometry.size.width/15)
                            .position(x: neuronX2 + neuronCellWidth*1.2, y:  neuronY2)
                        
                        // Box of f(x)
                        Rectangle()
                            .fill(n2fBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX2+neuronCellHeight+neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX2+neuronCellHeight, y: neuronY2 + neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        
                        Text(f2Text)
                            .scaleEffect(f1Scale)
                            .position(x:neuronX2+neuronCellHeight+neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(f2Color)
                            .animation(.easeInOut, value: f2Color)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX2+neuronCellDeltaX*0.6, y: neuronY2-geometry.size.width*0.0135))
                            path.addLine(to: CGPoint(x: neuronX2+neuronCellDeltaX*0.6, y: neuronY2 - neuronCellDeltaY + neuronCellHeight/2 ))
                            
                            path.move(to: CGPoint(x: neuronX2+neuronCellDeltaX*0.6, y: neuronY2 + geometry.size.width*0.0135))
                            path.addLine(to: CGPoint(x: neuronX2+neuronCellDeltaX*0.6, y: neuronY2 + neuronCellDeltaY-neuronCellHeight/2))
                        }
                        .stroke(n1n2FuncLineColor, lineWidth: n1n2FuncLineWidth)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX2+neuronCellWidth+neuronCellHeight, y: neuronY2 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: (neuronX2+neuronCellWidth+neuronCellHeight+neuronX3-2.5*neuronCellWidth)/2, y: neuronY2 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x:  (neuronX2+neuronCellWidth+neuronCellHeight+neuronX3-2.5*neuronCellWidth)/2, y: neuronY2 - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX3-2.5*neuronCellWidth, y: neuronY2 - neuronCellDeltaY))
                            
                        } // 设置矩形的尺寸
                        .stroke(n1n2OutputLineColor, lineWidth: n1n2OutputLineWidth)
                        
                        
                        
                        
                        
                        // -------------------------------- Neuron 3 -------------------------------------------
                        // Out box of neuron
                        Path { path in
                            let rect = CGRect(x: neuronX3-neuronBoxWidth*0.57, y: neuronY3 - neuronBoxHeight*0.58, width: neuronBoxWidth*0.92, height: neuronBoxHeight)
                            path.addRect(rect)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 5]))
                        .foregroundColor(.blue)
                        
                        Text("Neuron 3")
                            .position(x: neuronX3, y: neuronY3 - neuronBoxHeight*0.48)
                            .font(.system(size: neuronTextFontSize*1.5*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        
                        // W5 ----------------------------
                        Image( "MultiIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2OutputLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX3-neuronCellWidth*2-neuronCellHeight, y:  neuronY3-neuronCellDeltaY)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*2, y: neuronY3 - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*2-neuronCellHeight*0.5, y: neuronY3 - neuronCellDeltaY))
                        }
                        .stroke(n1n2OutputLineColor, lineWidth: n1n2OutputLineWidth)
                        
                        // box of W5
                        
                        Rectangle()
                            .fill(n3wBGColor)
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX3-neuronCellWidth*1.5, y: neuronY3 - neuronCellDeltaY)
                        
                        Rectangle()
                            .fill(n3wvBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 - neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX3-neuronCellWidth*2, y: neuronY3 - neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth*2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3 - neuronCellDeltaY-neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3 - neuronCellDeltaY+neuronCellHeight/2))
                            
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(w5Text)
                            .scaleEffect(w5Scale)
                            .position(x: neuronX3-neuronCellWidth*1.5, y: neuronY3 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(w5Color)
                            .animation(.easeInOut, value: w5Color)
                        
                        // Box of W5 Value
                        
                        
                        Text(wv5Text)
                            .scaleEffect(wv5Scale)
                            .position(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(wv5Color)
                            .animation(.easeInOut, value: wv5Color)
                        
                        // W6 ----------------------------
                        Image( "MultiIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n1n2OutputLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX3-neuronCellWidth*2-neuronCellHeight, y:  neuronY3+neuronCellDeltaY)
                        
                        Path { path in
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*2, y: neuronY3 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*2-neuronCellHeight*0.5, y: neuronY3 + neuronCellDeltaY))
                        }
                        .stroke(n1n2OutputLineColor, lineWidth: n1n2OutputLineWidth)
                        
                        
                        Rectangle()
                            .fill(n3wBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: neuronX3-neuronCellWidth*1.5, y: neuronY3 + neuronCellDeltaY )
                        
                        Rectangle()
                            .fill(n3wvBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 + neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: neuronX3-neuronCellWidth*2, y: neuronY3 + neuronCellDeltaY - neuronCellHeight/2, width: neuronCellWidth*2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3 + neuronCellDeltaY - neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3 + neuronCellDeltaY + neuronCellHeight/2))
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        
                        
                        Text(w6Text)
                            .scaleEffect(w6Scale)
                            .position(x: neuronX3-neuronCellWidth*1.5, y: neuronY3 + neuronCellDeltaY )
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(w6Color)
                            .animation(.easeInOut, value: w6Color)
                        
                        // Box of W6 Value
                        
                        Text(wv6Text)
                            .scaleEffect(wv6Scale)
                            .position(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 + neuronCellDeltaY )
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(wv6Color)
                            .animation(.easeInOut, value: wv6Color)
                        
                        // B3 ----------------------------
                        Rectangle()
                            .fill(n3bBGColor)
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX3-neuronCellWidth*1.5, y: neuronY3 )
                        
                        
                        Path { path in
                            let rect = CGRect(x: neuronX3-neuronCellWidth*2, y: neuronY3-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3 + neuronCellDeltaY-neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3 + neuronCellDeltaY+neuronCellHeight/2))
                            
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        
                        
                        Text(b3Text)
                            .scaleEffect(b3Scale)
                            .position(x: neuronX3-neuronCellWidth*1.5, y: neuronY3)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(b3Color)
                            .animation(.easeInOut, value: b3Color)
                        
                        // Symbol of plus
                        
                        Image( "plusIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n3SumLineColor)
                            .frame(width: geometry.size.width/40, height: geometry.size.width/40)
                            .position(x: neuronX3-neuronCellWidth*0.5, y:  neuronY3)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 - neuronCellDeltaY + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 - neuronCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 + neuronCellHeight*0.5))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*0.5, y: neuronY3 + neuronCellDeltaY - neuronCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth, y: neuronY3))
                            path.addLine(to: CGPoint(x: neuronX3-neuronCellWidth*0.5-neuronCellHeight*0.5, y: neuronY3))
                            
                            path.move(to: CGPoint(x: neuronX3-neuronCellWidth*0.5+neuronCellHeight*0.5, y: neuronY3))
                            path.addLine(to: CGPoint(x: neuronX3+neuronCellHeight/2, y: neuronY3))
                            path.addLine(to: CGPoint(x: neuronX3+neuronCellHeight/2, y: neuronY3-neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: neuronX3+neuronCellHeight, y: neuronY3-neuronCellDeltaY))
                            
                        } // 设置矩形的尺寸
                        .stroke(n3SumLineColor, lineWidth: n3SumLineWidth)
                        
                        // Box of sum
                        Rectangle()
                            .fill(n3sBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX3+neuronCellHeight+neuronCellWidth*0.5, y: neuronY3 - neuronCellDeltaY)
                        Path { path in
                            let rect = CGRect(x: neuronX3+neuronCellHeight, y: neuronY3 - neuronCellDeltaY - neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Text(s3Text)
                            .scaleEffect(s3Scale)
                            .position(x: neuronX3+neuronCellHeight+neuronCellWidth*0.5, y: neuronY3 - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(s3Color)
                            .animation(.easeInOut, value: s3Color)
                        
                        Image( "funcIcon") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n3FuncLineColor)
                            .frame(width: geometry.size.width/30, height: geometry.size.width/30)
                            .position(x: neuronX3 + neuronCellWidth*0.5, y:  neuronY3)
                        
                        Image( "1+e2") // Placeholder image, replace with your own
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(n3FuncLineColor)
                            .frame(width: geometry.size.width/15, height: geometry.size.width/15)
                            .position(x: neuronX3 + neuronCellWidth*1.2, y:  neuronY3)
                        
                        // Box of f(x)
                        Rectangle()
                            .fill(n3fBGColor) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronCellWidth, height: neuronCellHeight)
                            .position(x: neuronX3+neuronCellHeight+neuronCellWidth*0.5, y: neuronY3 + neuronCellDeltaY)
                        Path { path in
                            let rect = CGRect(x: neuronX3+neuronCellHeight, y: neuronY3 + neuronCellDeltaY-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        
                        Text(f3Text)
                            .scaleEffect(f3Scale)
                            .position(x:neuronX3+neuronCellHeight+neuronCellWidth*0.5, y: neuronY3 + neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(f3Color)
                            .animation(.easeInOut, value: f3Color)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX3+neuronCellDeltaX*0.6, y: neuronY3-geometry.size.width*0.0135))
                            path.addLine(to: CGPoint(x: neuronX3+neuronCellDeltaX*0.6, y: neuronY3 - neuronCellDeltaY + neuronCellHeight/2 ))
                            
                            path.move(to: CGPoint(x: neuronX3+neuronCellDeltaX*0.6, y: neuronY3 + geometry.size.width*0.0135))
                            path.addLine(to: CGPoint(x: neuronX3+neuronCellDeltaX*0.6, y: neuronY3 + neuronCellDeltaY-neuronCellHeight/2))
                            
                            
                        }
                        .stroke(n3FuncLineColor, lineWidth: n3FuncLineWidth)
                        
                        
                        // ------------------------------ Input layer  ------------------------------------
                        Text("Weight")
                            .position(x: inputLayerX, y:neuronY1 - neuronCellDeltaY - neuronCellHeight )
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Rectangle()
                            .fill(weightBGColor)
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: inputLayerX, y: neuronY1 - neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: inputLayerX-neuronCellWidth*0.5, y: neuronY1 - neuronCellDeltaY - neuronCellHeight*0.5, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Path { path in
                            path.move(to: CGPoint(x: inputLayerX+neuronCellWidth*0.5, y: neuronY1  - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: inputLayerX+neuronCellWidth*1.3, y: neuronY1  - neuronCellDeltaY))
                            
                            path.move(to: CGPoint(x: inputLayerX+neuronCellWidth*1.0, y: neuronY1  - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: inputLayerX+neuronCellWidth*1.0, y: neuronY2  - neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: inputLayerX+neuronCellWidth*1.3, y: neuronY2  - neuronCellDeltaY))
                        }
                        .stroke(weightOutLineColor, lineWidth: weightOutLineWidth)
                        
                        
                        
                        Text(weightText)
                            .scaleEffect(weightScale)
                            .position(x: inputLayerX, y: neuronY1  - neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(weightColor)
                            .animation(.easeInOut, value: weightColor)
                        
                        Text("Height")
                            .position(x: inputLayerX, y: neuronY2  + neuronCellDeltaY + neuronCellHeight )
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Rectangle()
                            .fill(heightBGColor)
                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                            .position(x: inputLayerX, y: neuronY2 + neuronCellDeltaY)
                        
                        Path { path in
                            let rect = CGRect(x: inputLayerX-neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY - neuronCellHeight*0.5, width: neuronCellWidth, height: neuronCellHeight)
                            path.addRect(rect)
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        Path { path in
                            path.move(to: CGPoint(x: inputLayerX+neuronCellWidth*0.5, y: neuronY2 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: inputLayerX+neuronCellWidth*1.3, y: neuronY2 + neuronCellDeltaY))
                            
                            path.move(to: CGPoint(x: inputLayerX+neuronCellWidth*0.85, y: neuronY2 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: inputLayerX+neuronCellWidth*0.85, y: neuronY1 + neuronCellDeltaY))
                            path.addLine(to: CGPoint(x: inputLayerX+neuronCellWidth*1.3, y: neuronY1 + neuronCellDeltaY))
                        }
                        .stroke(weightOutLineColor, lineWidth: weightOutLineWidth)
                        
                        Text(heightText)
                            .scaleEffect(heightScale)
                            .position(x: inputLayerX, y: neuronY2 + neuronCellDeltaY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(heightColor)
                            .animation(.easeInOut, value: heightColor)
                        
                        
                        // ----------------------------------     Train Data  ----------------------------------------
                        
                        
                        Text("Train Data")
                            .position(x: trainDataX, y: trainDataY)
                            .font(.system(size: neuronTextFontSize*2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Rectangle() // 创建一个矩形
                            .fill(contentBGColor)
                            .frame(width: trainDataBoxWidth, height: trainDataCellHeight)
                            .position(x: trainDataX, y: tdRow0)
                        
                        Text("Weight")
                            .position(x: tdWeightX, y: tdRow0)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(contentTextColor)
                        
                        Text("Height")
                            .position(x: tdHeightX, y: tdRow0)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(contentTextColor)
                        
                        Text("Sex")
                            .position(x: tdSexX, y: tdRow0)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(contentTextColor)
                        
                        Text("Delta")
                            .position(x: tdDeltaX, y: tdRow0)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(contentTextColor)
                        
                        Text("Output")
                            .position(x: tdOutputX, y: tdRow0)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(contentTextColor)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataRowBGColor[0]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.6, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdWeightX, y: tdRow1)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataRowBGColor[1]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.6, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdWeightX, y: tdRow2)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataRowBGColor[2]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.6, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdWeightX, y: tdRow3)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataRowBGColor[3]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.6, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdWeightX, y: tdRow4)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataDeltaBGColor[0]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdDeltaX, y: tdRow1)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataDeltaBGColor[1]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdDeltaX, y: tdRow2)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataDeltaBGColor[2]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdDeltaX, y: tdRow3)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataDeltaBGColor[3]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdDeltaX, y: tdRow4)
                        
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataResultBGColor[0]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdOutputX, y: tdRow1)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataResultBGColor[1]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdOutputX, y: tdRow2)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataResultBGColor[2]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdOutputX, y: tdRow3)
                        
                        Rectangle() // 创建一个矩形
                            .fill(dataResultBGColor[3]) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.2, height: trainDataCellHeight) // 设置矩形的尺寸
                            .position(x: tdOutputX, y: tdRow4)
                        
                        Path { path in
                            let rect = CGRect(x: trainDataX-trainDataBoxWidth/2, y: tdRow0-trainDataCellHeight*0.5, width: trainDataBoxWidth, height: trainDataCellHeight*5)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: trainDataX-trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*0.5))
                            path.addLine(to: CGPoint(x: trainDataX+trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: trainDataX-trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*1.5))
                            path.addLine(to: CGPoint(x: trainDataX+trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*1.5))
                            
                            path.move(to: CGPoint(x: trainDataX-trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*2.5))
                            path.addLine(to: CGPoint(x: trainDataX+trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*2.5))
                            
                            path.move(to: CGPoint(x: trainDataX-trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*3.5))
                            path.addLine(to: CGPoint(x: trainDataX+trainDataBoxWidth/2, y: tdRow0+trainDataCellHeight*3.5))
                            
                            path.move(to: CGPoint(x: trainDataX-trainDataBoxWidth*0.3, y: tdRow0-trainDataCellHeight*0.5))
                            path.addLine(to: CGPoint(x: trainDataX-trainDataBoxWidth*0.3, y: tdRow0+trainDataCellHeight*4.5))
                            
                            path.move(to: CGPoint(x: trainDataX-trainDataBoxWidth*0.1, y: tdRow0-trainDataCellHeight*0.5))
                            path.addLine(to: CGPoint(x: trainDataX-trainDataBoxWidth*0.1, y: tdRow0+trainDataCellHeight*4.5))
                            
                            path.move(to: CGPoint(x: trainDataX+trainDataBoxWidth*0.1, y: tdRow0-trainDataCellHeight*0.5))
                            path.addLine(to: CGPoint(x: trainDataX+trainDataBoxWidth*0.1, y: tdRow0+trainDataCellHeight*4.5))
                            
                            path.move(to: CGPoint(x: trainDataX+trainDataBoxWidth*0.3, y: tdRow0-trainDataCellHeight*0.5))
                            path.addLine(to: CGPoint(x: trainDataX+trainDataBoxWidth*0.3, y: tdRow0+trainDataCellHeight*4.5))
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        
                        
                        // Train data
                        Text("133")
                            .scaleEffect(dataRowScale[0])
                            .position(x: tdWeightX, y: tdRow1)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("65")
                            .scaleEffect(dataRowScale[0])
                            .position(x: tdHeightX, y: tdRow1)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("1.0(F)")
                            .scaleEffect(dataRowScale[0])
                            .position(x: tdSexX, y: tdRow1)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataDeltaText[0])
                            .scaleEffect(dataDeltaTextScale[0])
                            .position(x: tdDeltaX, y: tdRow1)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataResultText[0])
                            .scaleEffect(dataResultTextScale[0])
                            .position(x: tdOutputX, y: tdRow1)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        if(dataResult[0] == 1){
                            Image( "AnswerRight") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.green)
                                .frame(width: geometry.size.width/36, height: geometry.size.width/36)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow1)
                        }
                        else if(dataResult[0] == 2){
                            Image( "AnswerWrong") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.red)
                                .frame(width: geometry.size.width/48, height: geometry.size.width/48)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow1)
                        }
                        
                        
                        Text("124")
                            .scaleEffect(dataRowScale[1])
                            .position(x: tdWeightX, y: tdRow2)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("61")
                            .scaleEffect(dataRowScale[1])
                            .position(x: tdHeightX, y: tdRow2)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("1.0(F)")
                            .scaleEffect(dataRowScale[1])
                            .position(x: tdSexX, y: tdRow2)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataDeltaText[1])
                            .scaleEffect(dataDeltaTextScale[1])
                            .position(x: tdDeltaX, y: tdRow2)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataResultText[1])
                            .scaleEffect(dataResultTextScale[1])
                            .position(x: tdOutputX, y: tdRow2)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        if(dataResult[1] == 1){
                            Image( "AnswerRight") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.green)
                                .frame(width: geometry.size.width/36, height: geometry.size.width/36)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow2)
                        }
                        else if(dataResult[1] == 2){
                            Image( "AnswerWrong") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.red)
                                .frame(width: geometry.size.width/48, height: geometry.size.width/48)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow2)
                        }
                        
                        Text("160")
                            .scaleEffect(dataRowScale[2])
                            .position(x: tdWeightX, y: tdRow3)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        
                        Text("70")
                            .scaleEffect(dataRowScale[2])
                            .position(x: tdHeightX, y: tdRow3)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("0.0(M)")
                            .scaleEffect(dataRowScale[2])
                            .position(x: tdSexX, y: tdRow3)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataDeltaText[2])
                            .scaleEffect(dataDeltaTextScale[2])
                            .position(x: tdDeltaX, y: tdRow3)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataResultText[2])
                            .scaleEffect(dataResultTextScale[2])
                            .position(x: tdOutputX, y: tdRow3)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        
                        if(dataResult[2] == 1){
                            Image( "AnswerRight") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.green)
                                .frame(width: geometry.size.width/36, height: geometry.size.width/36)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow3)
                        }
                        else if(dataResult[2] == 2){
                            Image( "AnswerWrong") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.red)
                                .frame(width: geometry.size.width/48, height: geometry.size.width/48)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow3)
                        }
                        
                        Text("152")
                            .scaleEffect(dataRowScale[3])
                            .position(x: tdWeightX, y: tdRow4)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("69")
                            .scaleEffect(dataRowScale[3])
                            .position(x: tdHeightX, y: tdRow4)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text("0.0(M)")
                            .scaleEffect(dataRowScale[3])
                            .position(x: tdSexX, y: tdRow4)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataDeltaText[3])
                            .scaleEffect(dataDeltaTextScale[3])
                            .position(x: tdDeltaX, y: tdRow4)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Text(dataResultText[3])
                            .scaleEffect(dataResultTextScale[3])
                            .position(x: tdOutputX, y: tdRow4)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        
                        if(dataResult[3] == 1){
                            Image( "AnswerRight") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.green)
                                .frame(width: geometry.size.width/36, height: geometry.size.width/36)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow4)
                        }
                        else if(dataResult[3] == 2){
                            Image( "AnswerWrong") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.red)
                                .frame(width: geometry.size.width/48, height: geometry.size.width/48)
                                .position(x: trainDataX+trainDataBoxWidth*0.55, y: tdRow4)
                        }
                        // From train data table to input layer
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdHeightX+trainDataBoxWidth*0.1, y: tdRow1))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow1))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow2))
                        }
                        .stroke(dataToAverageLineColor[0], lineWidth: dataToAverageLineWidth[0])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdHeightX+trainDataBoxWidth*0.1, y: tdRow2))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow2))
                        }
                        .stroke(dataToAverageLineColor[1], lineWidth: dataToAverageLineWidth[1])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdToAverageLineX, y: tdRow2))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow3))
                        }
                        .stroke(dataToAverageLineColor[2], lineWidth: dataToAverageLineWidth[2])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdHeightX+trainDataBoxWidth*0.1, y: tdRow3))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow3))
                        }
                        .stroke(dataToAverageLineColor[3], lineWidth: dataToAverageLineWidth[3])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdToAverageLineX, y: tdRow3))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow4))
                        }
                        .stroke(dataToAverageLineColor[4], lineWidth: dataToAverageLineWidth[4])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdHeightX+trainDataBoxWidth*0.1, y: tdRow4))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: tdRow4))
                        }
                        .stroke(dataToAverageLineColor[5], lineWidth: dataToAverageLineWidth[5])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdToAverageLineX, y: tdRow4))
                            path.addLine(to: CGPoint(x: tdToAverageLineX, y: neuronY3))
                        }
                        .stroke(dataToAverageLineColor[6], lineWidth: dataToAverageLineWidth[6])
                        
                        Path { path in
                            path.move(to: CGPoint(x: tdToAverageLineX, y: neuronY3))
                            path.addLine(to: CGPoint(x: inputLayerX-trainDataBoxWidth*0.15, y: neuronY3))
                        }
                        .stroke(dataToAverageLineColor[7], lineWidth: dataToAverageLineWidth[7])
                        
                        // Box of avarage
                        Rectangle() // 创建一个矩形
                            .fill(dataAverageColor) // 设置矩形的填充颜色为绿色
                            .frame(width: trainDataBoxWidth*0.3, height: trainDataCellHeight*3.2) // 设置矩形的尺寸
                            .position(x: inputLayerX, y: neuronY3)
                        
                        Path { path in
                            let rect = CGRect(x: inputLayerX-trainDataBoxWidth*0.15, y:neuronY3 - trainDataCellHeight*1.6, width: trainDataBoxWidth*0.3, height: trainDataCellHeight*3.2)
                            path.addRect(rect)
                        }
                        .stroke(mainTextColor, lineWidth: 2)
                        
                        
                        // From average box to weight and height
                        Path { path in
                            path.move(to: CGPoint(x: inputLayerX, y: neuronY3 - trainDataCellHeight*1.6))
                            path.addLine(to: CGPoint(x: inputLayerX, y: neuronY1 - neuronCellDeltaY + trainDataCellHeight*0.5))
                            
                            path.move(to: CGPoint(x: inputLayerX, y: neuronY3 + trainDataCellHeight*1.6))
                            path.addLine(to: CGPoint(x: inputLayerX, y: neuronY2 + neuronCellDeltaY - trainDataCellHeight*0.5))
                        }
                        .stroke(averageToWeightColor, lineWidth: averageToWeightWidth)
                        
                        Text("W - 145")
                            .scaleEffect(averageTextScale)
                            .position(x: inputLayerX, y: neuronY3 - trainDataCellHeight)
                            .font(.system(size: neuronTextFontSize*1.1*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        Text("(Average)")
                            .scaleEffect(averageTextScale)
                            .position(x: inputLayerX, y: neuronY3)
                            .font(.system(size: neuronTextFontSize*1.1*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        Text("H - 66")
                            .scaleEffect(averageTextScale)
                            .position(x: inputLayerX, y: neuronY3 + trainDataCellHeight)
                            .font(.system(size: neuronTextFontSize*1.1*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        let testPosX = geometry.size.width*0.18
                        let testPosY = trainDataY+9.2*trainDataCellHeight
                        
                        let testTextFieldX = testPosX
                        let testTextFieldY = testPosY
                        
                        
                        // From neuron 3 to data train table
                        let out3toTDLineY = trainDataY + trainDataCellHeight*16
                        Path { path in
                            
                            path.move(to: CGPoint(x: neuronX3+neuronCellHeight+neuronCellWidth/2, y: neuronY3 + neuronCellDeltaY + neuronCellHeight/2))
                            path.addLine(to: CGPoint(x: neuronX3+neuronCellHeight+neuronCellWidth/2, y: out3toTDLineY))
                            path.addLine(to: CGPoint(x: testPosX+neuronCellWidth, y: out3toTDLineY))
                        }
                        .stroke(n3OutputLineColor1, lineWidth: n3OutputLineWidth1)
                        
                        Path { path in
                            
                            path.move(to: CGPoint(x: testPosX+neuronCellWidth, y: out3toTDLineY))
                            path.addLine(to: CGPoint(x: tdOutputX, y: out3toTDLineY))
                            path.addLine(to: CGPoint(x: tdOutputX, y: tdRow4+trainDataCellHeight*0.5))
                        } // 设置矩形的尺寸
                        .stroke(n3OutputLineColor2, lineWidth: n3OutputLineWidth2)
                        
                        // MSE loss
                        let mseLossX = tdDeltaX
                        let mseLossY = tdRow4+trainDataCellHeight*2
                        
                        Text("MSE Loss")
                            .position(x: mseLossX, y: mseLossY+trainDataCellHeight)
                            .font(.system(size: neuronTextFontSize*1.2*fontScale))
                            .bold()
                            .foregroundColor(mainTextColor)
                        
                        Path { path in
                            let rect = CGRect(x: mseLossX-neuronCellWidth*0.6, y: mseLossY-neuronCellHeight/2, width: neuronCellWidth*1.2, height: neuronCellHeight)
                            path.addRect(rect)
                            
                            path.move(to: CGPoint(x: mseLossX, y: tdRow4+trainDataCellHeight*0.5))
                            path.addLine(to: CGPoint(x: mseLossX, y: mseLossY-neuronCellHeight/2))
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        
                        
                        Text(mseLossText)
                            .position(x: mseLossX, y: mseLossY)
                            .font(.system(size: neuronTextFontSize*fontScale))
                            .foregroundColor(mainTextColor)
                        
                        
                        // Test function
                        if canTest {
                            
                            TextField("0", text: $testWeight)
                                .position(x:testPosX+neuronCellWidth, y:testPosY)
                                .frame( width:neuronCellWidth*0.8, height:neuronCellHeight)
                                .font(.system(size: neuronTextFontSize*1.2*fontScale))
                                .onChange(of: testWeight) { newValue in
                                    // 当输入内容变化时，执行此处代码
                                    // 过滤输入，只允许数字且长度不超过3位
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered.count > 6 {
                                        // 如果过滤后的字符串长度超过3位，只取前3位
                                        testWeight = String(filtered.prefix(3))
                                    } else {
                                        testWeight = filtered
                                    }
                                }
                                .foregroundColor(mainTextColor)
                            
                            Path { path in
                                let rect = CGRect(x: testPosX+neuronCellWidth/2, y: testPosY-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                                path.addRect(rect)
                            }
                            .stroke(neuronBorderColor, lineWidth: 2)
                            
                            Text("Weight:")
                                .position(x: testPosX, y: testPosY)
                                .font(.system(size: neuronTextFontSize*1.2*fontScale))
                                .bold()
                                .foregroundColor(mainTextColor)
                            
                            TextField("0", text: $testHeight)
                                .position(x:testPosX+neuronCellWidth, y:testPosY+neuronCellHeight*1.5)
                                .frame( width:neuronCellWidth*0.8, height:neuronCellHeight)
                                .font(.system(size: neuronTextFontSize*1.2*fontScale))
                                .onChange(of: testHeight) { newValue in
                                    // 当输入内容变化时，执行此处代码
                                    // 过滤输入，只允许数字且长度不超过3位
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered.count > 6 {
                                        // 如果过滤后的字符串长度超过3位，只取前3位
                                        testHeight = String(filtered.prefix(3))
                                    } else {
                                        testHeight = filtered
                                    }
                                }
                                .keyboardType(.numberPad)
                                .foregroundColor(mainTextColor)
                            
                            Path { path in
                                let rect = CGRect(x: testPosX+neuronCellWidth/2, y: testPosY+neuronCellHeight, width: neuronCellWidth, height: neuronCellHeight)
                                path.addRect(rect)
                            }
                            .stroke(neuronBorderColor, lineWidth: 2)
                            
                            Text("Height:")
                                .position(x: testPosX, y: testPosY+neuronCellHeight*1.5)
                                .font(.system(size: neuronTextFontSize*1.2*fontScale))
                                .bold()
                                .foregroundColor(mainTextColor)
                            
                            Text("Result:")
                                .position(x: testPosX, y: testPosY+neuronCellHeight*4.5)
                                .font(.system(size: neuronTextFontSize*1.2*fontScale))
                                .bold()
                                .foregroundColor(mainTextColor)
                            
                            RoundedRectangle(cornerRadius: 20) // 设置圆角半径为20
                                .stroke(neuronBorderColor, lineWidth: 2)
                                .frame(width:neuronCellWidth, height:neuronCellHeight*1.2) // 设置矩形的宽度和高度
                                .position(x: testPosX+neuronCellWidth, y: testPosY+neuronCellHeight*4.5)
                            
                            Text(testResult)
                                .scaleEffect(testResultScale)
                                .position(x: testPosX+neuronCellWidth, y: testPosY+neuronCellHeight*4.5)
                                .font(.system(size: neuronTextFontSize*1.2*fontScale))
                                .bold()
                                .foregroundColor(.gray)
                            
                            Button(action: {
                                Task {
                                    playSound(filename:"Button2")
                                    isForwardOnly = false
                                    await OnTest()
                                }
                                
                            }) {
                                Text("Test")
                                    .frame( width:geometry.size.width*0.08, height:geometry.size.width*0.025)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.blue)
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .font(.system(size: 15.0))
                                    .foregroundColor(.white)
                                    .scaleEffect(isBtnTestPressed ? 0.9 : 1.0) // 按下时缩放
                            }
                            .position(x:testPosX+neuronCellWidth, y:testPosY+neuronCellHeight*3)
                            .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isBtnTestPressed = pressing
                                }
                            }, perform: {})
                            
                            // Test line to average
                            Path { path in
                                path.move(to: CGPoint(x: testPosX+neuronCellWidth*1.5, y: testPosY+neuronCellHeight*1.5))
                                path.addLine(to: CGPoint(x: tdToAverageLineX, y: testPosY+neuronCellHeight*1.5))
                                path.addLine(to: CGPoint(x: tdToAverageLineX, y: neuronY3))
                               
                                path.move(to: CGPoint(x: testPosX+neuronCellWidth*1.5, y: testPosY))
                                path.addLine(to: CGPoint(x: tdToAverageLineX, y: testPosY))
                            }
                            .stroke(dataToAverageLineColor[8], lineWidth: dataToAverageLineWidth[8])
                            
                            // Line from n3 output to test result
                            Path { path in
                                
                                path.move(to: CGPoint(x: testPosX+neuronCellWidth, y: testPosY+neuronCellHeight*5.0))
                                path.addLine(to: CGPoint(x: testPosX+neuronCellWidth, y: out3toTDLineY))
                            }
                            .stroke(n3OutputLineColor3, lineWidth: n3OutputLineWidth3)
                        }
                        
                        // Buttons
                        let buttonPanelX = geometry.size.width*0.15
                        //let buttonHeight = geometry.size.height*0.06
                        let buttonPanelY = geometry.size.height*0.95
                        let buttonWidth  = geometry.size.width*0.15
                        let buttonHeight = buttonWidth*0.25
                        let buttonTextFont = 15.0
                        let buttonDeltaX = geometry.size.width*0.18
                        let buttonDeltaY = 0.0
                        
                        Button(action: {
                            playSound(filename:"Button2")
                            OnResetNetwork()
                            //Task {await OnTrain10()}
                            print("Reset action")
                            
                        }) {
                            Text("Reset Model")
                                .frame( width:buttonWidth, height:buttonHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(disableAllButtons||isResetDisable ? Color.gray : Color.blue)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .font(.system(size: buttonTextFont))
                                .foregroundColor(.white)
                                .scaleEffect(isBtnResetPressed ? 0.9 : 1.0) // 按下时缩放
                        }
                        .disabled(disableAllButtons||isResetDisable)
                        .position(x:buttonPanelX, y:buttonPanelY)
                        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                            print("Reset pressed:"+String(pressing)+String(disableAllButtons)+String(isResetDisable))
                            if(!(disableAllButtons||isResetDisable)){
                                print("Reset pressed animation")
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isBtnResetPressed = pressing
                                }
                            }
                        }, perform: {})
                        
                        Button(action: {
                            Task {
                                playSound(filename:"Button2")
                                isForwardOnly = true
                                await OnFeedForward()
                            }
                        }) {
                            Text("Feed Forward")
                                .font(.system(size: buttonTextFont))
                                .frame( width:buttonWidth, height:buttonHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(stepIndex==0||disableAllButtons||isForwardDisable ? Color.gray : Color.blue)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                                .clipShape(Rectangle())
                                .scaleEffect(isBtnForwardPressed ? 0.9 : 1.0) // 按下时缩放
                        }
                        .disabled(stepIndex==0||disableAllButtons||isForwardDisable)
                        .position(x:buttonPanelX+buttonDeltaX, y:buttonPanelY+buttonDeltaY)
                        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                            if(!(stepIndex==0||disableAllButtons||isForwardDisable)){
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isBtnForwardPressed = pressing
                                }
                            }
                        }, perform: {})
                        
                        Button(action: {
                            Task {
                                playSound(filename:"Button2")
                                await OnBackPropagation()
                            }
                        }) {
                            Text("Back Propagation")
                                .font(.system(size: buttonTextFont))
                                .frame( width:buttonWidth, height:buttonHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(stepIndex==0||disableAllButtons||isBackDisable ? Color.gray : Color.blue)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                                .clipShape(Rectangle())
                                .scaleEffect(isBtnBackPressed ? 0.9 : 1.0) // 按下时缩放
                        }
                        .disabled(stepIndex==0||disableAllButtons||isBackDisable)
                        .position(x:buttonPanelX+buttonDeltaX*2, y:buttonPanelY+buttonDeltaY*2)
                        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                            if(!(stepIndex==0||disableAllButtons||isBackDisable)){
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isBtnBackPressed = pressing
                                }
                            }
                        }, perform: {})
                        
                        Button(action: {
                            Task {
                                playSound(filename:"Button2")
                                disableAllButtons = true
                                isForwardOnly = false
                                roundOfTrain += 1
                                await OnTrain1()
                            }
                        }) {
                            Text("Train Once")
                                .font(.system(size: buttonTextFont))
                                .frame( width:buttonWidth, height:buttonHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(stepIndex==0||disableAllButtons||isTrain1Disable ? Color.gray : Color.blue)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                                .clipShape(Rectangle())
                                .scaleEffect(isBtnTrain1Pressed ? 0.9 : 1.0) // 按下时缩放
                        }
                        .disabled(stepIndex==0||disableAllButtons||isTrain1Disable)
                        .position(x:buttonPanelX+buttonDeltaX*3, y:buttonPanelY+buttonDeltaY*3)
                        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                            if(!(stepIndex==0||disableAllButtons||isTrain1Disable)){
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isBtnTrain1Pressed = pressing
                                }
                            }
                        }, perform: {})
                        
                        Button(action: {
                            Task {
                                playSound(filename:"Button2")
                                disableAllButtons = true
                                isForwardOnly = false
                                roundOfTrain += 10
                                await OnTrain10()
                            }
                        }) {
                            Text("Train 10 times")
                                .font(.system(size: buttonTextFont))
                                .frame( width:buttonWidth, height:buttonHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(stepIndex==0||disableAllButtons||isTrain10Disable ? Color.gray : Color.blue)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                                .clipShape(Rectangle())
                                .scaleEffect(isBtnTrain10Pressed ? 0.9 : 1.0) // 按下时缩放
                        }
                        .disabled(stepIndex==0||disableAllButtons||isTrain10Disable)
                        .position(x:buttonPanelX+buttonDeltaX*4, y:buttonPanelY+buttonDeltaY*4)
                        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                            if(!(stepIndex==0||disableAllButtons||isTrain10Disable)){
                                withAnimation(.easeInOut(duration: 0.8)) {
                                    isBtnTrain10Pressed = pressing
                                }
                            }
                        }, perform: {})
                    } // Geometry
                }// Ensure ZStack fits the rectangle size
                .opacity( showPage ? 1.0 : 0.0)
                .frame(width: geometryView.size.width, height: geometryView.size.height*aniViewHeight[viewDir])
                
                VStack{
                    GeometryReader { geometry in
                        let contentText = ["This neural network (model) uses human weight and height to forecast sex. The input layer has two input nodes: weight and height, two neurons in the hidden layer, and one in the output layer. We must train the model first. Supervised Machine Learning is used here, which trains the model by manipulating the labeled dataset. There are four data pairs with human's weight and height and result with 0 mean male and 1 for female. ",
                           "Initially, we didn't know the correct parameters for this model; we could set all parameters as random. \nPress the 'Reset model' button to initialize the model with random parameters.",
                                           "We can start feeding train data to the model by pressing the 'Feed Forward' button.",
                                           "The first record was fed into the model, and the model generated an output. There is a difference(delta) between the output and the real value (1.0). We know the functions used in the model, we can adjust the parameters to reduce the difference. \nTry the 'Back Propagation' button now.",
                                           "Weights and bias value of neurons were adjusted. Repeat the process and use all train data to train the model.",
                                           "After using all train data, we finished one round of training. We can measure the loss of the current model to know how accurate it is. If we repeat it, we can see the loss become less and less, which means our model become more and more accurate.\nKeep training until the loss becomes less 0.05.",
                                           "Now, we can test our model. You can input some weight and height data to see the result.",
                                           "Thanks for trying my application. I hope you enjoy it.",
                                           "\n(This demo is a simplified model. We just used four pairs of data to train it. So, it can work with standard data only. A model used in the real world can typically contain thousands to millions of neurons and be trained thousands or even millions of rounds by a large amount of data.)",
                                           "Sometimes, even after several training rounds, the accuracy cannot be improved and may even decrease. In such cases, the only option is resetting the data and repeatedly starting the training."
                        ]
                        
                        Rectangle()
                            .fill(.red)
                            .frame(width: geometry.size.width, height: geometry.size.height*0.04)
                            .position(x: geometry.size.width/2, y: geometry.size.height*0.02 )
                        
                        Rectangle()
                            .fill(contentBGColor)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .position(x: geometry.size.width/2, y: geometry.size.height*0.53 )
                                           
                        
                        if(roundOfTrain>200){
                            Text(contentText[9])
                                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.8)
                                .font(.system(size: min(geometry.size.width / 16, 22)))
                                .foregroundColor(.red)
                                .opacity(textOpacity)
                                .font(.system(size: min(geometry.size.height / 14, 24)))
                                .position(x:geometry.size.width/2, y:geometry.size.height*0.4)
                                .animation(.easeInOut, value: textOpacity)
                        }
                        else {
                            if(stepIndex==6){
                                Text(contentText[stepIndex])
                                    .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.8)
                                    .font(.system(size: min(geometry.size.width / 16, 24)))
                                    .foregroundColor(contentTextColor)
                                    .opacity(textOpacity)
                                    .font(.system(size: min(geometry.size.height / 14, 24)))
                                    .position(x:geometry.size.width/2, y:geometry.size.height*0.4)
                                    .animation(.easeInOut, value: textOpacity)
                                
                                Text(contentText[8])
                                    .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.8)
                                    .font(.system(size: min(geometry.size.width / 16, 20)))
                                    .italic()
                                    .foregroundColor(contentTextColor)
                                    .font(.system(size: min(geometry.size.height / 20, 20)))
                                    .position(x:geometry.size.width/2, y:geometry.size.height*0.6)
                                    .opacity(textOpacity )
                                    .animation(.easeInOut, value: textOpacity)
                                    .italic()
                            }
                            else {
                                Text(contentText[stepIndex])
                                    .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.8)
                                    .font(.system(size: min(geometry.size.width / 16, stepIndex==7 ? 36 : 22)))
                                    .foregroundColor(contentTextColor)
                                    .opacity(textOpacity)
                                    .font(.system(size: min(geometry.size.height / 14, 24)))
                                    .position(x:geometry.size.width/2, y:geometry.size.height*0.4)
                                    .animation(.easeInOut, value: textOpacity)
                            }
                        }
                        
                        if(stepIndex == 0) {
                            Spacer()
                            Text("Tap to continue...")
                                .font(.system(size: min(geometry.size.width / 16, 24)))
                                .italic()
                                .foregroundColor(contentTextColor)
                                .position(x:geometry.size.width/2, y:geometry.size.height*0.9)
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
                    /*
                    .padding(.horizontal,geometry.size.width/16)
                    .padding(.top, geometry.size.height/10)
                    .foregroundColor(contentTextColor)
                    .opacity(textOpacity )*/
                    
                }
                .frame(width: geometryView.size.width, height: geometryView.size.height*(1-aniViewHeight[viewDir]))
                .position(x:geometryView.size.width/2, y: showPage ? geometryView.size.height*(1-(1-aniViewHeight[viewDir])/2) : geometryView.size.height*(1-(1-aniViewHeight[viewDir])/2+0.255))
                
            }// GeometryView
            .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
            .onTapGesture {
                if(stepIndex<1){
                    playSound(filename:"Button2")
                    stepIndex = stepIndex + 1
                    disableAllButtons = false
                }
           
            }
        }// ZStack
        .background(mainBGColor)
        .onAppear(){
            withAnimation(.easeInOut(duration: 0.4)) {
                showPage.toggle()
            }
        }
        .statusBar(hidden: true) // This hides the status bar
    }
    
    func FormatNumber(number:Double) -> String {
        var result = String(format: "%.5f", number)
        while result.last == "0" {
            result.removeLast()
        }
        if result.last == "." {
            result = result + "0"
        }
        return result
    }
    
    func OnResetNetwork() {
        
        roundOfTrain = 0
        trainDataIndex = 0
        
        print("OnResetNetwork")
        
        network.trainData[4][0] = 0.0
        network.trainData[4][1] = 0.0
        
        testWeight = "0"
        testHeight = "0"
        testResult = "?"
        
        network.resetNetwork()
        
        isBtnResetPressed = false
        
        w1Text = FormatNumber(number:network.w1)
        w2Text = FormatNumber(number:network.w2)
        w3Text = FormatNumber(number:network.w3)
        w4Text = FormatNumber(number:network.w4)
        w5Text = FormatNumber(number:network.w5)
        w6Text = FormatNumber(number:network.w6)
        
        b1Text = FormatNumber(number:network.b1)
        b2Text = FormatNumber(number:network.b2)
        b3Text = FormatNumber(number:network.b3)
        
        disableAllButtons = true
        
        withAnimation(.easeInOut(duration: 0.2)) {
            w1Scale = 1.2
            
            w2Scale = 1.2
            
            w3Scale = 1.2
            
            w4Scale = 1.2
            
            w5Scale = 1.2
            
            w6Scale = 1.2
            
            b1Scale = 1.2
            
            b2Scale = 1.2
            
            b3Scale = 1.2
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            withAnimation(.easeInOut(duration: 0.2)) {
                //w1Color = contentTextColor
                w1Scale = 1.0
                
                //w2Color = contentTextColor
                w2Scale = 1.0
                
                //w3Color = contentTextColor
                w3Scale = 1.0
                
                //w4Color = contentTextColor
                w4Scale = 1.0
                
                //w5Color = contentTextColor
                w5Scale = 1.0
                
                //w6Color = contentTextColor
                w6Scale = 1.0
                
                //b1Color = contentTextColor
                b1Scale = 1.0
                
                //b2Color = contentTextColor
                b2Scale = 1.0
                
                //b3Color = contentTextColor
                b3Scale = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6) {
            isForwardDisable = false
            isBackDisable = true
            if !isFirstRoundFinished{
                isTrain1Disable = true
                isTrain10Disable = true
            }
           
            
            disableAllButtons = false
            
            //changeTextView.changeText.toggle()
            //NextStepOfText()
            stepIndex = 2
        }
        
        wv1Text = "--"
        wv2Text = "--"
        wv3Text = "--"
        wv4Text = "--"
        wv5Text = "--"
        wv6Text = "--"
        
        s1Text = "--"
        s2Text = "--"
        s3Text = "--"
        f1Text = "--"
        f2Text = "--"
        f3Text = "--"
        
        weightText = "--"
        heightText = "--"
        
        dataDeltaText[0] = "--"
        dataDeltaText[1] = "--"
        dataDeltaText[2] = "--"
        dataDeltaText[3] = "--"
        
        dataResultText[0] = "--"
        dataResultText[1] = "--"
        dataResultText[2] = "--"
        dataResultText[3] = "--"
        
        mseLossText = "--"
        
        dataResult[0] = 0
        dataResult[1] = 0
        dataResult[2] = 0
        dataResult[3] = 0
        
        mseLossBGColor = mainBGColor
        mseLossText = "--"
        
        canTest = false
        
        ResetColorAndScale()
        
        ResetTrainDataRow(index:0)
        ResetTrainDataRow(index:1)
        ResetTrainDataRow(index:2)
        ResetTrainDataRow(index:3)
    }
    
    func ResetColorAndScale() {
        dataToAverageLineColor[0] = mainTextColor
        dataToAverageLineColor[1] = mainTextColor
        dataToAverageLineColor[2] = mainTextColor
        dataToAverageLineColor[3] = mainTextColor
        dataToAverageLineColor[4] = mainTextColor
        dataToAverageLineColor[5] = mainTextColor
        dataToAverageLineColor[6] = mainTextColor
        dataToAverageLineColor[7] = mainTextColor
        dataToAverageLineColor[8] = mainTextColor
        
        dataToAverageLineWidth[0] = 2.0
        dataToAverageLineWidth[1] = 2.0
        dataToAverageLineWidth[2] = 2.0
        dataToAverageLineWidth[3] = 2.0
        dataToAverageLineWidth[4] = 2.0
        dataToAverageLineWidth[5] = 2.0
        dataToAverageLineWidth[6] = 2.0
        dataToAverageLineWidth[7] = 2.0
        dataToAverageLineWidth[8] = 2.0
        
        dataAverageColor = mainBGColor
        averageToWeightColor = mainTextColor
        averageToWeightWidth = 2.0
        averageTextScale = 1.0

        weightText = "--"
        heightText = "--"
        
        weightBGColor = mainBGColor
        heightBGColor = mainBGColor
            
        weightScale = 1.0
        heightScale = 1.0
        
        w1Scale = 1.0
        w2Scale = 1.0
        w3Scale = 1.0
        w4Scale = 1.0
        
        n1wBGColor = neuronBGColorDark
        n2wBGColor = neuronBGColorDark
        
        n1wvBGColor = dataBGColorDark
        n2wvBGColor = dataBGColorDark
        
        n1bBGColor = biasBGColorDark
        n2bBGColor = biasBGColorDark
        n3bBGColor = biasBGColorDark
        
        wv1Text = "--"
        wv2Text = "--"
        wv3Text = "--"
        wv4Text = "--"
        
        wv1Scale = 1.0
        wv2Scale = 1.0
        wv3Scale = 1.0
        wv4Scale = 1.0
        
        weightOutLineColor = mainTextColor
        weightOutLineWidth = 2.0
        
        b1Scale = 1.0
        b2Scale = 1.0
        
        
        s1Text = "--"
        s2Text = "--"
        
        s1Scale = 1.0
        s2Scale = 1.0
        
        n1sBGColor = dataBGColorDark
        n2sBGColor = dataBGColorDark
        
        n1n2SumLineColor = mainTextColor
        n1n2SumLineWidth = 2.0
        
        
        f1Scale = 1.0
        f2Scale = 1.0
        
        f1Text = "--"
        f2Text = "--"
        
        f1Scale = 1.0
        f2Scale = 1.0
        
        n1fBGColor = dataBGColorDark
        n2fBGColor = dataBGColorDark
        
        n1n2FuncLineColor = mainTextColor
        n1n2FuncLineWidth = 2.0
        
        n1n2OutputLineColor = mainTextColor
        n1n2OutputLineWidth = 2.0
        
        n3wBGColor = neuronBGColorDark
        
        wv5Text = "--"
        wv6Text = "--"
        
        wv5Scale = 1.0
        wv6Scale = 1.0
        
        n3wvBGColor = mainBGColor
  
        b3Scale = 1.0
        
        s3Text = "--"
        
        s3Scale = 1.0
        n3sBGColor = dataBGColorDark
        
        n3SumLineColor = mainTextColor
        n3SumLineWidth = 2.0
        
        n3FuncLineColor = mainTextColor
        n3FuncLineWidth = 2.0
        
        f3Scale = 1.0
        
        f3Text = "-"
        
        n3fBGColor = dataBGColorDark
                
        n3OutputLineColor1 = mainTextColor
        n3OutputLineWidth1 = 2.0
        n3OutputLineColor2 = mainTextColor
        n3OutputLineWidth2 = 2.0
        n3OutputLineColor3 = mainTextColor
        n3OutputLineWidth3 = 2.0
        
        backLine01 = mainBGColor
        backLine02 = mainBGColor
        backLine03 = mainBGColor
        
        
    }
    
    func ResetTrainDataRow(index:Int){
        dataRowBGColor[index] = dataBGColorDark
        dataRowScale[index] = 1.0
        
        dataResultText[index] = "--"
        
        dataResultTextScale[index] = 1.0

        
        dataDeltaText[index] = "--"
        
        dataDeltaTextScale[index] = 1.0
        
        dataDeltaBGColor[index] = dataBGColorDark
        
        dataResult[index] = 0
        
    }
    
    func OnFeedForward() async {
        disableAllButtons = true
        let duration = 0.4-0.05*Double(trainDataIndex)
        //let delay = duration * 10 + 2
        
        if trainDataIndex != 4 {
            ResetTrainDataRow(index:trainDataIndex)
        }
        
        ResetColorAndScale()
        
        FeedForward(index:trainDataIndex, duration:duration)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*23) {
            disableAllButtons = false
            
            if isForwardOnly {
                trainDataIndex += 1
                if trainDataIndex == 4 {
                    trainDataIndex = 0
                    roundOfTrain += 1
                    isFirstRoundFinished = true
                }
                isBackDisable = false
                isForwardDisable = true
                
                if(stepIndex == 2) {
                    //changeTextView.changeText.toggle()
                    NextStepOfText()
                    //stepIndex = 3
                }
            }
            else {
                trainDataIndex = 0
                isBackDisable = true
                isForwardDisable = false
            }
            
            
        }
    }
    
    func FeedForward(index:Int,duration:Double) {
        
        print("Duration:"+String(duration))
        
        network.feedforward(index: index)
        
        // Animation of train data row
        if index != 4 {
            withAnimation(.easeInOut(duration: duration)) {
                dataRowBGColor[index] = dataBGColorLight
                dataRowScale[index] = 1.2
            }
        }
        

        // Average box
        DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
            switch index {
            case 0:
                withAnimation(.easeInOut(duration: duration)) {
                    dataToAverageLineColor[0] = forwardStreamColor
                    dataToAverageLineColor[2] = forwardStreamColor
                    dataToAverageLineColor[4] = forwardStreamColor
                    dataToAverageLineColor[6] = forwardStreamColor
                    dataToAverageLineColor[7] = forwardStreamColor
                    
                    dataToAverageLineWidth[0] = 4.0
                    dataToAverageLineWidth[2] = 4.0
                    dataToAverageLineWidth[4] = 4.0
                    dataToAverageLineWidth[6] = 4.0
                    dataToAverageLineWidth[7] = 4.0
                }
            case 1:
                withAnimation(.easeInOut(duration: duration)) {
                    dataToAverageLineColor[1] = forwardStreamColor
                    dataToAverageLineColor[2] = forwardStreamColor
                    dataToAverageLineColor[4] = forwardStreamColor
                    dataToAverageLineColor[6] = forwardStreamColor
                    dataToAverageLineColor[7] = forwardStreamColor
                    
                    dataToAverageLineWidth[1] = 4.0
                    dataToAverageLineWidth[2] = 4.0
                    dataToAverageLineWidth[4] = 4.0
                    dataToAverageLineWidth[6] = 4.0
                    dataToAverageLineWidth[7] = 4.0
                }
            case 2:
                withAnimation(.easeInOut(duration: duration)) {
                    dataToAverageLineColor[3] = forwardStreamColor
                    dataToAverageLineColor[4] = forwardStreamColor
                    dataToAverageLineColor[6] = forwardStreamColor
                    dataToAverageLineColor[7] = forwardStreamColor
                    
                    dataToAverageLineWidth[3] = 4.0
                    dataToAverageLineWidth[4] = 4.0
                    dataToAverageLineWidth[6] = 4.0
                    dataToAverageLineWidth[7] = 4.0
                }
            case 3:
                withAnimation(.easeInOut(duration: duration)) {
                    dataToAverageLineColor[5] = forwardStreamColor
                    dataToAverageLineColor[6] = forwardStreamColor
                    dataToAverageLineColor[7] = forwardStreamColor
                    
                    dataToAverageLineWidth[5] = 4.0
                    dataToAverageLineWidth[6] = 4.0
                    dataToAverageLineWidth[7] = 4.0
                }
                
            case 4:
                withAnimation(.easeInOut(duration: duration)) {
                    dataToAverageLineColor[7] = forwardStreamColor
                    dataToAverageLineColor[8] = forwardStreamColor
                    
                    dataToAverageLineWidth[7] = 4.0
                    dataToAverageLineWidth[8] = 4.0
                }
            default:
                dataToAverageLineColor[0] = Color.blue
            }
        }

        // Average box
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*2) {
            withAnimation(.easeInOut(duration: duration)) {
                dataAverageColor = dataBGColorLight
                averageTextScale = 1.2
            }
        }
        
        // Average box
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*3) {
            withAnimation(.easeInOut(duration: duration)) {
                averageToWeightColor = forwardStreamColor
                averageToWeightWidth = 4.0
            }
        }
        
        // Result of weight
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*4) {
            
            weightText = FormatNumber(number:network.trainData[index][0])
            heightText = FormatNumber(number:network.trainData[index][1])
            withAnimation(.easeInOut(duration: duration)) {
                weightBGColor = dataBGColorLight
                heightBGColor = dataBGColorLight
                
                weightScale = 1.2
                heightScale = 1.2
            }
        }
        
        
        // Result of N1 N2 multi
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*5) {
            withAnimation(.easeInOut(duration: duration)) {
                weightOutLineColor = forwardStreamColor
                
                weightOutLineWidth = 4.0
            }
        }
        
        // Result of N1 N2 multi
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*6) {
            withAnimation(.easeInOut(duration: duration)) {
                
                w1Scale = 1.2
                w2Scale = 1.2
                w3Scale = 1.2
                w4Scale = 1.2
                
            }
        }
        
        // Result of N1 N2 multi
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*7) {
            withAnimation(.easeInOut(duration: duration)) {
               
                n1wBGColor = neuronBGColorLight
                n2wBGColor = neuronBGColorLight
                
                n1wvBGColor = dataBGColorLight
                n2wvBGColor = dataBGColorLight
                
                wv1Color = mainTextColor
                wv2Color = mainTextColor
                
                
                wv1Text = FormatNumber(number:network.wv1)
                wv2Text = FormatNumber(number:network.wv2)
                wv3Text = FormatNumber(number:network.wv3)
                wv4Text = FormatNumber(number:network.wv4)
                
                wv1Scale = 1.2
                wv2Scale = 1.2
                wv3Scale = 1.2
                wv4Scale = 1.2
            }
        }
        
        // Result of N1 N2 sum
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*8) {
            withAnimation(.easeInOut(duration: duration)) {
                
                b1Scale = 1.2
                b2Scale = 1.2
                
                n1n2SumLineColor = forwardStreamColor
                
                n1n2SumLineWidth = 4.0
            }
        }
        
        // Result of N1 N2 sum
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*9) {
            withAnimation(.easeInOut(duration: duration)) {
                
                s1Text = FormatNumber(number:network.sum_n1)
                s2Text = FormatNumber(number:network.sum_n2)
                
                s1Scale = 1.2
                s2Scale = 1.2
                
                n1sBGColor = dataBGColorLight
                n2sBGColor = dataBGColorLight
                
            }
        }
        
        // Result of N1 N2 func
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*10) {
            withAnimation(.easeInOut(duration: duration)) {
                
                n1n2FuncLineColor = forwardStreamColor
                
                n1n2FuncLineWidth = 4.0
            }
        }
        
        // Result of N1 N2 func
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*12) {
            withAnimation(.easeInOut(duration: duration)) {
                
                f1Text = FormatNumber(number:network.no1)
                f2Text = FormatNumber(number:network.no2)
                
                f1Scale = 1.2
                f2Scale = 1.2
                
                n1fBGColor = dataBGColorLight
                n2fBGColor = dataBGColorLight
                
            }
        }
        
        // Result of N1 N2 output
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*13) {
            withAnimation(.easeInOut(duration: duration)) {
                
                n1n2OutputLineColor = forwardStreamColor
                
                n1n2OutputLineWidth = 4.0
                
                w5Scale = 1.2
                w6Scale = 1.2
                
            }
        }
        
        // Result of N1 N2 output
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*14) {
            withAnimation(.easeInOut(duration: duration)) {
                
                n3wBGColor = neuronBGColorLight
                
                wv5Text = FormatNumber(number:network.wv5)
                wv6Text = FormatNumber(number:network.wv6)
                
                wv5Scale = 1.2
                wv6Scale = 1.2
                
                n3wvBGColor = dataBGColorLight
            }
        }
        
        // Result of N3 Sum
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*15) {
            withAnimation(.easeInOut(duration: duration)) {
                
                b3Scale = 1.2
                b3Color = biasBGColorLight
                
                n3SumLineColor = forwardStreamColor
                
                n3SumLineWidth = 4.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*16) {
            withAnimation(.easeInOut(duration: duration)) {
                
                s3Text = FormatNumber(number:network.sum_n3)
                
                s3Scale = 1.2
                n3sBGColor = dataBGColorLight
                
            }
        }
        
        // Result of N3 Sum
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*17) {
            withAnimation(.easeInOut(duration: duration)) {
                
                
                n3FuncLineColor = forwardStreamColor
                
                n3FuncLineWidth = 4.0
            }
        }
        
        // Result of N3 Sum
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*19) {
            withAnimation(.easeInOut(duration: duration)) {
                
                f3Scale = 1.2
                
                f3Text = FormatNumber(number:network.no3)
                
                n3fBGColor = dataBGColorLight
                
                //n1n2FuncLineColor = forwardStreamColor
            }
        }
        
        if(trainDataIndex != 4){
            // Result of train data
            DispatchQueue.main.asyncAfter(deadline: .now()+duration*20) {
                withAnimation(.easeInOut(duration: duration)) {
                    n3OutputLineColor1 = forwardStreamColor
                    n3OutputLineWidth1 = 4.0
                    
                    n3OutputLineColor2 = forwardStreamColor
                    n3OutputLineWidth2 = 4.0
                    
                    dataResultText[index] = FormatNumber(number:network.no3)
                    
                    dataResultTextScale[index] = 1.2
                }
            }
            
            // Delta of train data
            DispatchQueue.main.asyncAfter(deadline: .now()+duration*21) {
                withAnimation(.easeInOut(duration: duration)) {
                    
                    dataDeltaText[index] = FormatNumber(number:network.reulstDelta[index])
                    
                    dataDeltaTextScale[index] = 1.2
                    
                    dataDeltaBGColor[index] = Color(red: 0.4+0.4*network.reulstDelta[index], green: 0.8-0.6*network.reulstDelta[index], blue: 0.4)
                    /*
                    if(network.reulstDelta[index]<0.5){
                        dataResult[index] = 1
                    }
                    else {
                        dataResult[index] = 2
                    }*/
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+duration*22) {
                if(index == 3){
                    withAnimation(.easeInOut(duration: duration)) {
                        network.calMseLoss()
                        UpdateMse()
                    }
                    
                    if(stepIndex==4){
                        //changeTextView.changeText.toggle()
                        NextStepOfText()
                        //stepIndex = 5
                    }
                    
                    isTrain1Disable = false
                    isTrain10Disable = false
                    
                }
                playSound(filename:"Coin")
            }
        }
        else {
            // Test result
            DispatchQueue.main.asyncAfter(deadline: .now()+duration*20) {
                withAnimation(.easeInOut(duration: duration)) {
                    n3OutputLineColor1 = forwardStreamColor
                    n3OutputLineWidth1 = 4.0
                    
                    n3OutputLineColor3 = forwardStreamColor
                    n3OutputLineWidth3 = 4.0
                    
                }
            }
            
            // Delta of train data
            DispatchQueue.main.asyncAfter(deadline: .now()+duration*21) {
                withAnimation(.easeInOut(duration: duration)) {
                    
                    if network.no3>0.5 {
                        testResult = "Female"
                    }
                    else {
                        testResult = "Male"
                    }
                    testResultScale = 1.2
                    
                    isBackDisable = true
                    isForwardDisable = false
                    
                    trainDataIndex = 0
                    
                    if(stepIndex==6){
                        NextStepOfText()
                    }
                }
                playSound(filename:"Coin")
            }
            
        }
    }
    
    func UpdateMse() {
        mseLossText = FormatNumber(number:network.mseLoss)
        mseLossBGColor = Color(red: 0.4+0.4*network.mseLoss, green: 1.0-0.4*network.mseLoss, blue: 0.4)
        
        if(network.mseLoss<0.05){
            if(!canTest) {
                canTest = true
                //changeTextView.changeText.toggle()
                stepIndex = 6
            }
        }
    }
    
    func OnBackPropagation() async {
        
        isBackDisable = true
        
        var index = trainDataIndex - 1
        let duration = 0.5 - 0.1*Double(index)
        if(index == -1){
            index = 3
        }
        network.Backpropagation(index: index)
        
        withAnimation(.easeInOut(duration: duration)) {
            
            dataDeltaBGColor[index] = dataBGColorLight
            dataResult[index] = 0
        }
    
    
        DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
            withAnimation(.easeInOut(duration: duration)) {
                backLine01 = .red
                w5Text = FormatNumber(number:network.w5)
                w6Text = FormatNumber(number:network.w6)
                b3Text = FormatNumber(number:network.b3)
                
                n3wBGColor = .red
                n3bBGColor = .red
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*2) {
            withAnimation(.easeInOut(duration: duration)) {
                backLine02 = .red
                backLine03 = .red
                w1Text = FormatNumber(number:network.w1)
                w2Text = FormatNumber(number:network.w2)
                b1Text = FormatNumber(number:network.b1)
                w3Text = FormatNumber(number:network.w3)
                w4Text = FormatNumber(number:network.w4)
                b2Text = FormatNumber(number:network.b2)
                
                n1wBGColor = .red
                n1bBGColor = .red
                
                n2wBGColor = .red
                n2bBGColor = .red
            }
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*3) {
            if(stepIndex == 3) {
                //changeTextView.changeText.toggle()
                NextStepOfText()
                //stepIndex = 4
            }
            
            isForwardDisable = false
        }
    }
    
    func OnTrain1() async {
        
        ResetColorAndScale()
        ResetTrainDataRow(index:0)
        ResetTrainDataRow(index:1)
        ResetTrainDataRow(index:2)
        ResetTrainDataRow(index:3)
        
        network.trainOnce()
        network.calMseLoss()
        
        w1Text = FormatNumber(number:network.w1)
        w2Text = FormatNumber(number:network.w2)
        w3Text = FormatNumber(number:network.w3)
        w4Text = FormatNumber(number:network.w4)
        w5Text = FormatNumber(number:network.w5)
        w6Text = FormatNumber(number:network.w6)
        
        b1Text = FormatNumber(number:network.b1)
        b2Text = FormatNumber(number:network.b2)
        b3Text = FormatNumber(number:network.b3)
        
        weightText = FormatNumber(number:network.trainData[3][0])
        heightText = FormatNumber(number:network.trainData[3][1])
        
        wv1Text = FormatNumber(number:network.wv1)
        wv2Text = FormatNumber(number:network.wv2)
        wv3Text = FormatNumber(number:network.wv3)
        wv4Text = FormatNumber(number:network.wv4)
        
        s1Text = FormatNumber(number:network.sum_n1)
        s2Text = FormatNumber(number:network.sum_n2)
        
        f1Text = FormatNumber(number:network.no1)
        f2Text = FormatNumber(number:network.no2)
        
        wv5Text = FormatNumber(number:network.wv5)
        wv6Text = FormatNumber(number:network.wv6)
        
        s3Text = FormatNumber(number:network.sum_n3)
        
        f3Text = FormatNumber(number:network.no3)
        
        for i in 0...3 {
            dataResultText[i] = FormatNumber(number:network.feedForwardResult[i])
            dataDeltaText[i] = FormatNumber(number:network.reulstDelta[i])
            dataDeltaBGColor[i] = Color(red: 0.4+0.4*network.reulstDelta[i], green: 0.8-0.6*network.reulstDelta[i], blue: 0.4)
            /*
            if(network.reulstDelta[i]<0.5){
                dataResult[i] = 1
            }
            else {
                dataResult[i] = 2
            }*/
        }
        
        UpdateMse()
        
        disableAllButtons = false
    }
    
    
    func OnTrain10() async {
        
        ResetColorAndScale()
        ResetTrainDataRow(index:0)
        ResetTrainDataRow(index:1)
        ResetTrainDataRow(index:2)
        ResetTrainDataRow(index:3)
        
        network.train(epochs: 10)
        network.calMseLoss()
        
        w1Text = FormatNumber(number:network.w1)
        w2Text = FormatNumber(number:network.w2)
        w3Text = FormatNumber(number:network.w3)
        w4Text = FormatNumber(number:network.w4)
        w5Text = FormatNumber(number:network.w5)
        w6Text = FormatNumber(number:network.w6)
        
        b1Text = FormatNumber(number:network.b1)
        b2Text = FormatNumber(number:network.b2)
        b3Text = FormatNumber(number:network.b3)
        
        weightText = FormatNumber(number:network.trainData[3][0])
        heightText = FormatNumber(number:network.trainData[3][1])
        
        wv1Text = FormatNumber(number:network.wv1)
        wv2Text = FormatNumber(number:network.wv2)
        wv3Text = FormatNumber(number:network.wv3)
        wv4Text = FormatNumber(number:network.wv4)
        
        s1Text = FormatNumber(number:network.sum_n1)
        s2Text = FormatNumber(number:network.sum_n2)
        
        f1Text = FormatNumber(number:network.no1)
        f2Text = FormatNumber(number:network.no2)
        
        wv5Text = FormatNumber(number:network.wv5)
        wv6Text = FormatNumber(number:network.wv6)
        
        s3Text = FormatNumber(number:network.sum_n3)
        
        f3Text = FormatNumber(number:network.no3)
        
        for i in 0...3 {
            dataResultText[i] = FormatNumber(number:network.feedForwardResult[i])
            dataDeltaText[i] = FormatNumber(number:network.reulstDelta[i])
            dataDeltaBGColor[i] = Color(red: 0.4+0.4*network.reulstDelta[i], green: 0.8-0.6*network.reulstDelta[i], blue: 0.4)
            /*
            if(network.reulstDelta[i]<0.5){
                dataResult[i] = 1
            }
            else {
                dataResult[i] = 2
            }*/
        }
        
        UpdateMse()
        
        disableAllButtons = false
    }
    
    
    
    func OnTest() async {
        network.trainData[4][0] = Double(testWeight)!-145
        network.trainData[4][1] = Double(testHeight)!-66
        
        trainDataIndex = 4
        
        await OnFeedForward()
    }
    
    func NextStepOfText() {
        print("NextStep:"+String(stepIndex))
        if(stepIndex<7){
            stepIndex += 1
        }
        
        if(stepIndex==1){
            disableAllButtons = false
        }
    }
}

