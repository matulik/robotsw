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
    }
    
    func getContentArraySize() -> [Int] {
        return [self.x, self.y]
    }
    
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
    
    func getNumberOfTeleports() -> Int {
        return self.numberOfTeleports
    }
    
    
    // Logs methods
    func logContentArray() {
        println(self.contentArray)
    }
    
    
}
