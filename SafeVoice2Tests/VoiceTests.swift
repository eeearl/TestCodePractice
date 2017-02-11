//
//  VoiceTests.swift
//  SafeVoice2
//
//  Created by ParkHanul on 11/2/17.
//  Copyright © 2017 eeearl. All rights reserved.
//

import XCTest
@testable import SafeVoice2

class VoiceTests: XCTestCase {
    
    func testVoiceHasName() {
        let voice = Voice(name: "Nugu", count: 0)
        XCTAssertEqual(voice.name, "Nugu")
    }
    
    func testConvertToFileName() {
        let voice = Voice(name: "Nugu", count: 10)
        let fileName = voice.convertToFile(suffix: "Seyo")
        XCTAssertEqual(fileName, "NuguSeyo")
        
        let fileName2 = voice.convertToFile(suffix: "@@@")
        XCTAssertEqual(fileName2, "Nugu@@@")

        let fileName3 = voice.convertToFile(suffix: "1")
        XCTAssertEqual(fileName3, "Nugu1")
    }
    
    func testReturnFileNameList() {
        let voice = Voice(name: "Nugu", count: 5)
        let voiceFileNames = voice.fileNames()
        
        let fileNames = [
            voice.convertToFile(suffix: "1"),
            voice.convertToFile(suffix: "2"),
            voice.convertToFile(suffix: "3"),
            voice.convertToFile(suffix: "4"),
            voice.convertToFile(suffix: "5"),
        ]
        XCTAssertEqual(voiceFileNames, fileNames)
        
        let voice2 = Voice(name: "Nugu", count: 2)
        let voiceFileNames2 = voice2.fileNames()
        
        let fileNames2 = [
            voice.convertToFile(suffix: "1"),
            voice.convertToFile(suffix: "2"),
        ]
        XCTAssertEqual(voiceFileNames2, fileNames2)
        
        let voice3 = Voice(name: "Nugu", count: 1)
        let voiceFileNames3 = voice3.fileNames()
        
        let fileNames3 = [voice.convertToFile(suffix:"1")]
        
        XCTAssertEqual(voiceFileNames3, fileNames3)
    }
    
    func testReturnFileName() {
        let voice = Voice(name: "earl", count: 1)
        let fileName = voice.fileName()
        
        XCTAssertEqual(fileName, voice.convertToFile(suffix: "1"))
        
        let voice2 = Voice(name: "pink", count: 1)
        let fileName2 = voice2.fileName()
        
        XCTAssertEqual(fileName2, voice2.convertToFile(suffix: "1"))
    }
    
    func testReturnSameFileNameIfCountIsOne() {
        let voice = Voice(name: "earl", count: 1)
        let fileName = voice.fileName()
        let fileNames = voice.fileNames()
        XCTAssertTrue(fileNames.contains(fileName))
        
        let fileName2 = voice.fileName()
        XCTAssertEqual(fileName, fileName2)
        
        let fileName3 = voice.fileName()
        XCTAssertEqual(fileName, fileName3)
        
        let fileName4 = voice.fileName()
        XCTAssertEqual(fileName, fileName4)
    }
    
    func testReturnDifferenceFileNameWithBefore() {
        let voice = Voice(name: "koala", count: 2)
        let fileName = voice.fileName()
        let fileNames = voice.fileNames()
        XCTAssertTrue(fileNames.contains(fileName))
        
        let fileName2 = voice.fileName()
        XCTAssertTrue(fileNames.contains(fileName2))
        XCTAssertNotEqual(fileName, fileName2)
    }
}
