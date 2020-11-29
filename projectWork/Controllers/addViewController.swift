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
    var uuid : String!
    var username : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.view.backgroundColor = .white
        
        
        let txtFeild = UITextField()
        txtFeild.translatesAutoresizingMaskIntoConstraints = false
        txtFeild.placeholder = "Enter your dish name"
        txtFeild.setBottomBorder()
        
        let recepietxtFeild = UITextView()
        recepietxtFeild.isScrollEnabled = true
        recepietxtFeild.translatesAutoresizingMaskIntoConstraints = false
        recepietxtFeild.layer.borderWidth = 0.5
        recepietxtFeild.layer.cornerRadius = 10
        
        let submitbtn   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        submitbtn.translatesAutoresizingMaskIntoConstraints = false
        submitbtn.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        submitbtn.backgroundColor = .systemRed
        submitbtn.setTitle("Submit", for: .normal)
        submitbtn.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        
        let image = UIImage(named: "add")
        button.setImage(image, for: UIControl.State.normal)
        
        /// NAVIGATION BAR CODE
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.backgroundColor = .red
        let navigationItem = UINavigationItem()
        navigationItem.title = "Add Recepie"
        let leftbtn = UIBarButtonItem(title: "Back", style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftbtn
        leftbtn.tintColor = .black
        navigationBar.items = [navigationItem]
        
        
        
        
        
        ///NAVIGATION BAR CONSTRAINTS
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label!.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 40).isActive = true
        label!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        
        /// DISH NAME TEXT FEILD CONSTRAINTS
        txtFeild.topAnchor.constraint(equalTo: label!.bottomAnchor, constant: 20).isActive = true
        txtFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        txtFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        // LABEL FOR ADDING IMAGES CONSTRAINTS
        showTheWorld!.topAnchor.constraint(equalTo: txtFeild.bottomAnchor, constant: 40).isActive = true
        showTheWorld!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        showTheWorld!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        
        // IMAGE ADD BUTTON CODE
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        
        
        // IMAGE ADD SECOND BUTTON CODE
        button1.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        button1.tag = 2
        button1.setImage(image, for: UIControl.State.normal)
        
        
        /// ATTACHING VIEWS CODE
        self.view.addSubview(navigationBar)
        view.addSubview(label!)
        view.addSubview(showTheWorld!)
        view.addSubview(txtFeild)
        view.addSubview(recepietxtFeild)
        self.view.addSubview(button1)
        self.view.addSubview(recepieSteps!)
        self.view.addSubview(submitbtn)
        self.view.addSubview(button)
        
        
        // FIRST IMAGE ADD BUTTON CONSTRAINTS
        button.topAnchor.constraint(equalTo: showTheWorld!.bottomAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // SECOND IMAGE ADD BUTTON CONSTRAINTS
        button1.topAnchor.constraint(equalTo: showTheWorld!.bottomAnchor, constant: 10).isActive = true
        button1.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        /// RECEPIE STEPS TEXT FEILD CONSTRAINTS
        
        recepieSteps!.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40).isActive = true
        recepieSteps!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        recepieSteps!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        recepietxtFeild.topAnchor.constraint(equalTo: recepieSteps!.bottomAnchor, constant: 20).isActive = true
        recepietxtFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        recepietxtFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        recepietxtFeild.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        /// SUBMIT BUTTON CONSTRAINTS
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
        let vc =  SignUpViewController()
        if(label!.text!.isEmpty || recepieSteps!.text!.isEmpty || uuid.isEmpty)
        {
            
        }else
        {
            APIFunctions.functions.addRecepies(userId: uuid, userName: username, title: label!.text!, steps: recepieSteps!.text!)
        }
        
    }
    
    func makeTitleLabel(withText : String,withSize : CGFloat ) -> UILabel
    {
        let label = UILabel()
        label.text = withText
        label.font = UIFont(name: "Copperplate-Bold",size: withSize)
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

