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
    // 0 - not set, 1 - player, 2 - enemy, 3 - bonus
    var fieldType : Int = 0
    var x : Int = -1
    var y : Int = -1
    
    init() {
        self.setFieldType(fieldType: 0)
    }
    
    init(fieldType: Int){
        if (self.setFieldType(fieldType: fieldType)){
            //println("Field initialized")
        }
        else {
            self.setFieldType(fieldType: 0)
        }
    }
    
    // Return true if allright
    func setFieldType(#fieldType : Int) -> Bool {
        if (fieldType > 3 || fieldType < 0) {
            return false
        }
        else {
            self.fieldType = fieldType
            return true
        }
    }
    
    func getFieldType() -> Int {
        return self.fieldType
    }
}