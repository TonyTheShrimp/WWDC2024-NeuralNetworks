import SwiftUI

struct ContentView: View {
    @State var result = "No result yet"
    
    var neuron = NeuralNetwork()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Divider()
            Button(action: {
                //let x = [2.0, 3.0]
                //let re = neuron.feedforward(value:x)
                neuron.DoTrain()
                result = String("Trained")
            }) {
              Text("I am Button")
                        .foregroundColor(.blue)
            }
            Text(result)
        }
    }
}
