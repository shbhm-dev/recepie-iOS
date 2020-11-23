//
//  ViewController.swift
//  addRecepie
//
//  Created by STARKS on 11/9/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    
          let button   = UIButton(type: UIButton.ButtonType.custom) as UIButton
      let button1   = UIButton(type: UIButton.ButtonType.custom) as UIButton
    var Comptag : Int?
    var label: UILabel?
    var showTheWorld :  UILabel?
    var recepieSteps : UILabel?
         
    override func viewDidLoad() {
        super.viewDidLoad()
          self.hideKeyboardWhenTappedAround()
        self.view.backgroundColor = .white
        
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.backgroundColor = .red
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Add Recepie"
        
        let leftbtn = UIBarButtonItem(title: "Back", style: .done, target: self, action: nil)
        
        
        navigationItem.leftBarButtonItem = leftbtn
        leftbtn.tintColor = .black
        navigationBar.items = [navigationItem]
        
        
        self.view.addSubview(navigationBar)
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
         label = makeTitleLabel(withText: "What have you made? 😍", withSize: 25)
         showTheWorld = makeTitleLabel(withText: "Show the World what you have made!", withSize: 25)
         recepieSteps = makeTitleLabel(withText: "Share your amazing recepie 😋", withSize: 23)
        
        view.addSubview(label!)
        view.addSubview(showTheWorld!)
        
        label!.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 40).isActive = true
        label!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        //        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
        let txtFeild = UITextField()
        txtFeild.translatesAutoresizingMaskIntoConstraints = false
        txtFeild.placeholder = "Enter your dish name"
        txtFeild.setBottomBorder()
        view.addSubview(txtFeild)
        
        
        let recepietxtFeild = UITextView()
        recepietxtFeild.isScrollEnabled = true
        recepietxtFeild.translatesAutoresizingMaskIntoConstraints = false
//        recepietxtFeild.placeholder = "Your secret recepie please !"
        recepietxtFeild.layer.borderWidth = 0.5
        recepietxtFeild.layer.cornerRadius = 10
        view.addSubview(recepietxtFeild)
        
        let submitbtn   = UIButton(type: UIButton.ButtonType.custom) as UIButton
              submitbtn.translatesAutoresizingMaskIntoConstraints = false
          submitbtn.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        submitbtn.backgroundColor = .systemRed
        submitbtn.setTitle("Submit", for: .normal)
        
         submitbtn.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        
        
        txtFeild.topAnchor.constraint(equalTo: label!.bottomAnchor, constant: 20).isActive = true
        txtFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        txtFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        showTheWorld!.topAnchor.constraint(equalTo: txtFeild.bottomAnchor, constant: 40).isActive = true
        showTheWorld!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        showTheWorld!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
  
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let image = UIImage(named: "add")
        button.setImage(image, for: UIControl.State.normal)
        //          button.setImage(UIImage(named: "add.png"), for: UIControl.State.normal)
        self.view.addSubview(button)
        
      
           button1.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        button1.tag = 2
        
        button1.setImage(image, for: UIControl.State.normal)
        //        button1.setImage(UIImage(named: "add.png"), for: UIControl.State.normal)
        self.view.addSubview(button1)
        self.view.addSubview(recepieSteps!)
        self.view.addSubview(submitbtn)
        
        
        
        button.topAnchor.constraint(equalTo: showTheWorld!.bottomAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        button1.topAnchor.constraint(equalTo: showTheWorld!.bottomAnchor, constant: 10).isActive = true
        button1.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        recepieSteps!.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40).isActive = true
        recepieSteps!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        recepieSteps!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        recepietxtFeild.topAnchor.constraint(equalTo: recepieSteps!.bottomAnchor, constant: 20).isActive = true
           recepietxtFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
           recepietxtFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
//        recepietxtFeild.borderStyle = UITextField.BorderStyle.roundedRect
        recepietxtFeild.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        submitbtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
          submitbtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        submitbtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        

        
        
        
        
    }
    @objc func btnTouched(sender : UIButton)
    {
        
        showImagePicker(tag:sender.tag)
      
        
    }
    
    @objc func submitClicked()
    {
        if(label!.text!.isEmpty || recepieSteps!.text!.isEmpty)
        {
            
        }else
        {
            APIFunctions.functions.addRecepies(userId: "123", userName: "shbh", title: label!.text!, steps: recepieSteps!.text!)
            
        }
        
    }
    
    func makeTitleLabel(withText : String,withSize : CGFloat ) -> UILabel
    {
        let label = UILabel()
        label.text = withText
        label.font = UIFont(name: "Copperplate-Bold",size: withSize)
        //        label.lineBreakMode = .byClipping
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    
}
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
extension addViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    func showImagePicker(tag : Int)
          {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.allowsEditing = true
            imgPicker.sourceType = .photoLibrary
            present(imgPicker,animated: true)
            Comptag = tag
              
          }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            
            if(Comptag==1)
            {  button.setImage(editedImg, for: .normal) }
            else if(Comptag==2)
            {button1.setImage(editedImg, for: .normal)
            }
        }
         
        dismiss(animated: true, completion: .none)
    }
}

