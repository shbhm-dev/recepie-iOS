//
//  ViewController.swift
//  customCollectionView
//
//  Created by STARKS on 11/8/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit
protocol DataDelegate {
    func printRes(newArray : String)
}

class AllRecepiesViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView : UICollectionView!
    var resArr = [Recepie]()
    
    
    // BUTTON ACTION TO PRESENT VIEW CONTROLLER TO ADD RECEPIES
    @objc func btn_clicked(_ sender: UIBarButtonItem) {
        let vc = addViewController()
        vc.modalPresentationStyle = .currentContext
        self.present(vc,animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // API FUCNTION CALL
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchRecepies()
        
        
        
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.backgroundColor = .red
        let navigationItem = UINavigationItem()
        navigationItem.title = "Recepies "
        let rightButton = UIBarButtonItem(title: "Post Recepie", style: .done, target: self, action: #selector(AllRecepiesViewController.btn_clicked(_:)))
        navigationItem.rightBarButtonItem = rightButton
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 3
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4, height: (view.frame.size.width/2)-4)
        
        
        //CREATING A CUSTOM COLLECTION VIEW
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        
        // ADDING COLLECTION VIEW CONSTRAINTS
        collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 2).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -2).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        
        
    }
    
    // COLELCTION VIEW DATA DELEGATE FUCNTIONS
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.Celltitle?.text = resArr[indexPath.row].title
        cell.postedOn?.text = "Posted By :" + resArr[indexPath.row].userId
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = secondViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc,animated: true,completion: nil)
    }
    
    
}

extension AllRecepiesViewController : DataDelegate {
    
    func printRes(newArray: String) {
        
        do
        {
            
            resArr = try JSONDecoder().decode([Recepie].self,from: newArray.data(using: .utf8)!)
            print(resArr)
        }
        catch{
            print(" this is the error \(error)")
        }
        self.collectionView.reloadData()
    }
    
    
}
