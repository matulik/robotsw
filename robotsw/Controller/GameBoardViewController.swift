//
//  MainViewController.swift
//  robotsw
//
//  Created by CS_praktykant on 23/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class GameBoardViewController: UIViewController {

    var contentTable : Table = Table(x: 0, y: 0)
    var x : Int = 0
    var y : Int = 0
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var controlView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setContentViewOnSize(columns: 5)
        self.contentTable.setContentArraySize(x: self.x, y: self.y)
        self.contentTable.setNumberOfEnemies(10)
        self.contentTable.setPlayerRandom()
        self.contentTable.setEnemiesRandom()
        self.contentTable.logContentArray()
        self.refreshContentView(self.contentTable)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Creating game's board. #TODO add in argument UIView object
    func setContentViewOnSize(#columns: Int) {
        // Creating content view
        let width = self.view.frame.width
        let height = self.contentView.frame.height + (self.navigationController!.navigationBar.frame.height)
        print("height:\(height)\n")
        
        var viewSize = width/CGFloat(columns)
        var rows = Int(height/viewSize)+1
        
        println("labelSize:\(viewSize), rows:\(rows)")
        self.x = columns
        self.y = rows
        
        for y in 1...rows {
            for x in 1...columns {
                // View
                var view = UIView(frame: CGRectMake(CGFloat(x)*viewSize, CGFloat(y)*viewSize, viewSize, viewSize))
                view.backgroundColor = UIColor.clearColor()
                // Label, but can be image or whatever <-- #TODO in future
                var label = UILabel(frame: CGRectMake(0, 0, viewSize, viewSize))
                label.backgroundColor = UIColor.clearColor()
                label.text = "x"
                label.textAlignment = NSTextAlignment.Center
                label.tag = y*100+x
                view.addSubview(label)
                self.contentView.addSubview(view)
            }
        }
    }
    
    func refreshContentView(table: Table) {
        if(table.x != self.x || table.y != self.y) {
            return
        }
        for y in 1...self.y {
            for x in 1...self.x {
                var tag = y*100+x
                println(tag)
                // TODO refreshing
                //var label : UILabel = self.contentView.viewWithTag(tag) as! UILabel
                //label.text = String(format: "%d", self.contentTable.getFieldOnXY(x: y, y: x).getFieldType())
            }
        }
    }
}
