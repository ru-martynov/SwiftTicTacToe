//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Руслан Мартынов on 20.03.2020.
//  Copyright © 2020 Руслан Мартынов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// Publish storybord elements
@IBOutlet weak var buttonPlayWithComputer: UIButton! // First button (Play with Computer)
    
@IBOutlet weak var buttonPlayWithFriend: UIButton! // Second button (Play with Friend)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonPlayWithComputer.layer.cornerRadius = 10 // rounding button Play with Computer
        buttonPlayWithFriend.layer.cornerRadius = 10 // rounding button Play with Computer
    }
    

}

