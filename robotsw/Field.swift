//
//  Field.swift
//  robotsw
//
//  Created by CS_praktykant on 23/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import Foundation

class Field {
    // Type of field
    // 0 - not set, 1 - player, 2 - enemy, 3 - crashed enemy, 4 - bonus?
    var fieldType : Int = 0
    var x : Int = -1
    var y : Int = -1
    
    init() {
        self.setFieldType(fieldType: 0)
    }
    
    init(x: Int, y: Int, fieldType: Int){
        if (self.setFieldType(fieldType: fieldType)){
            //println("Field initialized")
        }
        else if (x < 0 || y < 0) {
            println("Bad x or y value")
        }
        else {
            self.setFieldType(fieldType: 0)
        }
    }
    
    // FieldType g/s.
    // Return true if allright
    func setFieldType(#fieldType : Int) -> Bool {
        if (fieldType > 4 || fieldType < 0) {
            return false
        }
        else {
            self.fieldType = fieldType
            return true
        }
    }
    //
    func getFieldType() -> Int {
        return self.fieldType
    }
    
    // XY g/s
    func setFieldXY(#x: Int, y: Int) {
        if (x < 0 || y < 0) {
            println("Bad x or y value")
        }
        else {
            self.x = x
            self.y = y
        }
    }
}