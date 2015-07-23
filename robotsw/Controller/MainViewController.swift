//
//  MainViewController.swift
//  robotsw
//
//  Created by CS_praktykant on 23/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var controlView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setContentViewOnSize(columns: 15)
    }
    
            
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setContentViewOnSize(#columns: Int) {
        // Creating content view
        let width = self.view.frame.width
        let height = self.contentView.frame.height + (self.navigationController!.navigationBar.frame.height)
        print("height:\(height)\n")
        
        var labelSize = width/CGFloat(columns)
        var rows = Int(height/labelSize)
        println("labelSize:\(labelSize), rows:\(rows)")
        
        for y in 0..<rows {
            for x in 0..<columns {
                var label = UILabel(frame: CGRectMake(CGFloat(x)*labelSize, CGFloat(y)*labelSize, labelSize, labelSize))
                //println("x:\(x*25), y:\(y*60)")
                if (y == rows-1) {
                    label.text = "e"
                }
                else {
                    label.text = "x"
                }
                label.textAlignment = NSTextAlignment.Center
                label.backgroundColor = UIColor.clearColor()
                self.contentView.addSubview(label)
            }
        }
    }
}
