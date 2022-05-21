//
//  CodableBundelExtension.swift
//  Africa
//
//  Created by Omar Abdulrahman on 1/4/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
     
        // locate the json data
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("faild to locate the \(file) in bundel")
        }
        // create property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("faild to load \(file) from bundel")
        }
        
        // create decoder
        let decode = JSONDecoder()
        
        // create property for the decoded data
        guard let decodedData = try? decode.decode(T.self, from: data) else {
            fatalError("faild to decode \(file) from bundel")
        }
        
        // return the ready to use data
        return decodedData
    }
}
