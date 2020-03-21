//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Руслан Мартынов on 21.03.2020.
//  Copyright © 2020 Руслан Мартынов. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - All elements
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var PlayerTurnLabel: UILabel!
    @IBOutlet weak var FirstPlayerLabel: UILabel!
    @IBOutlet weak var SecondPlayerLabel: UILabel!
    
    var matrix: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]] // 0 - None 1 - X 2 - O
    var whosTurn = 0 // 1 - FirstPlayer 2 - SecondPlayer
    
    var firstPlayer = 0 // 0 - Nothing 1 - X 2 - O
    var secondPlayer = 0 // 0 - Nothing 1 - X 2 - O
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()

        // Do any additional setup after loading the view.
    }
    
    func startGame() {
        
        matrix = [[0, 0, 0], [0, 0, 0], [0, 0, 0]] // 0 - None 1 - X 2 - O
        displayMatrix(matrix: matrix)
        whosTurn = Int.random(in: 1...2)
        
        if (whosTurn == 1) { //Player 1(X) turn
            firstPlayer = 1
            secondPlayer = 2
            
            FirstPlayerLabel.text = "1st:❌"
            SecondPlayerLabel.text = "2nd:⭕️"
            
            if (changeButton == 1) {
                SecondPlayerLabel.text = "Comp:⭕️"
            }
            
            PlayerTurnLabel.text = "1st!"
        } else {//Player 2(O) turn
            firstPlayer = 1
            secondPlayer = 2
            
            FirstPlayerLabel.text = "1st:⭕️"
            SecondPlayerLabel.text = "2nd:❌"
            
            PlayerTurnLabel.text = "2nd!"
        }
    }
    // Value processing
    func displayMatrix(matrix: [[Int]]) {
        var tempTag = 1
        for i in 0...2 {
            for j in 0...2 {
                if (matrix[i][j] == 0 ) {
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(nil, for: .normal)
                } else if (matrix[i][j] == 1) { //Display X
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(UIImage(named: "x"), for: .normal)
                } else if (matrix[i][j] == 2) { //Display O
                    let tempButton = self.view.viewWithTag(tempTag) as? UIButton
                    tempButton?.setBackgroundImage(UIImage(named: "o"), for: .normal)
                } else {
                    
                }
                
                tempTag += 1
            }
        }
    }
    
    // MARK: - Game Script

    @IBAction func buttonClickedXorO(_ sender: Any) {
        
        var tempObject = 0
        
        if (whosTurn == 1) { //Player 1(X) turn
            tempObject = firstPlayer
            PlayerTurnLabel.text = "1st!"
            
        } else {//Player 2(O) turn
            tempObject = secondPlayer
            PlayerTurnLabel.text = "2nd!"
            
        }
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            if (matrix[0][0] == 0) {
                matrix[0][0] = tempObject
                justPlayed()
            }
        case 2:
            if (matrix[0][1] == 0) {
                matrix[0][1] = tempObject
                justPlayed()
        }
        case 3:
            if (matrix[0][2] == 0) {
                matrix[0][2] = tempObject
                justPlayed()
        }
        case 4:
            if (matrix[1][0] == 0) {
                matrix[1][0] = tempObject
                justPlayed()
        }
        case 5:
            if (matrix[1][1] == 0) {
                matrix[1][1] = tempObject
                justPlayed()
        }
        case 6:
            if (matrix[1][2] == 0) {
                matrix[1][2] = tempObject
                justPlayed()
        }
        case 7:
            if (matrix[2][0] == 0) {
                matrix[2][0] = tempObject
                justPlayed()
        }
        case 8:
            if (matrix[2][1] == 0) {
                matrix[2][1] = tempObject
                justPlayed()
        }
        case 9:
            if (matrix[2][2] == 0) {
                matrix[2][2] = tempObject
                justPlayed()
        }
        default:
            print("Error")
        }
    }
    
    func justPlayed() {
        displayMatrix(matrix: matrix)
        checkWinner()
        
        if (whosTurn == 1) {
            whosTurn = 2
            PlayerTurnLabel.text = "2nd Win!"
        } else {
            whosTurn = 1
            PlayerTurnLabel.text = "1st Win!"
            
        }
    }
    
    func checkWinner() {
        
        var counter = true
        
        if ((matrix[0][0] == matrix[1][1]) && (matrix[1][1] == matrix[2][2]) && matrix[1][1] != 0) {
            declayWinner(whoWon: matrix[1][1])
            
        } else if ((matrix[2][0] == matrix[1][1]) && (matrix[1][1] == matrix[0][2]) && matrix[1][1] != 0) {
            declayWinner(whoWon: matrix[1][1])
        } else {
            for i in 0...2 {
                if ((matrix[i][0] == matrix[i][1]) && (matrix[i][1] == matrix[i][2]) && matrix[i][0] != 0) {
                    declayWinner(whoWon: matrix[i][0])
                    counter = false
                }
            }
            if counter {
                for i in 0...2 {
                    if ((matrix[0][i] == matrix[1][i]) && (matrix[1][i] == matrix[2][i]) && matrix[0][i] != 0) {
                        declayWinner(whoWon: matrix[0][i])
                    }
                }
            }
            
        }
        
    }
    
    func declayWinner(whoWon: Int) {
        if (whoWon == firstPlayer) {
            PlayerTurnLabel.text = "1st!" //Won first player
        } else if (whoWon == secondPlayer) {
            PlayerTurnLabel.text = "2nd!" //Won second player
        } else {
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
