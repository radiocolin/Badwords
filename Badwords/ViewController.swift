//
//  ViewController.swift
//  Badwords
//
//  Created by Colin Weir on 6/17/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkPassword: UIButton!
    @IBOutlet weak var explanation: UILabel!
    
    let badPasswords = ["password",
    "123456",
    "12345678",
    "1234",
    "qwerty",
    "12345",
    "dragon",
    "letmein",
    "monkey",
    "abc123"]
    
    
    @IBAction func checkPasswordButton(_ sender: Any) {
        isPasswordBad()
    }
    
    func isPasswordBad() {
        if let password = password.text {
            
            if isABadPassword(password) {
                explanation.text = "This is literally a bad password. Try another one!"
                return
            }
                
            if commonNumerics(password) {
                explanation.text = "Your password starts or ends with a common sequence of digits. That's the combination on my luggage!"
                return
            }

            if badPasswordSubstring(password) {
                explanation.text = "This password is bad because it has a common password within it. It's bad passwords all the way down!"
                return
            }
            
            if password.count < 4 && password != "" {
                explanation.text = "Way too short! Try something a bit longer."
                return
            }
            
            if password == "" {
                explanation.text = "You have to enter a password before I can tell you what's wrong with it!"
                return
            }
            
            explanation.text = "I didn't find anything wrong with your password, but that doesn't mean it's good either! This is just a bad password detector, not a good password confirmer."
            return
        }
    }
    
    func isABadPassword(_ password: String) -> Bool {
        if badPasswords.contains(password) {
            return true
        } else {
            return false
        }
    }
    
    func commonNumerics(_ password: String) -> Bool {
        let numericsOnly = badPasswords.filter { isInt($0) }
        for numeric in numericsOnly {
            if password.hasPrefix(String(numeric)) || password.hasSuffix(String(numeric)) {
                return true
            }
        }
        return false
    }
    
    func badPasswordSubstring(_ password: String) -> Bool {
        for badPassword in badPasswords {
            if password.lowercased().contains(badPassword.lowercased()) {
                return true
            }
        }
        return false
    }
    
    func isInt(_ string: String) -> Bool {
        if Int(string) != nil {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        isPasswordBad()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.becomeFirstResponder()
        password.delegate = self
        // Do any additional setup after loading the view.
        
    }


}

