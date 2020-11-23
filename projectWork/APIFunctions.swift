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
   
    func addRecepies(userId : String,userName : String,title : String,steps : String)
    {
        var _url = "http://localhost:4444/recepies/add"
        _url =  _url + "/\(userId)"
        
        AF.request(_url,
                          method: .put,
        encoding: URLEncoding.queryString,
        headers: ["userId" : userId , "userName" : "shubham" ,"title" : title , "steps" : steps]).responseJSON{
            response in
             let data = String(data : response.data!,encoding: .utf8)
            print(data)
        }
        
        
        
    }
    
    
}
