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
    
    @IBOutlet var playAgainButton: UIButton!
    
    
    // want to start everything over again to reset the game
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500 , gameOverLabel.center.y)
        
        // starts out with game label not showing
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x - 500 , playAgainButton.center.y)
        
        //loop throught the buttons to remove the noughts and crosses
        var buttonToClear : UIButton
        
        for i in 0 ..< 9 {
            
            // clearing buttons by the tag, set all other elements to have anything but 0 as a tag!
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
        
    }
    
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
                    
                    endGame()
                
                }
                
            }
            
            // also want to check if no one has won, because we haven't had a winning combo yet if we got to this chunk of code
            // if game active is still true, 
            // loop through and check to see if any of the button's states are 0
            if gameActive == true {
            
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if gameActive == false {
                    
                    gameOverLabel.text = "It's a draw!"
                    
                    endGame()
                    
                }
                
            }

            
        }
        
    }
    
    func endGame() {
        
        gameOverLabel.hidden = false
        
        playAgainButton.hidden = false
        
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y + 100)
            
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // starts out with game label not showing
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500 , gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

