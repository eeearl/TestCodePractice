//
//  Voice.swift
//  SafeVoice2
//
//  Created by ParkHanul on 11/2/17.
//  Copyright © 2017 eeearl. All rights reserved.
//

import Foundation

class Voice {
    let name: String
    let count: Int

    var lastFileName: String?
    
    init(name: String, count: Int) {
        self.name = name
        self.count = count
    }
    
    func convertToFile(suffix: String) -> String {
        return "\(name)\(suffix)"
    }
    
    func fileNames() -> [String] {
        return (1...count).map { convertToFile(suffix: "\($0)") }
    }
    
    func fileName() -> String {
        let shuffledFileNames = fileNames().sorted { _, _ -> Bool in return arc4random() > arc4random() }
        
        if lastFileName == shuffledFileNames.first {
            lastFileName = shuffledFileNames.last
        } else {
            lastFileName = shuffledFileNames.first
        }
        
        return lastFileName!
    }
}
