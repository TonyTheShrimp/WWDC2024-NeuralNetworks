//
//  InfoView.swift
//  AI Neural Network
//
//  Created by Wentao Ma on 2024/2/21.
//

import SwiftUI

struct InfoView: View {
    @Binding var pageIndex: Int
    
    @State var showPage = false
    @State var showAnimation = true
    @State var hideAnimation1 = true
    @State var hideAnimation2 = true
    @State var boxZoomAnimation = true
    
    
    @State var stepIndex = 0
    
    @State private var nextPageIndex = 0
    @State private var nextStepIndex = 0
    
    @State var textHide = true
    @State private var tapTextOpacity = 0.0
    
    @State private var textOpacity = 1.0
    
    @State private var showArtificialNeuron = false
    
    let Step_Neuron = 0
    let Step_A_Neuron = 1
    let Step_Weight = 2
    let Step_Bias = 3
    let Step_ANN = 4
    let Step_Input = 5
    let Step_Hidden = 6
    let Step_Output = 7
     
    let aniViewHeight = [0.75, 0.75]
    let contentViewPosY = [0.875, 0.875]
    
    let NeuronImageInitialSize = [[0.72, 0.9],[0.72,0.8]]
    let NeuronImageEndSize = [[0.72, 0.25],[0.72,0.25]]
    let NeuronImageInitialPosY = [0.45,0.45]
    let NeuronImageEndPosY = [0.15,0.15]
    
    let NeuronTextInitialPosY = [0.88,0.88]
    let NeuronTextEndPosY = [0.27,0.27]
    
    var body: some View {
        ZStack {
            Button(action: {
                print("屏幕任何地方被点击")
                OnScreenTapped()
            }) {
                // 使用透明色填充整个屏幕，使其可点击
                Color.clear
                    .edgesIgnoringSafeArea(.all) // 忽略安全区域，填充整个屏幕
            }
            
            GeometryReader { geometryView in
                let viewDir = geometryView.size.width>geometryView.size.height ? 0 : 1
                
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        let wPosX = geometry.size.width*0.36
                        let neuronBoxWidth = geometry.size.width/6
                        let neuronBoxHeight = geometry.size.height/18
                        
                        // W1 ----------------------------
                        let w1PosY =  geometry.size.height*0.375
                        let wDeltaY = geometry.size.height*0.095
                        let wnPosY = w1PosY + 3*wDeltaY
                        
                        if(stepIndex == Step_Neuron ){
                            ZStack{
                                Image( "Neuron") // Placeholder image, replace with your own
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width*NeuronImageInitialSize[viewDir][0], height: showArtificialNeuron ?  geometry.size.height*NeuronImageEndSize[viewDir][1] :geometry.size.height*NeuronImageInitialSize[viewDir][1] )
                                    .position(x: geometry.size.width/2, y:  showArtificialNeuron ? geometry.size.height*NeuronImageEndPosY[viewDir] : geometry.size.height*NeuronImageInitialPosY[viewDir])
                                Text("Neuron")
                                    .position(x: geometry.size.width/2, y: showArtificialNeuron ? geometry.size.height*NeuronTextEndPosY[viewDir] : geometry.size.height*NeuronTextInitialPosY[viewDir] )
                                    .font(.system(size: min(geometry.size.height / 10, 48)))
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                            }
                            .opacity(showAnimation&&hideAnimation1 ? 1.0 : 0.0)
                        }
                        
                        let neuronTextFontSize = min(geometry.size.height / 32, 24)
                        
                        if(stepIndex>Step_Neuron&&stepIndex<=Step_Bias){
                            
                            ZStack{
                                ZStack{
                                    // Box of neuron ----------------------------
                                    Path { path in
                                        let rect = CGRect(x: geometry.size.width/4, y: geometry.size.height*0.3, width: geometry.size.width/2, height: geometry.size.height*0.56)
                                        path.addRect(rect)
                                    }
                                    .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 5]))
                                    .foregroundColor(.blue)
                                    
                                    Text("Artificial Neuron")
                                        .position(x: geometry.size.width/2, y: geometry.size.height*19/20)
                                        .font(.system(size: min(geometry.size.height / 10, 48)))
                                        .foregroundColor(.blue)
                                        .fontWeight(.bold)
                                    
                                }
                                .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                                
                                ZStack{
                                    Rectangle() // 创建一个矩形
                                        .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                        .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                                        .position(x: wPosX, y: w1PosY)
                                    
                                    Path { path in
                                        let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: w1PosY-neuronBoxHeight/2, width: neuronBoxWidth, height: neuronBoxHeight)
                                        path.addRect(rect)
                                    } // 设置矩形的尺寸
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    Text("Weight 1")
                                        .position(x: wPosX, y: w1PosY)
                                        .font(.system(size: neuronTextFontSize))
                                        .foregroundColor(neuronTextColor)
                                    
                                    Path { path in
                                        path.move(to: CGPoint(x: geometry.size.width/8, y: w1PosY))
                                        path.addLine(to: CGPoint(x: geometry.size.width*0.27, y: w1PosY))
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    // Weight 2
                                    Rectangle() // 创建一个矩形
                                        .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                        .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                                        .position(x: wPosX, y: w1PosY+wDeltaY)
                                    
                                    Path { path in
                                        let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: w1PosY-neuronBoxHeight/2+wDeltaY, width: neuronBoxWidth, height: neuronBoxHeight)
                                        path.addRect(rect)
                                    } // 设置矩形的尺寸
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    Text("Weight 2")
                                        .position(x: wPosX, y: w1PosY+wDeltaY)
                                        .font(.system(size: neuronTextFontSize))
                                        .foregroundColor(neuronTextColor)
                                    
                                    Path { path in
                                        path.move(to: CGPoint(x: geometry.size.width/8, y: w1PosY+wDeltaY))
                                        path.addLine(to: CGPoint(x: geometry.size.width*0.27, y: w1PosY+wDeltaY))
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    // Wn ----------------------------
                                    
                                    Rectangle() // 创建一个矩形
                                        .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                        .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                                        .position(x: wPosX, y: wnPosY)
                                    
                                    Path { path in
                                        let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: wnPosY-neuronBoxHeight/2, width: neuronBoxWidth, height: neuronBoxHeight)
                                        path.addRect(rect)
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    Text("Weight N")
                                        .position(x: wPosX, y: wnPosY)
                                        .font(.system(size: neuronTextFontSize))
                                        .foregroundColor(neuronTextColor)
                                    
                                    Path { path in
                                        path.move(to: CGPoint(x: geometry.size.width/8, y: wnPosY))
                                        path.addLine(to: CGPoint(x: geometry.size.width*0.27, y: wnPosY))
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    // Line between W1 and Wn ----------------------------
                                    Path { path in
                                        path.move(to: CGPoint(x: geometry.size.width*0.34, y: w1PosY+geometry.size.height/24+wDeltaY))
                                        path.addLine(to: CGPoint(x: geometry.size.width*0.34, y: wnPosY-geometry.size.height/24))
                                    }
                                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                                    .foregroundColor(mainTextColor)
                                }
                                .opacity((stepIndex>Step_Weight)||((Step_Weight==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                                
                                ZStack{
                                    if(stepIndex>2){
                                        // Bias ----------------------------
                                        let biasPosY =  geometry.size.height*12/16
                                        Rectangle() // 创建一个矩形
                                            .fill(biasBGColorDark)
                                            .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                                            .position(x: wPosX, y: biasPosY)
                                        
                                        
                                        Path { path in
                                            let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: biasPosY-neuronBoxHeight/2, width: neuronBoxWidth, height: neuronBoxHeight)
                                            path.addRect(rect)
                                        }
                                        .stroke(neuronBorderColor, lineWidth: 2)
                                        
                                        Text("Bias")
                                            .position(x: wPosX, y: biasPosY)
                                            .font(.system(size: neuronTextFontSize))
                                            .foregroundColor(neuronTextColor)
                                        
                                        Image( "plusIcon") // Placeholder image, replace with your own
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(mainTextColor)
                                            .frame(width: geometry.size.width*1/20, height: geometry.size.width/20)
                                            .position(x: geometry.size.width*9/16, y:  w1PosY+2*wDeltaY)
                                        
                                        Image( "funcIcon") // Placeholder image, replace with your own
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundColor(mainTextColor)
                                            .frame(width: geometry.size.width*1/16, height: geometry.size.width/16)
                                            .position(x: geometry.size.width*11/16, y:  w1PosY+2*wDeltaY)
                                        
                                        Path { path in
                                            path.move(to: CGPoint(x:wPosX+neuronBoxWidth*0.55, y: w1PosY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: w1PosY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: w1PosY+2*wDeltaY-neuronBoxHeight*0.7))
                                            
                                            path.move(to: CGPoint(x:wPosX+neuronBoxWidth*0.55, y: biasPosY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: biasPosY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: w1PosY+2*wDeltaY+neuronBoxHeight*0.7))
                                            
                                            path.move(to: CGPoint(x:wPosX+neuronBoxWidth*0.55, y: wnPosY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*9.0/16, y: wnPosY))
                                            
                                            path.move(to: CGPoint(x:geometry.size.width*9/16+neuronBoxHeight*0.7, y: w1PosY+2*wDeltaY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*11.0/16-neuronBoxHeight*0.8, y: w1PosY+2*wDeltaY))
                                            
                                            path.move(to: CGPoint(x:geometry.size.width*11/16+neuronBoxHeight*0.8, y: w1PosY+2*wDeltaY))
                                            path.addLine(to: CGPoint(x: geometry.size.width*14.5/16, y: w1PosY+2*wDeltaY))
                                            
                                        }
                                        .stroke(neuronBorderColor, lineWidth: 2)
                                        .foregroundColor(mainTextColor)
                                        
                                        Text("Output = F(X1W1+...+XnWn+Bias)")
                                            .position(x: geometry.size.width*0.5, y: w1PosY-wDeltaY*1.5)
                                            .font(.system(size: min(geometry.size.height / 14, 24)))
                                            .foregroundColor(mainTextColor)
                                    }
                                }
                                .opacity((stepIndex>Step_Bias)||((Step_Bias==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                            }
                            .opacity(hideAnimation2 ? 1.0 : 0.0)
                            
                            
                            Rectangle()
                                .fill(neuronBGColorDark)
                                .frame(width:geometry.size.width/2, height: geometry.size.height*0.56)
                                .position(x: geometry.size.width/2, y: geometry.size.height*0.58)
                                .opacity(hideAnimation2 ? 0.0 : 1.0)
                            
                            Path { path in
                                let rect = CGRect(x: geometry.size.width/4, y: geometry.size.height*0.3, width: geometry.size.width/2, height: geometry.size.height*0.56)
                                path.addRect(rect)
                            }
                            .stroke(neuronBorderColor, lineWidth: 2)
                            .opacity(hideAnimation2 ? 0.0 : 1.0)
                        }
                        
                        let neuronCellWidth = geometry.size.width/12
                        let neuronCellHeight = geometry.size.height/18
                        let neuronCellTextSize = min (geometry.size.height/24, 16)
                        let neuronX1 = geometry.size.width*0.3
                        let neuronX2 = geometry.size.width*0.47
                        let neuronX3 = geometry.size.width*0.72
                        let neuronX4 = geometry.size.width*0.88
                        let neuronIndex = [0, 1, 2, 3, 4]
                        let neuronY = [11.0, 14.0, 17.0, 20.0, 25.0]
                        let neuronName = ["1","2","3","4","m"]
                        let neuronLineColor = [Color.red, Color.green, Color.orange, Color.cyan, Color.purple, Color.brown]
                        let neuronIndex2 = [0, 1, 2, 3, 4, 5]
                        let neuronY2 = [10.0, 12.5, 15.0, 17.5, 20.0, 25.5]
                        let neuronName2 = ["1","2","3","4","5","k"]
                        let neuronIndex3 = [0, 1, 2]
                        let neuronY3 = [12.0, 17.0, 24.0]
                        let neuronName3 = ["1","2","p"]
                        let pathX1 = geometry.size.width*0.125
                        let pathX2 = geometry.size.width*0.258
                        let pathX3 = geometry.size.width*0.342
                        let pathX4 = geometry.size.width*0.428
                        let pathX5 = geometry.size.width*0.512
                        let pathX6 = geometry.size.width*0.678
                        let pathX7 = geometry.size.width*0.762
                        let pathX8 = geometry.size.width*0.838
                        let neuronIndex4 = [0, 1]
                        let neuronY4 = [15.0, 19.0]
                        let neuronName4 = ["1","p"]
                        
                        let x1PosY =  w1PosY
                        let x2PosY =  w1PosY+wDeltaY
                        let x3PosY =  w1PosY+wDeltaY*3
                        
                        
                        if(stepIndex>=Step_ANN){
                            Rectangle()
                                .fill(neuronBGColorDark)
                                .frame(width: boxZoomAnimation ? geometry.size.width/2 : neuronCellWidth, height: boxZoomAnimation ?  geometry.size.height*0.56 : neuronCellHeight)
                                .position(x: boxZoomAnimation ? geometry.size.width/2 : neuronX1, y: boxZoomAnimation ? geometry.size.height*0.58 : geometry.size.height*neuronY[0]/32.0)
                            
                            ZStack{
                                Text("Artificial Neural Network")
                                    .position(x: geometry.size.width/2, y: geometry.size.height*19/20)
                                    .font(.system(size: min(geometry.size.height / 10, 48)))
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                
                                //  output --------------------------
                                Text("Hidden")
                                    .position(x: geometry.size.width/2, y: geometry.size.height*0.15)
                                    .font(.system(size: min(geometry.size.height / 14, 24)))
                                    .foregroundColor(mainTextColor)
                            }
                            .opacity(boxZoomAnimation ? 0.0 : 1.0)
                            
                            Text("Neuron 1")
                                .position(x: neuronX1, y:  geometry.size.height*neuronY[0]/32.0)
                                .font(.system(size: neuronCellTextSize))
                                .foregroundColor(neuronTextColor)
                                .opacity(stepIndex>Step_ANN||(stepIndex==Step_ANN&&showAnimation) ? 1.0 : 0.0)
                        }
                         
                        if(stepIndex>=Step_Input){
                            Path { path in
                                path.move(to: CGPoint(x: pathX1, y: x1PosY))
                                path.addLine(to: CGPoint(x: pathX2, y: geometry.size.height*neuronY[0]/32.0))
                                
                                path.move(to: CGPoint(x: pathX1, y: x2PosY))
                                path.addLine(to: CGPoint(x: pathX2, y: geometry.size.height*neuronY[0]/32.0))
                                
                                path.move(to: CGPoint(x: pathX1, y: x3PosY))
                                path.addLine(to: CGPoint(x: pathX2, y: geometry.size.height*neuronY[0]/32.0))
                            }
                            .stroke(neuronLineColor[0], lineWidth: 2)
                            .opacity(stepIndex>Step_Input||(stepIndex==Step_Input&&showAnimation) ? 1.0 : 0.0)
                            
                        }
                         
                        if(stepIndex>=Step_Hidden){
                            ZStack{
                                Text("Layer1")
                                    .position(x: neuronX1, y: geometry.size.height*7/32)
                                    .font(.system(size: neuronCellTextSize))
                                    .foregroundColor(mainTextColor)
                                
                                ForEach(neuronIndex, id: \.self) { index in
                                    let y = geometry.size.height*neuronY[index]/32
                                    // Neuron
                                    Rectangle() // 创建一个矩形
                                        .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                        .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                                        .position(x: neuronX1, y: y)
                                    
                                    Path { path in
                                        let rect = CGRect(x: neuronX1-neuronCellWidth/2, y: y-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                                        path.addRect(rect)
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    Text("Neuron "+neuronName[index])
                                        .position(x: neuronX1, y: y)
                                        .font(.system(size: neuronCellTextSize))
                                        .foregroundColor(neuronTextColor)
                                    
                                    Path { path in
                                        path.move(to: CGPoint(x: pathX1, y: x1PosY))
                                        path.addLine(to: CGPoint(x: pathX2, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX1, y: x2PosY))
                                        path.addLine(to: CGPoint(x: pathX2, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX1, y: x3PosY))
                                        path.addLine(to: CGPoint(x: pathX2, y: y))
                                    }
                                    .stroke(neuronLineColor[index], lineWidth: 2)
                                    .foregroundColor(.blue)
                                }
                                
                                
                                
                                Text("Layer2")
                                    .position(x: neuronX2, y: geometry.size.height*7/32)
                                    .font(.system(size: neuronCellTextSize))
                                    .foregroundColor(mainTextColor)
                                
                                ForEach(neuronIndex2, id: \.self) { index in
                                    let y = geometry.size.height*neuronY2[index]/32
                                    // Neuron
                                    Rectangle() // 创建一个矩形
                                        .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                        .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                                        .position(x: neuronX2, y: y)
                                    
                                    Path { path in
                                        let rect = CGRect(x: neuronX2-neuronCellWidth/2, y: y-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                                        path.addRect(rect)
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    Text("Neuron "+neuronName2[index])
                                        .position(x: neuronX2, y: y)
                                        .font(.system(size: neuronCellTextSize))
                                        .foregroundColor(neuronTextColor)
                                    
                                    Path { path in
                                        path.move(to: CGPoint(x: pathX3, y: geometry.size.height*neuronY[0]/32))
                                        path.addLine(to: CGPoint(x: pathX4, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX3, y: geometry.size.height*neuronY[1]/32))
                                        path.addLine(to: CGPoint(x: pathX4, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX3, y: geometry.size.height*neuronY[2]/32))
                                        path.addLine(to: CGPoint(x: pathX4, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX3, y: geometry.size.height*neuronY[3]/32))
                                        path.addLine(to: CGPoint(x: pathX4, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX3, y: geometry.size.height*neuronY[4]/32))
                                        path.addLine(to: CGPoint(x: pathX4, y: y))
                                    }
                                    .stroke(neuronLineColor[5-index], lineWidth: 2)
                                    .foregroundColor(.blue)
                                }
                                
                                // Line between X3 and Xn ----------------------------
                                Path { path in
                                    path.move(to: CGPoint(x: neuronX2, y: geometry.size.height*neuronY2[4]/32+geometry.size.height/24))
                                    path.addLine(to: CGPoint(x: neuronX2, y: geometry.size.height*neuronY2[5]/32-geometry.size.height/24))
                                }
                                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                                .foregroundColor(mainTextColor)
                                
                                Text("Layer n")
                                    .position(x: neuronX3, y: geometry.size.height*7/32)
                                    .font(.system(size: neuronCellTextSize))
                                    .foregroundColor(mainTextColor)
                                
                                ForEach(neuronIndex3, id: \.self) { index in
                                    let y = geometry.size.height*neuronY3[index]/32
                                    // Neuron
                                    Rectangle() // 创建一个矩形
                                        .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                        .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                                        .position(x: neuronX3, y: y)
                                    
                                    Path { path in
                                        let rect = CGRect(x: neuronX3-neuronCellWidth/2, y: y-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                                        path.addRect(rect)
                                    }
                                    .stroke(neuronBorderColor, lineWidth: 2)
                                    .foregroundColor(.blue)
                                    
                                    Text("Neuron "+neuronName3[index])
                                        .position(x: neuronX3, y: y)
                                        .font(.system(size: neuronCellTextSize))
                                        .foregroundColor(neuronTextColor)
                                    
                                    Path { path in
                                        path.move(to: CGPoint(x: pathX5, y: geometry.size.height*neuronY2[0]/32))
                                        path.addLine(to: CGPoint(x: pathX6, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX5, y: geometry.size.height*neuronY2[1]/32))
                                        path.addLine(to: CGPoint(x: pathX6, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX5, y: geometry.size.height*neuronY2[2]/32))
                                        path.addLine(to: CGPoint(x: pathX6, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX5, y: geometry.size.height*neuronY2[3]/32))
                                        path.addLine(to: CGPoint(x: pathX6, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX5, y: geometry.size.height*neuronY2[4]/32))
                                        path.addLine(to: CGPoint(x: pathX6, y: y))
                                        
                                        path.move(to: CGPoint(x: pathX5, y: geometry.size.height*neuronY2[5]/32))
                                        path.addLine(to: CGPoint(x: pathX6, y: y))
                                    }
                                    .stroke(neuronLineColor[index], lineWidth: 2)
                                    .foregroundColor(.blue)
                                }
                                
                                // Line between X3 and Xn ----------------------------
                                Path { path in
                                    path.move(to: CGPoint(x: neuronX3, y: geometry.size.height*neuronY3[1]/32+geometry.size.height/24))
                                    path.addLine(to: CGPoint(x: neuronX3, y: geometry.size.height*neuronY3[2]/32-geometry.size.height/24))
                                }
                                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                                .foregroundColor(mainTextColor)
                            }
                            .opacity(stepIndex>Step_Hidden||(stepIndex==Step_Hidden&&showAnimation) ? 1.0 : 0.0)
                            
                            if(stepIndex==Step_Output){
                                ZStack{
                                    ForEach(neuronIndex4, id: \.self) { index in
                                        let y = geometry.size.height*neuronY4[index]/32
                                        // Neuron
                                        Rectangle() // 创建一个矩形
                                            .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                            .frame(width: neuronCellWidth, height: neuronCellHeight) // 设置矩形的尺寸
                                            .position(x: neuronX4, y: y)
                                        
                                        Path { path in
                                            let rect = CGRect(x: neuronX4-neuronCellWidth/2, y: y-neuronCellHeight/2, width: neuronCellWidth, height: neuronCellHeight)
                                            path.addRect(rect)
                                        }
                                        .stroke(neuronBorderColor, lineWidth: 2)
                                        .foregroundColor(.blue)
                                        
                                        Text("Neuron "+neuronName4[index])
                                            .position(x: neuronX4, y: y)
                                            .font(.system(size: neuronCellTextSize))
                                            .foregroundColor(neuronTextColor)
                                        
                                        Path { path in
                                            path.move(to: CGPoint(x: pathX7, y: geometry.size.height*neuronY3[0]/32))
                                            path.addLine(to: CGPoint(x: pathX8, y: y))
                                            
                                            path.move(to: CGPoint(x: pathX7, y: geometry.size.height*neuronY3[1]/32))
                                            path.addLine(to: CGPoint(x: pathX8, y: y))
                                            
                                            path.move(to: CGPoint(x: pathX7, y: geometry.size.height*neuronY3[2]/32))
                                            path.addLine(to: CGPoint(x: pathX8, y: y))
                                        }
                                        .stroke(mainTextColor, lineWidth: 2)
                                        .foregroundColor(.blue)
                                    }
                                    
                                    // Line between X3 and Xn ----------------------------
                                    Path { path in
                                        path.move(to: CGPoint(x: neuronX4, y: geometry.size.height*neuronY4[0]/32+geometry.size.height/24))
                                        path.addLine(to: CGPoint(x: neuronX4, y: geometry.size.height*neuronY4[1]/32-geometry.size.height/24))
                                    }
                                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                                    .foregroundColor(mainTextColor)
                                    .opacity((stepIndex==2&&showAnimation) ? 0.0 : 1.0)
                                    
                                    
                                }
                                .opacity((stepIndex==Step_Output&&showAnimation) ? 1.0 : 0.0)
                            }
                            
                        }
                            
                        // Seperate lines
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/5, y: geometry.size.height*1/8))
                            path.addLine(to: CGPoint(x: geometry.size.width/5, y: geometry.size.height*18/20))
                            path.move(to: CGPoint(x: geometry.size.width*4/5, y: geometry.size.height*1/8))
                            path.addLine(to: CGPoint(x: geometry.size.width*4/5, y: geometry.size.height*18/20))
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [15, 5]))
                        .foregroundColor(.blue)
                        .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                            
                        //  input --------------------------
                        Text("Input")
                            .position(x: geometry.size.width/10, y: geometry.size.height*0.15)
                            .font(.system(size: min(geometry.size.height / 14, 24)))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                        //  output --------------------------
                        Text("Output")
                            .position(x: geometry.size.width*9/10, y: geometry.size.height*0.15)
                            .font(.system(size: min(geometry.size.height / 14, 24)))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                        Text("X1")
                            .position(x: geometry.size.width/10, y: w1PosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                        Text("X2")
                            .position(x: geometry.size.width/10, y: w1PosY+wDeltaY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                        Text("Xn")
                            .position(x: geometry.size.width/10, y: wnPosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                        // Line between X3 and Xn ----------------------------
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/10, y: w1PosY+wDeltaY+geometry.size.height/24))
                            path.addLine(to: CGPoint(x: geometry.size.width/10, y: wnPosY-geometry.size.height/24))
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                        .foregroundColor(mainTextColor)
                        .opacity((stepIndex>Step_A_Neuron)||((Step_A_Neuron==stepIndex)&&showAnimation) ? 1.0 : 0.0)
                        
                        
                    }// Ensure ZStack fits the rectangle size
                        
                }
                .opacity( showPage ? 1.0 : 0.0)
                .frame(width: geometryView.size.width, height: geometryView.size.height*aniViewHeight[viewDir])
                
                //---------------------------------------------------------------------------------------------------------------------------
                VStack{
                    var contentText = ["Neurons, often called nerve cells, are the fundamental brain and nervous system units. These specialized cells receive, handle, and send signals electrically and chemically, making them vital for everything from reflex actions to complex thought processes.",
                                       "At the core of a neural network are artificial neurons (nodes). Same as neurons of humans. Each neuron receives input data, processes them, and produces an output data.",
                                       "Neurons are connected to previous neurons by connections. Each connection has an associated weight that modulates the signal passed from one neuron to another. These weights are adjusted during training phase to optimize the network's performance.",
                                       "We add a bias value to the weighted sum of its inputs inside the neuron and then apply an activation function to the result. This function introduces non-linearity into the network, allowing it to learn complex patterns and relationships in the data. Then, the neuron generates the output value as input to the next neuron.",
                                        "A large number of neurons are connected together to form a neural network. A typical neural network contains three main layers: the input, hidden, and output.",
                    "The input layer is the first layer in a neural network and is responsible for receiving input data. In this layer, each node represents a feature from the dataset and send data to neurons in hidden layer.",
                    "Hidden layers are between the input and output layers. Neurons in the hidden layers are connected to all nodes in the previous layer. A giant model can contain nearly a hundred hidden layers with thousands of neurons per layer. Hidden layers adjust the weights of the connections between  nodes to learn combinations and abstract representations of the data.",
                    "The output layer is the final layer in a neural network and is responsible for producing the output results. The number and type of nodes in the output layer depend on the requirements of the specific task (e.g., classification, regression)."]
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(.red)
                            .frame(width: geometry.size.width, height: geometry.size.height*0.04)
                            .position(x: geometry.size.width/2, y: geometry.size.height*0.02 )
                        
                        Rectangle()
                            .fill(contentBGColor)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .position(x: geometry.size.width/2, y: geometry.size.height*0.53 )
                        
                        Text(contentText[stepIndex])
                                .font(.system(size: min(geometry.size.width / 16, 24)))
                                .foregroundColor(contentTextColor)
                                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.8)
                                .position(x:geometry.size.width/2, y:geometry.size.height*0.4)
                                .opacity(textOpacity )
                       /*
                        Image( "Neuron") // Placeholder image, replace with your own
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*NeuronImageInitialSize[viewDir][0], height: showArtificialNeuron ?  geometry.size.height*NeuronImageEndSize[viewDir][1] :geometry.size.height*NeuronImageInitialSize[viewDir][1] )
                            .position(x: geometry.size.width/2, y:  showArtificialNeuron ? geometry.size.height*NeuronImageEndPosY[viewDir] : geometry.size.height*NeuronImageInitialPosY[viewDir])
                        */
                        if(textOpacity>0.95){
                            Text("Tap to continue...")
                                .font(.system(size: min(geometry.size.width / 16, 24)))
                                .italic()
                                .opacity(tapTextOpacity)
                                .foregroundColor(contentTextColor)
                                .position(x:geometry.size.width/2, y:geometry.size.height*0.9)
                                .onAppear {
                                    tapTextOpacity = 0.0
                                    // 在文本出现时开始动画
                                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                                        // 无限循环切换颜色
                                        tapTextOpacity = 1.0
                                    }
                                }
                        }
                        
                    } // Geometry
                    
                }// ZStack
                .frame(width: geometryView.size.width, height: geometryView.size.height*(1-aniViewHeight[viewDir]))
                .position(x:geometryView.size.width/2, y: showPage ? geometryView.size.height*(1-(1-aniViewHeight[viewDir])/2) : geometryView.size.height*(1-(1-aniViewHeight[viewDir])/2+0.255))
                //.frame(width: geometryView.size.width, height: geometryView.size.height*(1-aniViewHeight[viewDir]))
                
            }
            .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
            .onTapGesture {
                print("portrait view tapped")
                OnScreenTapped()
            }
        } // ZStack
        .background(mainBGColor)
        .onAppear(){
            withAnimation(.easeInOut(duration: 0.4)) {
                showPage.toggle()
            }
        }
        .statusBar(hidden: true) // This hides the status bar
    } // Body view
    
    func OnScreenTapped(){
        
        playSound(filename:"Button2")
        
        //var needAnimation = false
        if(stepIndex<7){
            //changeTextView.changeText.toggle()
            //disableAllButtons = false
            // To next step
            nextPageIndex = pageIndex
            nextStepIndex = stepIndex + 1
            
            var duration = 0.5
            if(stepIndex==Step_Bias){
                // A special animation here
                duration = 1.0
                
                withAnimation(Animation.linear(duration: duration)) {
                    textOpacity = 0.0
                    hideAnimation2.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    stepIndex = nextStepIndex
                    pageIndex = nextPageIndex
                    showAnimation = false
                    
                    tapTextOpacity = 0.0
                    
                    withAnimation(Animation.linear(duration: duration)) {
                        textOpacity = 1.0
                        boxZoomAnimation.toggle()
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2) {
                    withAnimation(Animation.linear(duration: duration)) {
                        showAnimation.toggle()
                    }
                }
            }
            else {
                withAnimation(Animation.linear(duration: duration)) {
                    textOpacity = 0.0
                    if(stepIndex == Step_Neuron) {
                        hideAnimation1.toggle()
                    }
                    
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    stepIndex = nextStepIndex
                    pageIndex = nextPageIndex
                    
                    tapTextOpacity = 0.0
                    showAnimation = false
                    
                    withAnimation(Animation.linear(duration: duration)) {
                        textOpacity = 1.0
                        showAnimation.toggle()
                    }
                }
            }
        }
        else {
            withAnimation(Animation.linear(duration: 0.5)) {
                showPage.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                stepIndex = 0
                pageIndex = 2
                
            }
        }
    }
}

    /*
#Preview {
    InfoView()
}*/
