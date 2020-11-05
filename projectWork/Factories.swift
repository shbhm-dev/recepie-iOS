//
//  Factories.swift
//  projectWork
//
//  Created by STARKS on 11/5/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

func makeImageView(named : String) -> UIImageView
 {
     let imgView = UIImageView()
     imgView.translatesAutoresizingMaskIntoConstraints = false
     imgView.image = UIImage(named: named)
     imgView.contentMode = .scaleAspectFit
     
     return imgView
 }
func makeLabel(withText : String) -> UILabel
{
    let label = UILabel()
       label.text = withText
      label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return label
    
}
func makeTitleLabel(withText : String,withSize : CGFloat ) -> UILabel
{
    let label = UILabel()
    label.text = withText
    label.font = UIFont(name: "Copperplate-Bold",size: withSize)
    label.lineBreakMode = .byClipping
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
}

func makeTextFeild(withplaceHolder : String) -> UITextField
{
    let textFeild = UITextField()
    textFeild.translatesAutoresizingMaskIntoConstraints = false
    textFeild.placeholder = withplaceHolder
//    textFeild.layer.borderWidth = 2
 
    textFeild.borderStyle = .roundedRect
    
    return textFeild
    
}


func makeButton(withText : String) -> UIButton {
   

    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
     button.setTitle(withText, for: .normal)
     button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .red
    button.layer.cornerRadius = 25
   

    return button
}
func makeButtonLink(withText : String) -> UIButton {
   

    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(withText, for: .normal)
    button.setTitleColor(.blue, for: .normal)
//    button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
   

    return button
}

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8.0

    return stackView
}

