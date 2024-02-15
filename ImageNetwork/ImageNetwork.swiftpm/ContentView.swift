import SwiftUI

struct ContentView: View {
    let  network = ImageNetwork(neuronNumber:25)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Button("Train 300") {
                network.DoTrain(epochs:300)
            }
            Button("Train 1000") {
                network.DoTrain(epochs:1000)
            }
            Button("Train 3000") {
                network.DoTrain(epochs:3000)
            }
            Button("Train 5000") {
                network.DoTrain(epochs:5000)
            }
            Button("Train 10000") {
                network.DoTrain(epochs:10000)
            }
            Button("Train 20000") {
                network.DoTrain(epochs:20000)
            }
            Button("Save") {
                network.SaveTrainResult()
            }
            Button("Load") {
                network.LoadTrainResult()
            }
            Button("Test") {
                network.DoTest()
            }
        }
    }
}
