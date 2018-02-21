//
//  ShuffleCard.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 18..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Foundation

class ShuffleCard {
    
    // 블랙젝에 사용되는 덱 수
    private var deck: Int = 6
    // 커팅 설정 - 차후에 게이지로 설정 할 수 있게 변경
    private var cutPoint: Int = 80
    
    var cutFlag: Bool = true
    
    private let cardNumList: [String] = [
        "A",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "J",
        "Q",
        "K"
    ]
    
    private let cardTypeList: [String] = [
        "C",
        "D",
        "H",
        "S"
    ]
    
    private var cardList: [String] = []
    
    func setDeck(is num: Int){
        deck = num
    }
    
    func setCutPoint(is num: Int){
        cutPoint = num
    }
    
    func makeCardList(){
        cardList = []
        for _ in 1...deck{
            for type in cardTypeList{
                for num in cardNumList{
                    var card: String = num
                    card += "_" + type
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
        
        if cardList.count == cutPoint{
            cutFlag = false
        }
        return card
    }
}
