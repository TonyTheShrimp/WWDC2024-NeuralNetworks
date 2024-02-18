//
//  NeuronsNetworkAnimationView.swift
//  AI Neurons Network
//
//  Created by Wentao Ma on 2024/2/16.
//

import SwiftUI

struct NeuralNetworkAnimationView: View {
    var stepIndex: Int
    var doAnimation: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                // Images
                if(stepIndex<=3){
                    ZStack{
                        Image( "Neuron") // Placeholder image, replace with your own
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*2/3, height: geometry.size.width*8/30)
                            .position(x: geometry.size.width/2, y:  geometry.size.height/7)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                        Text("Neuron")
                            .position(x: geometry.size.width/2, y: geometry.size.height*5.4/20)
                            .font(.system(size: min(geometry.size.height / 10, 32)))
                            .fontWeight(.bold)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                        
                        // Box of neuron ----------------------------
                        Path { path in
                            let rect = CGRect(x: geometry.size.width/4, y: geometry.size.height*8/20, width: geometry.size.width/2, height: geometry.size.height*6.8/16)
                                    path.addRect(rect)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 5]))
                        .foregroundColor(.blue)
                        .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("Artificial Neuron")
                            .position(x: geometry.size.width/2, y: geometry.size.height*19/20)
                            .font(.system(size: min(geometry.size.height / 10, 32)))
                            .fontWeight(.bold)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                    }
                    .opacity((stepIndex==3&&doAnimation)||(stepIndex != 3) ? 1.0 : 0.0)
                }
                let neuronTextFontSize = min(geometry.size.height / 32, 24)
                if(stepIndex>0&&stepIndex<=3){
                    
                    ZStack{
                        let wPosX = geometry.size.width*0.36
                        let neuronBoxWidth = geometry.size.width/6
                        let neuronBoxHeight = geometry.size.height/18
                        
                       
                        
                        // W1 ----------------------------
                        let w1PosY =  geometry.size.height*15/32
                        Rectangle() // 创建一个矩形
                            .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                            .position(x: wPosX, y: w1PosY)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                                    
                        
                        Path { path in
                                    let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: w1PosY-neuronBoxHeight/2, width: neuronBoxWidth, height: neuronBoxHeight)
                                    path.addRect(rect)
                        } // 设置矩形的尺寸
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("Weight 1")
                            .position(x: wPosX, y: w1PosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(neuronTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("X1")
                            .position(x: geometry.size.width/10, y: w1PosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/8, y: w1PosY))
                            path.addLine(to: CGPoint(x: geometry.size.width*0.27, y: w1PosY))
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        // Wn ----------------------------
                        let wnPosY =  geometry.size.height*10/16
                        Rectangle() // 创建一个矩形
                            .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                            .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                            .position(x: wPosX, y: wnPosY)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Path { path in
                            let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: wnPosY-neuronBoxHeight/2, width: neuronBoxWidth, height: neuronBoxHeight)
                            path.addRect(rect)
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("Weight N")
                            .position(x: wPosX, y: wnPosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(neuronTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("Xn")
                            .position(x: geometry.size.width/10, y: wnPosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/8, y: wnPosY))
                            path.addLine(to: CGPoint(x: geometry.size.width*0.27, y: wnPosY))
                        }
                        .stroke(neuronBorderColor, lineWidth: 2)
                        .foregroundColor(.blue)
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        // Line between W1 and Wn ----------------------------
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width*0.34, y: w1PosY+geometry.size.height/24))
                            path.addLine(to: CGPoint(x: geometry.size.width*0.34, y: wnPosY-geometry.size.height/24))
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                        .foregroundColor(mainTextColor)
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        if(stepIndex>1){
                            // Bias ----------------------------
                            let biasPosY =  geometry.size.height*12/16
                            Rectangle() // 创建一个矩形
                                .fill(neuronBGColorDark) // 设置矩形的填充颜色为绿色
                                .frame(width: neuronBoxWidth, height: neuronBoxHeight) // 设置矩形的尺寸
                                .position(x: wPosX, y: biasPosY)
                                .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                            
                            
                            Path { path in
                                let rect = CGRect(x: wPosX-neuronBoxWidth/2, y: biasPosY-neuronBoxHeight/2, width: neuronBoxWidth, height: neuronBoxHeight)
                                path.addRect(rect)
                            }
                            .stroke(neuronBorderColor, lineWidth: 2)
                            .foregroundColor(.blue)
                            .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                            
                            Text("Bias")
                                .position(x: wPosX, y: biasPosY)
                                .font(.system(size: neuronTextFontSize))
                                .foregroundColor(neuronTextColor)
                                .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                            
                            Image( "plusIcon") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(mainTextColor)
                                .frame(width: geometry.size.width*1/20, height: geometry.size.width/20)
                                .position(x: geometry.size.width*9/16, y:  wnPosY)
                                .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                            
                            Image( "funcIcon") // Placeholder image, replace with your own
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(mainTextColor)
                                .frame(width: geometry.size.width*1/16, height: geometry.size.width/16)
                                .position(x: geometry.size.width*11/16, y:  wnPosY)
                                .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                            
                            Path { path in
                                path.move(to: CGPoint(x:wPosX+neuronBoxWidth*0.55, y: w1PosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: w1PosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: wnPosY-neuronBoxHeight*0.7))
                                
                                path.move(to: CGPoint(x:wPosX+neuronBoxWidth*0.55, y: biasPosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: biasPosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*9/16, y: wnPosY+neuronBoxHeight*0.7))
                                
                                path.move(to: CGPoint(x:wPosX+neuronBoxWidth*0.55, y: wnPosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*9/16-neuronBoxHeight*0.7, y: wnPosY))
                                
                                path.move(to: CGPoint(x:geometry.size.width*9/16+neuronBoxHeight*0.7, y: wnPosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*11/16-neuronBoxHeight*0.7, y: wnPosY))
                                
                                path.move(to: CGPoint(x:geometry.size.width*11/16+neuronBoxHeight*0.7, y: wnPosY))
                                path.addLine(to: CGPoint(x: geometry.size.width*14.5/16, y: wnPosY))
                                
                            }
                            .stroke(neuronBorderColor, lineWidth: 2)
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                            
                            Text("Output = F( X1xW1+...+Xn*Wn+Bias )")
                                .position(x: geometry.size.width/2, y: geometry.size.height*17.5/20)
                                .font(.system(size: min(geometry.size.height / 14, 24)))
                                .foregroundColor(mainTextColor)
                                .opacity((stepIndex==2&&doAnimation) ? 0.0 : 1.0)
                        }
                    }
                    .opacity((stepIndex==3&&doAnimation)||(stepIndex != 3) ? 1.0 : 0.0)
                }
                
                if(stepIndex>=3){
                    ZStack{
                        Image( "NeuralNetwork") // Placeholder image, replace with your own
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*2/3, height: geometry.size.width*6/30)
                            .position(x: geometry.size.width/2, y:  geometry.size.height/7)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                        Text("Neural Network")
                            .position(x: geometry.size.width/2, y: geometry.size.height*5.4/20)
                            .font(.system(size: min(geometry.size.height / 10, 32)))
                            .fontWeight(.bold)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                        
                        
                        
                        Text("Artificial Neural Network")
                            .position(x: geometry.size.width/2, y: geometry.size.height*19/20)
                            .font(.system(size: min(geometry.size.height / 10, 32)))
                            .fontWeight(.bold)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                        
                        //  output --------------------------
                        Text("Hidden")
                            .position(x: geometry.size.width/2, y: geometry.size.height*11/32)
                            .font(.system(size: min(geometry.size.height / 14, 24)))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                    }
                    .opacity((stepIndex==3&&doAnimation) ? 0.0 : 1.0)
                }
                let x1PosY =  geometry.size.height*17/32
                let x2PosY =  geometry.size.height*20/32
                let x3PosY =  geometry.size.height*23/32
                let xnPosY =  geometry.size.height*28/32
                
                
                
                if(stepIndex>=4){
                    ZStack{
                        Text("X1")
                            .position(x: geometry.size.width/10, y: x1PosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("X2")
                            .position(x: geometry.size.width/10, y: x2PosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("X3")
                            .position(x: geometry.size.width/10, y: x3PosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        Text("Xn")
                            .position(x: geometry.size.width/10, y: xnPosY)
                            .font(.system(size: neuronTextFontSize))
                            .foregroundColor(mainTextColor)
                            .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        // Line between X3 and Xn ----------------------------
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/10, y: x3PosY+geometry.size.height/24))
                            path.addLine(to: CGPoint(x: geometry.size.width/10, y: xnPosY-geometry.size.height/24))
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                        .foregroundColor(mainTextColor)
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                    }
                    .opacity((stepIndex==4&&doAnimation) ? 0.0 : 1.0)
                }
                
                let neuronCellWidth = geometry.size.height/8
                let neuronCellHeight = geometry.size.height/24
                let neuronCellTextSize = min (geometry.size.height/24, 20)
                let neuronX1 = geometry.size.width*0.3
                let neuronX2 = geometry.size.width*0.47
                let neuronX3 = geometry.size.width*0.72
                let neuronX4 = geometry.size.width*0.88
                let neuronIndex = [0, 1, 2, 3, 4]
                let neuronY = [16.0, 18.5, 21.0, 23.5, 28.0]
                let neuronName = ["1","2","3","4","m"]
                let neuronLineColor = [Color.red, Color.green, Color.orange, Color.cyan, Color.purple, Color.brown]
                let neuronIndex2 = [0, 1, 2, 3, 4, 5]
                let neuronY2 = [15.5, 17.75, 20.0, 22.25, 24.5, 28.5]
                let neuronName2 = ["1","2","3","4","5","k"]
                let neuronIndex3 = [0, 1, 2]
                let neuronY3 = [18.0, 21.0, 26.0]
                let neuronName3 = ["1","2","l"]
                let pathX1 = geometry.size.width*0.125
                let pathX2 = geometry.size.width*0.246
                let pathX3 = geometry.size.width*0.355
                let pathX4 = geometry.size.width*0.415
                let pathX5 = geometry.size.width*0.525
                let pathX6 = geometry.size.width*0.665
                let pathX7 = geometry.size.width*0.775
                let pathX8 = geometry.size.width*0.825
                let neuronIndex4 = [0, 1]
                let neuronY4 = [20.0, 24.0]
                let neuronName4 = ["1","p"]
                
                
                
                if(stepIndex>=5){
                    ZStack{
                        Text("Layer1")
                            .position(x: neuronX1, y: geometry.size.height*13/32)
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
                                
                                path.move(to: CGPoint(x: pathX1, y: xnPosY))
                                path.addLine(to: CGPoint(x: pathX2, y: y))
                            }
                            .stroke(neuronLineColor[index], lineWidth: 2)
                            .foregroundColor(.blue)
                        }
                        
                        // Line between X3 and Xn ----------------------------
                        Path { path in
                            path.move(to: CGPoint(x: neuronX1, y: geometry.size.height*neuronY[3]/32+geometry.size.height/24))
                            path.addLine(to: CGPoint(x: neuronX1, y: geometry.size.height*neuronY[4]/32-geometry.size.height/24))
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [2, 4]))
                        .foregroundColor(mainTextColor)
                        
                        Text("Layer2")
                            .position(x: neuronX2, y: geometry.size.height*13/32)
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
                            .position(x: neuronX3, y: geometry.size.height*13/32)
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
                    .opacity((stepIndex==5&&doAnimation) ? 0.0 : 1.0)
                }
                
                if(stepIndex==6){
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
                        .opacity((stepIndex==1&&doAnimation) ? 0.0 : 1.0)
                        
                        
                    }
                    .opacity((stepIndex==5&&doAnimation) ? 0.0 : 1.0)
                }

                
                
                // Seperate lines
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width/5, y: geometry.size.height*3/8))
                    path.addLine(to: CGPoint(x: geometry.size.width/5, y: geometry.size.height*19/20))
                    path.move(to: CGPoint(x: geometry.size.width*4/5, y: geometry.size.height*3/8))
                    path.addLine(to: CGPoint(x: geometry.size.width*4/5, y: geometry.size.height*19/20))
                }
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [15, 5]))
                .foregroundColor(.blue)
                .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                
                //  input --------------------------
                Text("Input")
                    .position(x: geometry.size.width/10, y: geometry.size.height*11/32)
                    .font(.system(size: min(geometry.size.height / 14, 24)))
                    .foregroundColor(mainTextColor)
                    .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                
                //  output --------------------------
                Text("Output")
                    .position(x: geometry.size.width*9/10, y: geometry.size.height*11/32)
                    .font(.system(size: min(geometry.size.height / 14, 24)))
                    .foregroundColor(mainTextColor)
                    .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                
                /*
                Image( "Neuron") // Placeholder image, replace with your own
                    .resizable()
                    .scaledToFit()
                    .frame(width: (stepIndex==0)||(stepIndex==1&&doAnimation) ?  geometry.size.width*7/8 : geometry.size.width*2/3, height: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.width*20/30 : geometry.size.width*8/30 )
                    .position(x: geometry.size.width/2, y: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.height*0.29 : geometry.size.height/7)
                    .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                Text("Neuron")
                    .position(x: geometry.size.width/2, y: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.height*0.5 : geometry.size.height*5.4/20)
                    .font(.system(size: min(geometry.size.height / 10, 32)))
                    .fontWeight(.bold)
                    .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                
                // Box of neuron ----------------------------
                Path { path in
                    let rect = CGRect(x: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.width*3/8 : geometry.size.width/4, y: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.height*13/20 : geometry.size.height*8/20, width: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.width/4 : geometry.size.width/2, height: (stepIndex==0)||(stepIndex==1&&doAnimation) ? geometry.size.height*3.4/16 : geometry.size.height*6.8/16)
                            path.addRect(rect)
                }
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 5]))
                .foregroundColor(.blue)
                .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                
                Text("Artificial Neuron")
                    .position(x: geometry.size.width/2, y: geometry.size.height*19/20)
                    .font(.system(size: min(geometry.size.height / 10, 32)))
                    .fontWeight(.bold)
                    .opacity((stepIndex==0&&doAnimation) ? 0.0 : 1.0)
                */
                
               
            }// Ensure ZStack fits the rectangle size
            .foregroundColor(.blue) // Just for demonstration, you can customize it
        }
    }
}


