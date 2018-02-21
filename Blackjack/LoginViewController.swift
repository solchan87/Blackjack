//
//  LoginViewController.swift
//  Blackjack
//
//  Created by SolChan Ahn on 2018. 2. 20..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // 1. tf 2개 필요(아이티//패스워드)
    var idTf: UITextField!
    var pwTf: UITextField!
    // 2. 버튼 2개 필요(로그인//회원가입)
    var loginBtn: UIButton!
    var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        setLayout()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    private func createUI(){
        idTf = UITextField()
        idTf.placeholder = "Email"
        idTf.tag = 10
        idTf.borderStyle = .roundedRect
        idTf.delegate = self
        idTf.textAlignment = .left
        view.addSubview(idTf)
        
        pwTf = UITextField()
        pwTf.placeholder = "Password"
        pwTf.tag = 11
        pwTf.borderStyle = .roundedRect
        pwTf.isSecureTextEntry = true
        pwTf.delegate = self
        pwTf.textAlignment = .left
        view.addSubview(pwTf)
        
        loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.setTitleColor(.gray, for: .highlighted)
        view.addSubview(loginBtn)
        
        loginBtn.addTarget(self, action: #selector(self.touchUpInsideLoginBtn(_:)), for: .touchUpInside)
        
        signUpBtn = UIButton(type: .custom)
        signUpBtn.setTitle("Sign up", for: .normal)
        signUpBtn.setTitleColor(.black, for: .normal)
        signUpBtn.setTitleColor(.gray, for: .highlighted)
        view.addSubview(signUpBtn)
        
        signUpBtn.addTarget(self, action: #selector(self.touchUpInsideSingupBtn(_:)), for: .touchUpInside)
    }
    
    func setLayout(){
        var yPoint: CGFloat = 250
        let tFWidth: CGFloat = 300
        
        var xPoint: CGFloat = self.view.frame.size.width / 2 - tFWidth / 2
        idTf.frame = CGRect(x: xPoint, y: yPoint, width: tFWidth, height: 40)
        yPoint += 60
        pwTf.frame = CGRect(x: xPoint, y: yPoint, width: tFWidth, height: 40)
        yPoint += 100
        loginBtn.frame = CGRect(x: xPoint, y: yPoint, width: tFWidth / 2 - 10, height: 50)
        xPoint += tFWidth / 2 + 10
        signUpBtn.frame = CGRect(x: xPoint, y: yPoint, width: tFWidth / 2 - 10, height: 50)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 10:
            pwTf.becomeFirstResponder()
        case 11:
            pwTf.resignFirstResponder()
        default:
            print("error")
        }
        return true
    }
    
    @objc func touchUpInsideLoginBtn(_ sender: UIButton){
        
    }
    
    @objc func touchUpInsideSingupBtn(_ sender: UIButton){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
