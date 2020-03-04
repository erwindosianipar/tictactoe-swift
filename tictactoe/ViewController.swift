//
//  ViewController.swift
//  tictactoe
//
//  Created by macbook on 02/03/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameIsActive = true
    let point = [#imageLiteral(resourceName: "x"), #imageLiteral(resourceName: "o")]
    var player = "x"
    var buttons = [UIButton]()
    var board: [String] = ["", "", "", "", "", "", "", "", ""]
    let winPosition = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
    ]

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var block1: UIButton!
    @IBOutlet weak var block2: UIButton!
    @IBOutlet weak var block3: UIButton!
    @IBOutlet weak var block4: UIButton!
    @IBOutlet weak var block5: UIButton!
    @IBOutlet weak var block6: UIButton!
    @IBOutlet weak var block7: UIButton!
    @IBOutlet weak var block8: UIButton!
    @IBOutlet weak var block9: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerName.text = "Player turn: " + player
        buttons.append(block1)
        buttons.append(block2)
        buttons.append(block3)
        buttons.append(block4)
        buttons.append(block5)
        buttons.append(block6)
        buttons.append(block7)
        buttons.append(block8)
        buttons.append(block9)
    }
    
    @IBAction func blockClick(_ sender: UIButton) {
        if buttons[sender.tag-1].isEnabled == true {
            let turn = player == "x" ? point[0] : point[1]
            buttons[sender.tag-1].setImage(turn, for: .normal)
            buttons[sender.tag-1].isEnabled = false
            board[sender.tag-1] = player
            setNextPlayer()
            cekWinner()
        }
    }
    
    @IBAction func resetClick(_ sender: Any) {
        for i in 0...8 {
            buttons[i].setImage(nil, for: UIControl.State())
            buttons[i].isEnabled = true
            board[i] = ""
        }
    }
    
    func setNextPlayer() {
        if player == "x" {
            player = "o"
            playerName.text = "Player turn: " + player
        } else {
            player = "x"
            playerName.text = "Player turn: " + player
        }
    }

    func disabledAllButton() {
        for i in 0...8 {
            buttons[i].isEnabled = false
        }
    }
    
    func cekWinner() {
        for position in winPosition {
            if board[position[0]] != "" && board[position[0]] == board[position[1]] && board[position[1]] == board[position[2]] {
                if board[position[0]] == "x" {
                    disabledAllButton()
                    gameIsActive = false
                    playerName.text = "Player x win!"
                } else {
                    disabledAllButton()
                    gameIsActive = false
                    playerName.text = "Player o win!"
                }
            }
        }

        var totalPoint = ""
        for i in 0...8 {
            totalPoint += board[i]
        }

        if totalPoint.count == 9 {
            if gameIsActive {
                playerName.text = "Game is draw!"
            }
        }
    }
}
