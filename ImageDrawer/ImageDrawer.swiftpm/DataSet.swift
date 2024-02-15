//
//  File.swift
//  ImageDrawer
//
//  Created by Wentao Ma on 2024/2/9.
//

import Foundation

class ImageData: Codable,Hashable {
    var hashCode: Int
    static func == (lhs: ImageData, rhs: ImageData) -> Bool {
        return lhs.hashCode==rhs.hashCode
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashCode)
    }
   
    
    var data : [Int]
    
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode([Int].self, forKey: .data)
        
        hashCode = Int.random(in:-1000000...1000000)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
    
    init(data:[Int]) {
        self.data = data
        
        hashCode = Int.random(in:-1000000...1000000)
    }
    
    func SetData(data:[Int]){
        self.data = data
    }
    
    
    init(){
        hashCode = Int.random(in:-1000000...1000000)
        
        data = [0,0,0,0,0]
    }
}

class Symbol: Codable,Hashable{
    var hashCode: Int
    static func == (lhs: Symbol, rhs: Symbol) -> Bool {
        return lhs.hashCode==rhs.hashCode
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashCode)
    }
    
    var data=[ImageData]()
    
    enum CodingKeys: String, CodingKey {
        case  data
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode([ImageData].self, forKey: .data)
        
        hashCode = Int.random(in:-1000000...1000000)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
    
    init(data:[ImageData]){
        self.data = data
        
        hashCode = Int.random(in:-1000000...1000000)
    }
    
    
    init(){
        hashCode = Int.random(in:-1000000...1000000)
        data.append(ImageData())
    }
}

class SymbolSet: Codable,Hashable {
    var hashCode: Int
    static func == (lhs: SymbolSet, rhs: SymbolSet) -> Bool {
        return lhs.hashCode==rhs.hashCode
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashCode)
    }
    
    var name = "Symbol Set"
    var data=[Symbol]()
    
    enum CodingKeys: String, CodingKey {
        case name, data
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        data = try values.decode([Symbol].self, forKey: .data)
        
        hashCode = Int.random(in:-1000000...1000000)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(data, forKey: .data)
    }
    
    init(data:[Symbol]){
        self.data = data
        
        hashCode = Int.random(in:-1000000...1000000)
    }
    
    init(){
        hashCode = Int.random(in:-1000000...1000000)
        data.append(Symbol())
    }
}

class AllData: Codable{
    var data = [SymbolSet]()
    
    init() {
        
    }
    
    init(jsonString:String){
        let jsonData = jsonString.data(using: .utf8)!

        data = try! JSONDecoder().decode([SymbolSet].self, from: jsonData)
    }
    
    func GetJsonString() -> String {
        let jsonData = try! JSONEncoder().encode(self)

        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        return jsonString
    }
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode([SymbolSet].self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
}
