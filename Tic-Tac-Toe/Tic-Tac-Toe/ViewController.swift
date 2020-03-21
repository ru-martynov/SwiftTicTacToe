//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Руслан Мартынов on 20.03.2020.
//  Copyright © 2020 Руслан Мартынов. All rights reserved.
//

import UIKit

public var changeButton = 0 // if 1 -> PlayWithComputer, if 2 -> PlayWithFriend

class ViewController: UIViewController {
// Publish storybord elements
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playWithComputer.layer.cornerRadius = 20 //rounding button
        playWithFriend.layer.cornerRadius = 20 // rounding button
    }
    // MARK: - Button Functionality
    
    @IBOutlet weak var playWithComputer: UIButton!
    @IBOutlet weak var playWithFriend: UIButton!
    // First button (Play with Computer)
    @IBAction func buttonPlayWithComputer(_ sender: Any) {
        changeButton = 1
        performSegue(withIdentifier: "StartGame", sender: self)
    }
    // Second button (Play with Friend)
    @IBAction func buttonPlayWithFriend(_ sender: Any) {
        changeButton = 2
        performSegue(withIdentifier: "StartGame", sender: self)
    }
    
}
