//
//  GameButton.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 20..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class GameButton: UIButton {
    
    var btnText: String!{
        willSet{
            self.setTitle(String(newValue), for: .normal)
        }
    }
    
    var delegate: GameButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBtn(){
        self.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.addTarget(self, action: #selector(touchBtn(_:)), for: .touchUpInside)
    }
    
    @objc func touchBtn(_ sender: UIButton){
        delegate?.clickBtn(self)
    }
    
}

protocol GameButtonDelegate {
    func clickBtn(_ gameButton: GameButton)
}
