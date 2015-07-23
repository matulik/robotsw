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
    var columns : Int = 0
    var rows : Int = 0
    
    var numberOfEnemies : Int = 0
    var numberOfTeleports : Int = 0
    
    init(columns : Int, rows : Int) {
        // #TODO initialization Size
        
    }
    
    func setContentArraySize(#columns : Int, rows : Int) {
        for i in 0..<columns {
            self.contentArray.append(Array(count: rows, repeatedValue: Field()))
        }
        self.columns = columns
        self.rows = rows
    }
    
    func getContentArraySize() -> Dictionary<String, Int> {
        var dict = [
            "columns" : self.columns,
            "rows"    : self.rows
        ]
        return dict
    }
    
    func getContentArray() -> Array<Array<Field>> {
        return self.contentArray
    }
    
    func setNumberOfEnemies(enemies : Int) {
        if (enemies <= 0) {
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
    
    func setNumberOfTeleports(teleports : Int) {
        if (teleports <= 0) {
            println("Bad teleports value. Set teleports to 1")
            self.numberOfTeleports = 1
        }
        else {
            self.numberOfTeleports = teleports
        }
    }
}
