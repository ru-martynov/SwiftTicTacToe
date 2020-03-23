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
    
    @IBOutlet weak var mainTitle: UILabel! // Shows game mode
    @IBOutlet weak var PlayerTurnLabel: UILabel! // Shows whose step
    @IBOutlet weak var FirstPlayerLabel: UILabel! // Shows 1st player
    @IBOutlet weak var SecondPlayerLabel: UILabel! // Shows 2nd player
    @IBOutlet weak var WinnerLabel: UILabel! // Shows Winners
    @IBOutlet weak var RestartGame: UIButton! // Button to restart the game
    
    
    // MARK: - Game Matrix and Basic Functions
    var matrix: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]] // 0 - None 1 - X 2 - O
    var whosTurn = 0 // 1 - FirstPlayer 2 - SecondPlayer
    
    var firstPlayer = 0 // 0 - Nothing 1 - X 2 - O
    var secondPlayer = 0 // 0 - Nothing 1 - X 2 - O
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
        RestartGame.layer.cornerRadius = 20
        
        WinnerLabel.text = ""

    }
    
    // MARK: - Start game and who will be who
    func startGame() {
        
        matrix = [[0, 0, 0], [0, 0, 0], [0, 0, 0]] // 0 - None 1 - X 2 - O
        displayMatrix(matrix: matrix)
        whosTurn = Int.random(in: 1...2)
        
        if (changeButton == 1) {
            mainTitle.text = "You play with Computer"
        } else {
            mainTitle.text = "You play with Friend"
        }
        
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
            
            if (changeButton == 1) {
                SecondPlayerLabel.text = "Comp:❌"
                PlayerTurnLabel.text = "Comp Turn"
                playComputer()
            }
        }
    }
    // MARK: - Value processing
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

    @IBAction func buttonClickedXorO(_ sender: Any) { // Player Turns
        
        var tempObject = 0
        
        if (whosTurn == 1) { //Player 1(X) turn
            tempObject = firstPlayer
            PlayerTurnLabel.text = "1st!"
            
        } else { // Player 2(O) turn
            tempObject = secondPlayer
            PlayerTurnLabel.text = "2nd!"
            
        }
        // MARK: - Matrix Sysytem
        guard let button = sender as? UIButton else {
            return
        }
        // Handling options
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
    // MARK: - Print whose move
    func justPlayed() {
        displayMatrix(matrix: matrix)
        checkWinner()
        
        if (whosTurn == 1) {
            whosTurn = 2
            PlayerTurnLabel.text = "2nd!"
            if (changeButton == 1) {
                playComputer()
            }
        } else {
            whosTurn = 1
            PlayerTurnLabel.text = "1st!"
            
        }
    }
    // MARK: - Play with Computer
    func playComputer() {
        
        var check = true
        
        repeat{ // Computer random turn
            var randomPlaceRow = Int.random(in: 0...2)
            var randomPlaceCol = Int.random(in: 0...2)
            
            if (matrix[randomPlaceRow][randomPlaceCol] == 0) {
                matrix[randomPlaceRow][randomPlaceCol] = secondPlayer
                check = false
            }
        } while (check)
        justPlayed()
    }
    // MARK: - Winner verification function
    func checkWinner() {
        
        var counter = true
        // Victory options
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
    // MARK: - Print Winner
    func declayWinner(whoWon: Int) {
        if (whoWon == firstPlayer) {
            WinnerLabel.text = "1st Win!" //Won first player
        } else if (whoWon == secondPlayer) {
            if changeButton == 1 {
                WinnerLabel.text = "Comp Win!" //Won second player
            } else {
                WinnerLabel.text = "2nd Win!"
            }
        } else {
            
        }
    }
    // MARK: - Restart Button
    @IBAction func RestartButton(_ sender: Any) { // When press button
        WinnerLabel.text = ""
        startGame() // Restart game
    }
}
