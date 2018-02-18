//
//  ShuffleCard.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 18..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Foundation

class ShuffleCard {
    private let cardNumList: [String] = [
        "ace",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "jack",
        "queen",
        "king"
    ]
    
    private let cardTypeList: [String] = [
        "clubs",
        "diamonds",
        "hearts",
        "spades"
    ]
    
    func makeCardList(deck: Int) -> [String]{
        var cardList: [String] = []
        for _ in 1...deck{
            for type in cardTypeList{
                for num in cardNumList{
                    var card: String = num
                    card += "_of_" + type
                    cardList.append(card)
                }
            }
        }
        return cardList
    }
    
    func shuffleCardList(is cardList: [String]) -> [String]{
        var tempList = cardList
        var resultList: [String] = []
        
        while tempList.count != 0{
            let index: Int = Int(arc4random_uniform(UInt32(tempList.count)))
            resultList.append(tempList[index])
            print(index)
            tempList.remove(at: index)
        }
        return resultList
    }
    
}
