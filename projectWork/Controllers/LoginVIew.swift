//
//  ViewController.swift
//  projectWork
//
//  Created by STARKS on 11/5/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view.
        setupViews()
    }
//    override func viewDidAppear(_ animated: Bool) {
//
//    }
//

    func setupViews()
    {
        let stackView = makeStackView(withOrientation : .horizontal)
        
        
        
        let imageView = makeImageView(named: "iconImg")
        let appTitle = makeTitleLabel(withText: "Welcome to Bachelors Food!",withSize: view.bounds.width/18 )
        let userIdtextFeild = makeTextFeild(withplaceHolder: "Enter the Email Id")
        let passIdtextFeild = makeTextFeild(withplaceHolder: "Enter the Password")
        let LogInBtn = makeButton(withText: "Log In")
        
        
        let signin = makeLabel(withText: "Dont have an account ? ")
        let signinBtn  = makeButtonLink(withText: "Sign In")
        
        stackView.addArrangedSubview(signin)
        stackView.addArrangedSubview(signinBtn)
        
        
        view.addSubview(imageView)
        view.addSubview(appTitle)
        view.addSubview(userIdtextFeild)
        view.addSubview(passIdtextFeild)
        view.addSubview(LogInBtn)
        view.addSubview(stackView)

        
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width/2).isActive = true
        
        appTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
        
        userIdtextFeild.center.x = view.center.x // Place it in the center x of the view.
        userIdtextFeild.center.x -= view.bounds.width
        passIdtextFeild.center.x = view.center.x // Place it in the center x of the view.
        passIdtextFeild.center.x -= view.bounds.width
      
        appTitle.alpha = 0
        appTitle.center.x = view.center.x
        appTitle.center.x -= view.bounds.width
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {

            appTitle.alpha = 1.5
             self.view.layoutIfNeeded()

        }, completion: nil)

        
        userIdtextFeild.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        userIdtextFeild.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userIdtextFeild.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5).isActive = true
        
        passIdtextFeild.topAnchor.constraint(equalTo: userIdtextFeild.bottomAnchor, constant: 10).isActive = true
          passIdtextFeild.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passIdtextFeild.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5).isActive = true
          
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {

                  appTitle.alpha = 1.5

              }, completion: nil)





          UIView.animate(withDuration: 0.5, delay: 2, options: [.curveEaseOut], animations: {
                    userIdtextFeild.center.x += self.view.bounds.width
                    passIdtextFeild.center.x += self.view.bounds.width
        //                 self.view.layoutIfNeeded()
                   }, completion: nil)
                UIView.animate(withDuration: 0.5, delay: 2.5, options: [.curveEaseOut], animations: {
        //                    userIdtextFeild.center.x += self.view.bounds.width
                            passIdtextFeild.center.x += self.view.bounds.width
                //                 self.view.layoutIfNeeded()
                           }, completion: nil)
//
        
        LogInBtn.widthAnchor.constraint(equalToConstant: view.bounds.width/2).isActive = true
        LogInBtn.heightAnchor.constraint(equalTo: LogInBtn.widthAnchor, multiplier: 0.25).isActive = true
        LogInBtn.topAnchor.constraint(equalTo: passIdtextFeild.bottomAnchor, constant: 30).isActive = true
        LogInBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

        stackView.topAnchor.constraint(equalTo: LogInBtn.bottomAnchor, constant: 33).isActive = true
        stackView.centerXAnchor.constraint(equalTo :view.centerXAnchor).isActive = true
       

        
    }
    
 

}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
