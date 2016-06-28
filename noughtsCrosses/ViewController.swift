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
    
    // if the game is still in play
    var gameActive = true

    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    // modify sender to know which button is tapped
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
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
                    
                    // set gameActive to false bc game is over
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "Noughts have won"
                        
                    } else {
                        
                        gameOverLabel.text = "Crosses have won"
                        
                    }
                    
                    gameOverLabel.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: {
                        
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
                        
                    })
                
                
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // starts out with game label not showing
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500 , gameOverLabel.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

