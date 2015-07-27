//
//  Table.swift
//  robotsw
//
//  Created by CS_praktykant on 23/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import Foundation

class Table {
    var contentArray = Array<Array<Field>>()
    var enemiesArray = Array<Field>()
    var playerArray = Field()
    var x : Int = 0
    var y : Int = 0
    
    var numberOfEnemies : Int = 0
    var numberOfTeleports : Int = 0
    
    init(x : Int, y : Int) {
        self.setContentArraySize(x: x, y: y)
    }
    
    // Array g/s
    func setContentArraySize(#x : Int, y : Int) {
        self.x = x
        self.y = y
        for n in 0..<x {
            self.contentArray.append(Array(count: y, repeatedValue: Field(fieldType: 0)))
        }
        for x in 0..<self.x {
            for y in 0..<self.y {
                self.contentArray[x][y] = Field(fieldType: 0)
            }
        }
    }
    
    // Clear array (all fields on 0)
    func clearContentArray() {
        for x in 0..<self.x {
            for y in 0..<self.y {
                self.setFieldOnXY(x: x, y: y, fieldType: 0)
            }
        }
    }
    
    // Array g/s
    func getContentArraySize() -> [Int] {
        return [self.x, self.y]
    }
    
    //
    func getContentArray() -> Array<Array<Field>> {
        return self.contentArray
    }
    
    // Enemies g/s
    func setNumberOfEnemies(enemies : Int) {
        if (enemies <= 0 || enemies >= self.x*self.y) {
            println("Bad enemies value. Set enemies to 1")
            self.numberOfEnemies = 1
        }
        else {
            self.numberOfEnemies = enemies
        }
    }
    
    //
    func getNumberOfEnemies() -> Int {
        return self.numberOfEnemies
    }
    
    // Teleport g/s
    func setNumberOfTeleports(teleports : Int) {
        if (teleports <= 0) {
            println("Bad teleports value. Set teleports to 1")
            self.numberOfTeleports = 1
        }
        else {
            self.numberOfTeleports = teleports
        }
    }
    
    //
    func getNumberOfTeleports() -> Int {
        return self.numberOfTeleports
    }
    
    // Field g/s
    func getFieldOnXY(#x: Int, y: Int) -> Field {
        return self.contentArray[x][y]
    }
    
    //
    func setFieldOnXY(#x: Int, y: Int, fieldType: Int) {
        self.contentArray[x][y].setFieldType(fieldType: fieldType)
    }
    
    // Randomization
    func setEnemiesRandom() {
        var i = 0
        while(i<self.numberOfEnemies) {
            let x = Int(arc4random_uniform(UInt32(self.x)))
            let y = Int(arc4random_uniform(UInt32(self.y)))
            if (self.getFieldOnXY(x: x, y: y).fieldType == 0) {
                self.setFieldOnXY(x: x, y: y, fieldType: 2)
                i++
            }
        }
    }
    
    //
    func setPlayerRandom() {
        while(true) {
            let x = Int(arc4random_uniform(UInt32(self.x)))
            let y = Int(arc4random_uniform(UInt32(self.y)))
            if(self.getFieldOnXY(x: x, y: y).fieldType == 0) {
                self.setFieldOnXY(x: x, y: y, fieldType: 1)
                break
            }
            else {
                continue
            }
        }
    }
    
    // Logs methods
    func logContentArray() {
        for x in 0..<self.x {
            for y in 0..<self.y {
                //print("x:\(x), y:\(y)")
                print(self.getFieldOnXY(x: x, y: y).fieldType)
            }
            println()
        }
    }
    
    // Move methods
    
}






