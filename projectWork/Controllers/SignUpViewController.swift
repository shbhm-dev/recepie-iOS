//
//  SignUpViewController.swift
//  projectWork
//
//  Created by STARKS on 11/5/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    var userName = UITextField()
    var userIdtextFeild = UITextField()
    var passIdtextFeild = UITextField()
    var uuid : String!
    var username : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround() 
        setupViews()
        
    }
    
    func setupViews()
    {
        let stackView = makeStackView(withOrientation : .horizontal)
        let imageView = makeImageView(named: "iconImg")
        let appTitle = makeTitleLabel(withText: "Welcome to Bachelors Food!",withSize: view.bounds.width/18 )
        let signInBtn = makeButton(withText: "Sign In")
        let signin = makeLabel(withText: "Already have an account ? ")
        let loginBtn  = makeButtonLink(withText: "Log In")
        
        userName = makeTextFeild(withplaceHolder: "Enter User Name")
        userIdtextFeild = makeTextFeild(withplaceHolder: "Enter the Email Id")
        passIdtextFeild = makeTextFeild(withplaceHolder: "Enter the Password")
        
        signInBtn.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        
        
        stackView.addArrangedSubview(signin)
        stackView.addArrangedSubview(loginBtn)
        
        
        view.addSubview(imageView)
        view.addSubview(appTitle)
        view.addSubview(userName)
        view.addSubview(userIdtextFeild)
        view.addSubview(passIdtextFeild)
        view.addSubview(signInBtn)
        view.addSubview(stackView)
        
        
        
        // APP ICON CONSTRAINTS
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width/2).isActive = true
        
        appTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        userName.center.x = view.center.x
        userName.center.x -= view.bounds.width
        
        // USERID | PASSWORD TEXTFEILD CONSTRAINTS
        userIdtextFeild.center.x = view.center.x
        userIdtextFeild.center.x -= view.bounds.width
        passIdtextFeild.center.x = view.center.x
        passIdtextFeild.center.x -= view.bounds.width
        userIdtextFeild.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 10).isActive = true
        userIdtextFeild.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userIdtextFeild.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5).isActive = true
        passIdtextFeild.topAnchor.constraint(equalTo: userIdtextFeild.bottomAnchor, constant: 10).isActive = true
        passIdtextFeild.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passIdtextFeild.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5).isActive = true
        
        
        userName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        userName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userName.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5).isActive = true
        
        
        
        
        
        // ANIMATIONS CODE
        
        appTitle.alpha = 0
        appTitle.center.x = view.center.x
        appTitle.center.x -= view.bounds.width
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {
            
            appTitle.alpha = 1.5
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {
            
            appTitle.alpha = 1.5
            
        }, completion: nil)
        
        
        
        
        
        UIView.animate(withDuration: 0.5, delay: 2, options: [.curveEaseOut], animations: {
            self.userIdtextFeild.center.x += self.view.bounds.width
            self.passIdtextFeild.center.x += self.view.bounds.width
            
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 2.5, options: [.curveEaseOut], animations: {
            //                    userIdtextFeild.center.x += self.view.bounds.width
            self.passIdtextFeild.center.x += self.view.bounds.width
            //                 self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        
        //SIGN IN BUTTON CONSTRAINTS
        
        signInBtn.widthAnchor.constraint(equalToConstant: view.bounds.width/2).isActive = true
        signInBtn.heightAnchor.constraint(equalTo: signInBtn.widthAnchor, multiplier: 0.25).isActive = true
        signInBtn.topAnchor.constraint(equalTo: passIdtextFeild.bottomAnchor, constant: 30).isActive = true
        signInBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 33).isActive = true
        stackView.centerXAnchor.constraint(equalTo :view.centerXAnchor).isActive = true
        
        
        
    }
    @objc func signInTapped()
    {
        if(userIdtextFeild.text!.isEmpty || userName.text!.isEmpty)
        {
            let alert = UIAlertController(title: "Email-ID/ Username Feild cannot be empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }else if(passIdtextFeild.text!.isEmpty)
        {
            let alert = UIAlertController(title: "Password Feild cannot be empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }else
        {
            Auth.auth().createUser(withEmail: userIdtextFeild.text!, password: passIdtextFeild.text!) { (authRes, err) in
                
                guard let user = authRes?.user , err==nil else {
                    
                    print("Errror \(err?.localizedDescription)")
                    return
                }
                self.uuid = user.uid
                self.username = self.userName.text!
                APIFunctions.functions.addUser(userId: self.uuid, username: self.username!)
                
                // PRESENTING
                let vc = AllRecepiesViewController()
                vc.modalPresentationStyle = .currentContext
                self.present(vc,animated: true,completion: nil)
            }
            
        }
        
        
        
    }
    
    
    
}
