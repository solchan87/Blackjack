//
//  ViewController.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 13..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shuffleCard: ShuffleCard = ShuffleCard()

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCard.shuffleCardList()
        print(shuffleCard.getCard())
        print(shuffleCard.getCard())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

