//
//  MainViewController.swift
//  robotsw
//
//  Created by CS_praktykant on 23/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class GameBoardViewController: UIViewController {


    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var controlView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var table : Table = Table(x: 10, y: 2)
        table.logContentArray()
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
        
        for y in 0..<rows {
            for x in 0..<columns {
                // View
                var view = UIView(frame: CGRectMake(CGFloat(x)*viewSize, CGFloat(y)*viewSize, viewSize, viewSize))
                view.backgroundColor = UIColor.clearColor()
                // Label, but can be image or whatever <-- #TODO in future
                var label = UILabel(frame: CGRectMake(0, 0, viewSize, viewSize))
                label.backgroundColor = UIColor.clearColor()
                label.text = "x"
                label.textAlignment = NSTextAlignment.Center
                view.addSubview(label)
                self.contentView.addSubview(view)
            }
        }
    }
}
