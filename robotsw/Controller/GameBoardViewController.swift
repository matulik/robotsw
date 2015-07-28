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
        self.setContentViewOnSize(columns: 30)
        self.contentTable.setContentArraySize(x: self.x, y: self.y)
        self.contentTable.setNumberOfEnemies(5)
        self.contentTable.setPlayerRandom()
        self.contentTable.setEnemiesRandom()
        self.contentTable.logContentArray()
        self.refreshContentView(self.contentTable)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Buttons (in future replace by swipe gesture)

    //
    
    // Creating game's board. #TODO add in argument UIView object
    func setContentViewOnSize(#columns: Int) {
        // Creating content view
        let width = self.view.frame.width
        let height = self.contentView.frame.height + (self.navigationController!.navigationBar.frame.height)
        print("height:\(height)\n")
        
        var viewSize = width/CGFloat(columns)
        var rows = Int(height/viewSize)+1
        
        println("labelSize:\(viewSize), rows:\(rows)")
        self.x = rows
        self.y = columns
        
        for y in 1...self.y {
            for x in 1...self.x {
                // View
                var view = UIView(frame: CGRectMake(CGFloat(y)*viewSize-viewSize, CGFloat(x)*viewSize-viewSize, viewSize, viewSize))
                view.backgroundColor = UIColor.clearColor()
                // Label, but can be image or whatever <-- #TODO in future
                var label = UILabel(frame: CGRectMake(0, 0, viewSize, viewSize))
                label.backgroundColor = UIColor.clearColor()
                label.text = ""
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
        for x in 1...self.x {
            for y in 1...self.y {
                var tag = y*100+x
                var label : UILabel = self.contentView.viewWithTag(tag) as! UILabel
                var labelContent = String(format: "%d", self.contentTable.getFieldOnXY(x: x-1, y: y-1).getFieldType())
                self.contentTable.getFieldOnXY(x: x-1, y: y-1).moved = false
                if (labelContent == "0") {
                    label.text = ""
                }
                else if (labelContent == "1") {
                    label.text = "♘"
                }
                else if (labelContent == "2") {
                    label.text = "@"
                }
                else if (labelContent == "3") {
                    label.text = "#"
                }
            }
        }
    }
}
