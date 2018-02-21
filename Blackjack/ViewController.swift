//
//  ViewController.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 13..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameButtonDelegate{
    
    var dealerCardList: [CardImageView] = []
    var playerCardList: [CardImageView] = []
    
    var shuffleCard: ShuffleCard = ShuffleCard()
    
    var playerCardScore: Int = 0{
        willSet{
            playerCardScoreLb.text = String(newValue)
        }
    }
    
    let gameBtnTitleList: [String] = ["Hit", "Double", "Stand"]
    var gameBtnList: [GameButton] = []
    
    var playerCardScoreLb: UILabel = UILabel(frame: CGRect(x: 30, y: 525, width: 60, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        gameSetting()
        shuffleCard.shuffleCardList()
        startGame()
    }
    
    func gameSetting(){
        playerCardScoreLb.text = ""
        playerCardScoreLb.textColor = .black
        playerCardScoreLb.textAlignment = .right
        self.view.addSubview(playerCardScoreLb)
        
        var gameBtnTag: Int = 0
        let xMargin: CGFloat = 20
        var xPoint: CGFloat = 80
        for btnText in gameBtnTitleList{
            let gameBtn: GameButton = GameButton()
            gameBtn.frame = CGRect(x: xPoint, y: self.view.frame.size.height - 80, width: 80, height: 40)
            xPoint += (gameBtn.frame.width + xMargin)
            gameBtn.createBtn()
            gameBtn.tag = gameBtnTag
            gameBtn.delegate = self
            gameBtn.btnText = btnText
            self.view.addSubview(gameBtn)
            gameBtnList.append(gameBtn)
            
            gameBtnTag += 1
        }
    }
    
    func startGame(){
        if !shuffleCard.cutFlag {
            shuffleCard.shuffleCardList()
        }
        drawDealer(isFront: true)
        drawPlayer(isFront: true)
        drawDealer(isFront: false)
        drawPlayer(isFront: true)
    }
    
    func drawDealer(isFront flag: Bool){
        var x: CGFloat = 100
        let y: CGFloat = 150
        let dealerCard: CardImageView = CardImageView(cardName: shuffleCard.getCard())
        dealerCard.cardFlag = flag
        if dealerCardList.count >= 1{
            x += CGFloat(dealerCardList.count * 25)
        }
        dealerCard.frame = CGRect(x: x, y: y, width: 100, height: 145)
        dealerCardList.append(dealerCard)
        self.view.addSubview(dealerCard)
    }
    
    func drawPlayer(isFront flag: Bool){
        var x: CGFloat = 100
        let y: CGFloat = 400
        let playerCard: CardImageView = CardImageView(cardName: shuffleCard.getCard())
        playerCard.cardFlag = flag
        if playerCardList.count >= 1 {
            x += CGFloat(playerCardList.count * 25)
        }
        playerCard.frame = CGRect(x: x, y: y, width: 100, height: 145)
        playerCardList.append(playerCard)
        self.view.addSubview(playerCard)
        
        calcScore(for: playerCardList)
    }
    
    func calcScore(for cardList: [CardImageView]){
        var calcNum: Int = 0
        var aceCount: Int = 0
        for card in cardList{
            let cardNum = getCardNum(is: card)
            if cardNum == 11{
                aceCount += 1
            }
            calcNum += cardNum
        }
        for _ in 0 ..< aceCount{
            if calcNum > 21{
                calcNum -= 10
            }
        }
        playerCardScore = calcNum
    }
    
    func delayBtn(){
        for btn in gameBtnList{
            btn.isEnabled = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for btn in self.gameBtnList{
                btn.isEnabled = true
            }
        }
    }
    
    
    /// 해당 카드의 점수를 반환하는 함수
    ///
    /// - Parameter card: 점수를 반환하려는 카드
    /// - Returns: 카드의 점수
    func getCardNum(is card: CardImageView) -> Int{
        let cardName: String = card.cardFrontImg.components(separatedBy: "_").first!
        var cardNum: Int = 0
        switch cardName {
        case "A":
            cardNum = 11
        case "2":
            cardNum = 2
        case "3":
            cardNum = 3
        case "4":
            cardNum = 4
        case "5":
            cardNum = 5
        case "6":
            cardNum = 6
        case "7":
            cardNum = 7
        case "8":
            cardNum = 8
        case "9":
            cardNum = 9
        case "10","J","Q","K":
            cardNum = 10
        default:
            cardNum = 0
        }
        return cardNum
    }
    
    func clickBtn(_ gameButton: GameButton) {
        delayBtn()
        switch gameButton.tag {
        /// Hit 버튼 함수
        case 0:
            drawPlayer(isFront: true)
            if playerCardScore > 21{
                let alertVC: UIAlertController = UIAlertController(title: "Bust", message: "카드의 합이 21이 넘었습니다.", preferredStyle: .alert)
                let alertAct = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertVC.addAction(alertAct)
                self.present(alertVC, animated: true, completion: nil)
            }
        /// Double 버튼 함수
        case 1:
            drawPlayer(isFront: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
            }
        case 2:
            print("2")
        case 3:
            print("3")
        default:
            print("오류")
        }
    }
    
    func initGameSetting(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

