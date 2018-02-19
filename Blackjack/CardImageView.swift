//
//  CardImageView.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 19..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {

    var cardFrontImg: String = ""
    
    var cardBackImg: String = "back"
    
    var cardFlag: Bool!{
        willSet{
            if newValue == true{
                self.image = UIImage(named: cardFrontImg)
            }else{
                self.image = UIImage(named: cardBackImg)
            }
        }
    }
    
    convenience init(cardName: String) {
        self.init(frame: CGRect.zero)
        cardFrontImg = cardName
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
