//
//  ViewController.swift
//  FirebaseAuth
//
//  Created by Parker Donat on 3/1/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let base = Firebase(url: "myfirebase-3563543.firebaseIO.com")
    
    @IBOutlet weak var signupEmailTextField: UITextField!
    @IBOutlet weak var signupPassword: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupButtonTapped(sender: AnyObject) {
        if let email = signupEmailTextField.text, password = signupPassword.text where email.characters.contains("@") && password.characters.count > 5 {
            
            base.createUser(email, password: password, withValueCompletionBlock: { (error, result) -> Void in
                
                if let error = error {
                    print("Could not create user due to error \(error.localizedDescription)")
                } else {
                    if let uid = result["uid"] {
                        self.signUpLabel.text = "Account \(uid) successfully created"
                    }
                }
                
            })
        }
        
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        if let email = loginEmailTextField.text, password = loginPasswordTextField.text where email.characters.contains("@") && password.characters.count > 5 {
            base.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                
                if let error = error {
                    print("Could not create user due to error \(error.localizedDescription)")
                } else {
                    self.loginLabel.text = "Account \(authData.uid) has been successfullly logged in."
                }
                
            })
        }
    }
}


















/* 

// where is like saying another if statement in the if let. So it's a shortcut putting an if after the optionals.
if let email = signupEmailTextField.text, password = signupPassword.text where email.characters.contains("@") && password.characters.count > 5 {

base.createUser(email, password: password, withValueCompletionBlock: { (error, result) -> Void in
if let error = error {
print("Could not create user due to error \(error.localizedDescription)")
} else {
if let uid = result["uid"] {
self.signUpLabel.text = "Account \(uid) successfully created."
}
}
})
}



if let email = loginEmailTextField.text, password = loginPasswordTextField.text where email.characters.contains("@") && password.characters.count > 5 {
base.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
if let error = error {
print("Could not create user due to error \(error.localizedDescription)")
} else {
self.loginLabel.text = "Account \(authData.uid) has been successfully logged in."
}
})
}

}

*/
