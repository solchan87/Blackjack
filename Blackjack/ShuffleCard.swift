//
//  ShuffleCard.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 18..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Foundation

class ShuffleCard {
    
    private var deck: Int = 6
    
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
    
    private var cardList: [String] = []
    
    func setDeck(is num: Int){
        deck = num
    }
    
    func makeCardList(){
        cardList = []
        for _ in 1...deck{
            for type in cardTypeList{
                for num in cardNumList{
                    var card: String = num
                    card += "_of_" + type
                    cardList.append(card)
                }
            }
        }
    }
    
    func shuffleCardList(){
        makeCardList()
        var tempList = cardList
        var resultList: [String] = []
        
        while tempList.count != 0{
            let index: Int = Int(arc4random_uniform(UInt32(tempList.count)))
            resultList.append(tempList[index])
            tempList.remove(at: index)
        }
        cardList = resultList
    }
    
    func getCard() -> String{
        let card: String = cardList[0]
        cardList.remove(at: 0)
        return card
    }
    
}
