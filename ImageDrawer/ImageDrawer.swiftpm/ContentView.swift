import SwiftUI

struct ContentView: View {
    @State private var currentView = 0
    // array to hold the recorded touch points
    @State private var points: [CGPoint] = []
    
    let dataFile = "AllData.json"
    var data:AllData
    
    @State var curSymbolSet=SymbolSet()
    @State var curSymbol=Symbol()
    @State var curImageData=ImageData()
    
    @State var symbolSetName = ""
    
    @State private var rectangleStates = Array(repeating: Array(repeating: false, count: 5), count: 5)
    @State private var checkResult = [[Int]]()
    
    @State var lastCol = -1
    @State var lastRow = -1
       
    @State private var touchedCell: (row: Int, column: Int)? = nil
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + dataFile
        var jsonString:String
        
        print(path)
        
        // Check if file exist
        if !FileManager.default.fileExists(atPath: path) {
            //FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
            data = AllData()
        }
        else {
            //加载本地字txt资源
            //let path = Bundle.main.path(forResource:path, ofType:"txt")
            jsonString = try! String(contentsOfFile:path, encoding: String.Encoding.utf8)
            let jsonData = jsonString.data(using: .utf8)!
            data = try! JSONDecoder().decode(AllData.self, from: jsonData)
        }
    }
        
    var body: some View {
        ZStack{
            VStack{
                if currentView==0 {
                    Text( "All data sets:")
                    ForEach(data.data, id: \.self)  { symbolset in
                        HStack{
                            Text(symbolset.name)
                            Button("Edit"){
                                currentView = 1
                                curSymbolSet = symbolset
                                symbolSetName = symbolset.name
                            }
                        }
                    }
                    Button("Add Symbol Set"){
                        curSymbolSet = SymbolSet()
                        symbolSetName = curSymbolSet.name
                        data.data.append(curSymbolSet)
                        currentView = 1
                    }
                }
                else if currentView==1 {
                    VStack{
                        Text( "Symbol set "+curSymbolSet.name)
                        HStack{
                            Text( "Name:")
                            TextField(
                                "User name (email address)",
                                text: $symbolSetName
                            )
                            .onSubmit {
                                //validate(name: username)
                                curSymbolSet.name = symbolSetName
                            }
                        }
                        HStack{
                            ForEach(0..<curSymbolSet.data.count, id: \.self)  { index in
                                VStack{
                                    ImageEditView(touchedCell: $touchedCell, data:$curSymbolSet.data[index].data[0].data, cellSize: 12)
                                        .frame(width: 72, height: 72)
                                    /*
                                        .gesture(
                                            DragGesture(minimumDistance: 0)
                                                .onChanged { value in
                                                    self.updateTouchedCell(location: value.location)
                                                }
                                                .onEnded { _ in
                                                    self.touchedCell = nil
                                                }
                                        )*/
                                    HStack{
                                        Button("Edit"){
                                            currentView = 2
                                            curSymbol = curSymbolSet.data[index]
                                        }
                                        Button("Delete"){
                                            curSymbolSet.data.remove(at: index)
                                        }
                                    }
                                }
                            }
                            Button("Add symbol"){
                                currentView = 2
                                curSymbol = Symbol()
                                curSymbolSet.data.append(curSymbol)
                            }
                        }
                    }
                    Button("Save data"){
                        SaveData()
                    }
                }
                else if currentView==2 {
                    ScrollView {
                    VStack {
                        Text( "Images of Symbol")
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 10)], spacing: 10) {
                            ForEach(0..<curSymbol.data.count, id: \.self)  { index in
                                VStack{
                                    ImageEditView(touchedCell: $touchedCell, data:$curSymbol.data[index].data,  cellSize: 12)
                                        .frame(width: 72, height: 72)
                                    /*
                                        .gesture(
                                            DragGesture(minimumDistance: 0)
                                                .onChanged { value in
                                                    self.updateTouchedCell(location: value.location)
                                                }
                                                .onEnded { _ in
                                                    self.touchedCell = nil
                                                }
                                        )*/
                                    HStack{
                                        Button("Edit"){
                                            currentView = 3
                                            curImageData = curSymbol.data[index]
                                        }
                                        Button("Delete"){
                                            curSymbol.data.remove(at: index)
                                        }
                                    }
                                }
                            }
                            Button("Add Image"){
                                currentView = 3
                                curImageData = ImageData()
                                curSymbol.data.append(curImageData)
                            }
                        }
                        HStack{
                            Button("Save"){
                                self.SaveData()
                            }
                            Button("Back"){
                                currentView = 1
                            }
                        }
                    }
                    }
                }
                else if currentView==3 {
                    VStack {
                        Text( "Image Editor")
                        ImageEditView(touchedCell: $touchedCell, data:$curImageData.data, cellSize: 40)
                            .frame(width: 240, height: 240)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        self.updateTouchedCell(location: value.location)
                                    }
                                    .onEnded { _ in
                                        self.touchedCell = nil
                                    }
                            )
                        Text("Pos:"+String(lastCol)+":"+String(lastRow))
                            HStack{
                                Button("Clean"){
                                    
                                }
                                Button("Save"){
                                    self.SaveData()
                                }
                                Button("Back"){
                                    currentView = 2
                                }
                            }
                    }
                }
            }
        }
    }
            
    
    func updateTouchedCell(location: CGPoint) {
        print("updateTouchedCell")
        print(location)
        let columnWidth = 240 / 6
        let rowHeight = 240 / 6
        
        let bit = [1,2,4,8,16,32,64]
        
        let column = Int(location.x) / columnWidth
        let row = Int(location.y) / rowHeight
        
        if column >= 0 && column < 6 && row >= 0 && row < 6  {
            
            
            print("In:"+String(column)+"-"+String(row)+"-"+String(lastCol)+"-"+String(lastRow));
            
            if !(row==lastRow && column==lastCol) {
                lastRow = row
                lastCol = column
                
                if(curImageData.data[row]&bit[column] != 0) {
                    curImageData.data[row]=curImageData.data[row]&(~bit[column])
                    print(curImageData.data)
                }
                else {
                    curImageData.data[row]=curImageData.data[row]|bit[column]
                    print(curImageData.data)
                }
            }
        } else {
            print("Out:"+String(column)+"-"+String(row)+"-"+String(lastCol)+"-"+String(lastRow));
            
            touchedCell = nil
            lastRow = -1
            lastCol = -1
        }
    }
   
    func SaveData()  {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + dataFile
        // Check if file exist
        if !FileManager.default.fileExists(atPath: path) {
            FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        }
        
        let fileHandle = FileHandle(forWritingAtPath: path)!
        
        let jsonData = try! JSONEncoder().encode(data)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        fileHandle.write(jsonString.data(using: .utf8)!)
        try? fileHandle.close()
    }
}

struct ImageEditView: View {
    @Binding var touchedCell: (row: Int, column: Int)?
    @Binding var data:[Int]
    
    var cellSize: CGFloat
    let bit = [1,2,4,8,16,32,64]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0...5, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0...5, id: \.self) { column in
                        if(data[row]&bit[column])==0{
                            Rectangle()
                                .fill(Color.white)
                                .border(Color.black, width: 1)
                                .frame(width: cellSize, height: cellSize)
                        }
                        else {
                            Rectangle()
                                .fill(Color.black)
                                .border(Color.black, width: 1)
                                .frame(width: cellSize, height: cellSize)
                        }
                    }
                }
            }
        }
    }
}


struct PointRecorderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        // combine the x-coordinate of the point with the hasher
        hasher.combine(x)
        // combine the y-coordinate of the point with the hasher
        hasher.combine(y)
    }
}
