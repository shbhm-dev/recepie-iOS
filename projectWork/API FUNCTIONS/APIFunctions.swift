//
//  APIFunctions.swift
//  projectWork
//
//  Created by STARKS on 11/16/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import Foundation
import Alamofire

struct Recepie : Decodable {
    var _id : String
    var userId: String
    var title : String
    var steps : String
    var postDate : String
}

class APIFunctions {
    
    var delegate : DataDelegate?
    static let functions = APIFunctions()
    
    
    
    /// FUNCTION TO FETCH RECEPIES(SHOWING ALL RECEPIES (GET))
    func fetchRecepies() {
        
        AF.request("http://localhost:4444/recepies/all").response{
            response in
            if(response.data == nil)
            {
                self.delegate?.printRes(newArray : "");
                return;
            }
            let data = String(data : response.data!,encoding: .utf8)
            self.delegate?.printRes(newArray : data!)
        }
    }
    
    
    /// FUNCTION TO ADD NEW RECEPIES
    func addRecepies(userId : String,userName : String,title : String,steps : String)
    {
        let _url = "http://localhost:4444/recepies/add"
        
        let parameters: [String: Any] = [
            "userId" : userId ,
            "userName" : "shubham" ,
            "title" : title ,
            "steps" : steps
        ]
        
        AF.request(_url,
                   method: .post,
                   parameters: parameters, encoding: JSONEncoding.default).responseJSON{
                    response in
                    let data = String(data : response.data!,encoding: .utf8)
                    print(data)
        }
    }
    
    ///FUNCTION TO ADD USER
    func addUser(userId : String, username : String)
    {
        
        
        let _url = "http://localhost:4444/recepies/addUser"
        
        print(username)
        print(userId)
        AF.request(_url,
                   method: .post,
                   parameters: ["userId" : userId , "username" : username], encoding: JSONEncoding.default).responseJSON{
                    response in
                    let data = String(data : response.data!,encoding: .utf8)
                    print(data)
        }
        
    }
}
