import SwiftUI

import AVFoundation

var audioPlayer: AVAudioPlayer?

let mainBGColor = Color(red: 0.96, green: 0.96, blue: 0.9)
let mainTextColor = Color(red: 0.15, green: 0.15, blue: 0.15)
let contentBGColor = Color(red:0.24, green:0.255, blue: 0.38 )
let contentTextColor = Color(red:0.96, green:0.96, blue: 0.96 )
let contentBGColor2 = Color(red:0.76, green:0.1, blue: 0.15 )

let neuronBGColorDark = Color(red:0.24, green:0.56, blue: 0.2 )
let neuronBGColorLight = Color(red:0.40, green:0.80, blue: 0.32 )
let biasBGColorDark = Color(red:0.9, green:0.46, blue: 0.01 )
let biasBGColorLight = Color(red:0.96, green:0.96, blue: 0.96 )
let neuronTextColor = Color(red:0.96, green:0.96, blue: 0.96 )
let neuronBorderColor = Color(red: 0.15, green: 0.15, blue: 0.15)

let dataBGColorDark = Color(red: 0.96, green: 0.96, blue: 0.9)
let dataBGColorLight = Color(red: 0.48, green: 0.96, blue: 0.9)

let forwardStreamColor = Color.cyan
let backStreamColor = Color.red

var network = NeuralNetwork()

var soundPlayer: AVAudioPlayer?

func playSound(filename: String) {
    if let bundle = Bundle.main.path(forResource: filename, ofType: "wav") {
        let backgroundMusicUrl = URL(fileURLWithPath: bundle)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: backgroundMusicUrl)
            soundPlayer?.numberOfLoops = 0
            soundPlayer?.prepareToPlay()
            soundPlayer?.play()
        } catch {
            print(error)
        }
    }
}


struct ContentView: View {
    //@ObservedObject private var keyboard = KeyboardResponder()
    
    @State var pageIndex = 0
    @State var stepIndex = 0

    
    @State var isFromFrontPage = false
    
    @State var imageIndex = 0
    
    @State var textOpacity = 1.0
    
    var body: some View {
        ZStack{
            if pageIndex==0 {
                // Front page
                AnyView(FrontView(pageIndex:$pageIndex))
            }
            else if(pageIndex == 1) {
                AnyView(InfoView(pageIndex:$pageIndex))
            }
            else if(pageIndex == 2) {
                
                let images = ["Network00","Network01","Network02","Network03","Network04","Network05"]
                let countdownTimer = Timer(timeInterval: 0.6, repeats: true) { timer in
                    imageIndex += 1
                    if imageIndex == images.count {
                        imageIndex = 0
                    }
                }
                ZStack{
                    GeometryReader { geometry in
                        Button(action: {
                            print("屏幕任何地方被点击")
                            playSound(filename:"Button2")
                            countdownTimer.invalidate()
                            pageIndex = 3
                        }) {
                            // 使用透明色填充整个屏幕，使其可点击
                            Color.clear
                                .edgesIgnoringSafeArea(.all) // 忽略安全区域，填充整个屏幕
                        }
                        Text("Let's train a simplified neural network!")
                            .foregroundStyle(mainTextColor)
                            .font(.system(size: 56))
                            .position(x: geometry.size.width/2, y: geometry.size.height*0.4)
                        Image( images[imageIndex]) // Placeholder image, replace with your own
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.3, height: geometry.size.height*0.3)
                            .position(x: geometry.size.width/2, y: geometry.size.height*0.6)
                        Text("Tap to continue...")
                            .frame(width: geometry.size.width*0.8, height: geometry.size.height*0.08)
                            .opacity(textOpacity)
                            .position(x: geometry.size.width/2, y:geometry.size.height*0.98 )
                            .font(.system(size: min(geometry.size.width / 14, 24)))
                            .foregroundColor(.black)
                            .onAppear {
                                // This is a loop of animation
                                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                                   textOpacity = 0.2
                                }
                            }
                            .italic()
                    }
                }
                .background(mainBGColor)
                .statusBar(hidden: true)
                .edgesIgnoringSafeArea(.bottom)
                .onAppear(){
                    RunLoop.current.add(countdownTimer, forMode: .default)
                    countdownTimer.fire()
                }
                
            }
            else if(pageIndex==3){
                AnyView(TrainView())
            }
        }
        .onAppear(){
            if let bundle = Bundle.main.path(forResource: "Music", ofType: "mp3") {
                    let backgroundMusicUrl = URL(fileURLWithPath: bundle)
                    
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusicUrl)
                        audioPlayer?.numberOfLoops = -1 // Infinite loop
                        audioPlayer?.prepareToPlay()
                        audioPlayer?.play()
                    } catch {
                        print(error)
                    }
                }
        }
        
    }
       
}
