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
    var player = Field()
    var x : Int = 0
    var y : Int = 0
    
    var numberOfEnemies : Int = 0
    var numberOfTeleports : Int = 0
    
    
    
    init(x : Int, y : Int) {
        self.setContentArraySize(x: x, y: y)
    }
    
    // Array g/s
    func setContentArraySize(#x : Int, y : Int) {
        self.clearContentArray()
        self.clearEnemiesArray()
        self.player = Field(x: 0, y: 0, fieldType: 1)
        self.numberOfEnemies = 0
        self.numberOfTeleports = 0
        
        self.x = x
        self.y = y
        
        for n in 0..<x {
            self.contentArray.append(Array(count: y, repeatedValue: Field()))
        }
        for x in 0..<self.x {
            for y in 0..<self.y {
                self.contentArray[x][y] = Field()
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
    
    func clearEnemiesArray() {
        self.enemiesArray.removeAll(keepCapacity: false)
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
        if (fieldType == 0) {
            self.contentArray[x][y].setFieldType(fieldType: fieldType)
        }
        else if (fieldType == 1) {
            self.contentArray[x][y].setFieldType(fieldType: fieldType)
            self.player.x = x
            self.player.y = y
        }
        else if (fieldType == 2) {
            self.contentArray[x][y].setFieldType(fieldType: fieldType)
            self.contentArray[x][y].setFieldXY(x: x, y: y)
            self.enemiesArray.append(self.getFieldOnXY(x: x, y: y))
        }
        else if (fieldType == 3) {
            self.contentArray[x][y].setFieldType(fieldType: fieldType)
        }
    }
    
    func getFieldPlayer() -> Field {
        return self.player
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
                println("set player on: \(x), \(y)")
                break
            }
            else {
                continue
            }
        }
    }
    
    // Move methods
    // in cardinal directions
    
    // N,E,W,S,NE,NS,WE,WS
    // N - 1, E - 2, S - 3, W - 4
    // NE - 5, NS - 6, WE - 7, WS - 8
    // Return:
    // -2 if crashed enemies
    // -1 if bad values or cant move
    // 0 if moved
    // 1 if enemies dead
    // 2 if player dead
    
    func move(#field: Field, direction: Int) -> Int {
        var x = field.x
        var y = field.y
        let fieldType = field.fieldType
        
        if (field.fieldType == 3) {
            return -2
        }
        
        if (x < 0 || y < 0 || direction > 8 || direction <= 0){
            return -1
        }
        
        var xmove = 0, ymove = 0
        
        switch(direction) {
        case 1:
            if x == 0 {
                return -1
            }
            xmove = -1
            ymove = 0
        case 2:
            if y == self.y-1 {
                return -1
            }
            xmove = 0
            ymove = 1
        case 3:
            if x == self.x-1 {
                return -1
            }
            xmove = 1
            ymove = 0
        case 4:
            if y == 0 {
                return -1
            }
            xmove = 0
            ymove = -1
        case 5:
            if x == 0 || y == self.y-1 {
                return -1
            }
            xmove = -1
            ymove = 1
        case 6:
            if x == 0 || y == 0 {
                return -1
            }
            xmove = -1
            ymove = -1
        case 7:
            if x == self.x-1 || y == self.y-1 {
                return -1
            }
            xmove = 1
            ymove = 1
        case 8:
            if x == self.x-1 || y == 0 {
                return -1
            }
            xmove = 1
            ymove = -1
        default:
            xmove = 0
            ymove = 0
        }

        // Colisions
        // If next field is empty, move
        if (self.getFieldOnXY(x: x+xmove, y: y+ymove).fieldType == 0) {
            if (fieldType == 1) {
                self.player.x = x+xmove
                self.player.y = y+ymove
            }
            self.setFieldOnXY(x: x, y: y, fieldType: 0)
            self.setFieldOnXY(x: x+xmove, y: y+ymove, fieldType: fieldType)
            return 0
        }
        // If on next field is player, and enemies invade
        else if ((self.getFieldOnXY(x: x+xmove, y: y+ymove).fieldType == 1) && fieldType == 2) {
            return 2
        }
        // If on next field is enemies, and player invade
        else if ((self.getFieldOnXY(x: x+xmove, y: y+ymove).fieldType == 2) && fieldType == 1) {
            return 2
        }
        // If on next field is crashed enemy, and player invade 
        else if ((self.getFieldOnXY(x: x+xmove, y: y+ymove).fieldType == 3) && fieldType == 1) {
            return 2
        }
        // If on next field is enemies, and enemies invade
        else if ((self.getFieldOnXY(x: x+xmove, y: y+ymove).fieldType == 2) && fieldType == 2) {
            self.getFieldOnXY(x: x+xmove, y: y+ymove).setFieldType(fieldType: 3)
            return 1
        }
        // If on next field is crashed enemy, and enemy invade
        else if ((self.getFieldOnXY(x: x+xmove, y: y+ymove).fieldType == 3) && fieldType == 2) {
            self.getFieldOnXY(x: x+xmove, y: y+ymove).setFieldType(fieldType: 3)
            return 1
        }
        return -1
    }
    
    func getDirectionToPlayer(#field: Field) -> Int {
        let ex = field.x
        let ey = field.y
        let px = self.player.x
        let py = self.player.y
        
        if (ex == px && ey > py) {
            return 4
        }
        if (ex == px && ey < py) {
            return 2
        }
        if (ey == py && ex > px) {
            return 1
        }
        if (ey == py && ex < px) {
            return 3
        }
        if (ex > px && ey > py) {
            return 5
        }
        if (ex > px && ey < py) {
            return 6
        }
        if (ex < px && ey > py){
            return 8
        }
        if (ex < px && ey < py){
            return 7
        }
        else {
            return 0
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
}






