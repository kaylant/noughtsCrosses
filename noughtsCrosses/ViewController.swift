//
//  ViewController.swift
//  noughtsCrosses
//
//  Created by Kaylan Smith on 6/21/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    // modify sender to know which button is tapped
    @IBAction func buttonPressed(sender: AnyObject) {
        
        sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

