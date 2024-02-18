import SwiftUI

let mainBGColor = Color(red: 0.96, green: 0.96, blue: 0.9)
let mainTextColor = Color(red: 0.15, green: 0.15, blue: 0.15)
let contentBGColor = Color(red:0.24, green:0.255, blue: 0.38 )
let contentTextColor = Color(red:0.96, green:0.96, blue: 0.96 )

let neuronBGColorDark = Color(red:0.24, green:0.56, blue: 0.2 )
let neuronBGColorLight = Color(red:0.96, green:0.96, blue: 0.96 )
let biasBGColorDark = Color(red:0.24, green:0.56, blue: 0.2 )
let biasBGColorLight = Color(red:0.96, green:0.96, blue: 0.96 )
let neuronTextColor = Color(red:0.96, green:0.96, blue: 0.96 )
let neuronBorderColor = Color(red: 0.15, green: 0.15, blue: 0.15)

struct ContentView: View {
    @State var pageIndex = 0
    @State var stepIndex = 0

    @State private var isAnimating = false
    @State private var textOpacity = 1.0
    
    @State var isFromFrontPage = false
    
    var body: some View {
        if pageIndex==0 {
            // Front page
            GeometryReader { geometry in
                VStack { //  screen
                    VStack{     // main area
                        Spacer()
                         Text("AI Neural Network")
                            .frame(width: geometry.size.width, height: geometry.size.height/10)
                            .font(.system(size: min(geometry.size.width / 10, 72)))
                            .foregroundColor(mainTextColor)
                            .offset(x: isAnimating ? 0 : 0, y: isAnimating ? geometry.size.height * -0.38 : 0)
                        Spacer()
                    }   // main area
                    .frame(width: geometry.size.width, height: geometry.size.height*0.618)
                    
                    VStack{ // Content area
                        Text("A neural network is a type of artificial intelligence (AI) model that is inspired by the structure and function of biological neural networks, such as the human brain. It's a fundamental component of many modern machine learning and deep learning algorithms.")
                            .font(.system(size: min(geometry.size.width / 10, 32)))
                            .foregroundColor(contentTextColor)
                            .opacity(isAnimating ? 0.0 : 1.0)
                            .padding(.vertical, geometry.size.height/16) // 在垂直方向（上下）添加内边距
                            .padding(.horizontal, geometry.size.width/12) // 在水平方向（左右）添加内边距
                        Spacer()
                        Text("Tap to continue...")
                            //.frame(width: geometry.size.width*5/6, height: geometry.size.height/4)
                            .font(.system(size: min(geometry.size.width / 16, 28)))
                            .foregroundColor(contentTextColor)
                            .offset(x: isAnimating ? 0 : 0, y: isAnimating ? geometry.size.height / 3 : 0)
                            .opacity(textOpacity)
                            .italic()
                            .onAppear {
                                // 在文本出现时开始动画
                                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                                    // 无限循环切换颜色
                                    textOpacity = 0.2
                                }
                            }
                    }   // Content area
                    .background(contentBGColor)
                    .frame(width: geometry.size.width+20, height: geometry.size.height*0.383)
                    .opacity(isAnimating ? 0.0 : 1.0)
                    
                }   // Whole screen
                .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                .background(mainBGColor)
                .onTapGesture {
                    // Action to perform on tap
                    withAnimation(.easeInOut(duration: 0.4)) {
                        isAnimating.toggle()
                    }
                    // 动画结束后的操作
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        // 动画完成后要执行的代码
                        print("动画完成!")
                        pageIndex = 1
                        isFromFrontPage = true
                    }
                }   //  GeometryReader of screen
            }
            .statusBar(hidden: true) // This hides the status bar
        }
        else  {
            GeometryReader { screenGeometry in
                if screenGeometry.size.height > screenGeometry.size.width {
                    AnyView(PortraitView(pageIndex:$pageIndex,stepIndex:$stepIndex,isFromFrontPage:$isFromFrontPage))
                        .background(mainBGColor)
                } else {
                    // 竖屏
                    AnyView(LandscapView())
                        .background(mainBGColor)
                }
            }
            .statusBar(hidden: true) // This hides the status bar
        }
        
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}*/
