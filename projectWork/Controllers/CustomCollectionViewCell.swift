//
//  CustomCollectionViewCell.swift
//  customCollectionView
//
//  Created by STARKS on 11/8/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "customCell"
    
    var img : UIImageView?
    var Celltitle : UILabel?
    var postedOn: UILabel?

  
    override init(frame: CGRect) {
       
        super.init(frame: frame)
//        contentView.backgroundColor = .systemRed
       
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
     
         img  = makeImageView(named: "burger")
        

        Celltitle = makeTitleLabel(withText: "", withSize: 20)
        postedOn = makeLabel(withText: "")
        
        let postStackView: UIStackView = {
                        let stackView = UIStackView(arrangedSubviews: [self.Celltitle!, self.postedOn!])
                        stackView.axis = .vertical
            stackView.distribution = .fillProportionally
                        stackView.spacing = 1.0
                        return stackView
                    }()
        
        let verticalStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [self.img!, postStackView])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 1.0
            return stackView
        }()
      
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
             self.addSubview(verticalStackView)

             verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
             verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
             verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
             verticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        Celltitle?.leadingAnchor.constraint(equalTo: postStackView.leadingAnchor, constant: 10).isActive = true
        postStackView.translatesAutoresizingMaskIntoConstraints = false
        
        img?.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 5).isActive = true
        
//              self.addSubview(verticalStackView)


        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    
    }
    func makeImageView(named : String) -> UIImageView
     {
         let imgView = UIImageView()
         imgView.translatesAutoresizingMaskIntoConstraints = false
         imgView.image = UIImage(named: named)
         imgView.contentMode = .scaleAspectFit
//        imgView.layer.borderWidth = 2
        
         
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
           label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }

}
