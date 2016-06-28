//
//  ViewController.swift
//  noughtsCrosses
//
//  Created by Kaylan Smith on 6/21/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = noughts, 2 = crosses
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    @IBOutlet var button: UIButton!
    
    // modify sender to know which button is tapped
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0) {
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
            
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                
                activePlayer = 2
                
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                
                activePlayer = 1
                
            }
            
            // loop through winning combinations to check if they are winners after images have been updated
            
            for combination in winningCombos {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    if gameState[combination[0]] == 1 {
                        
                        print("Noughts has won")
                        
                    } else {
                        
                        print("Crosses has won")
                        
                    }
                
                
                }
                
            }
            
        }
        
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

