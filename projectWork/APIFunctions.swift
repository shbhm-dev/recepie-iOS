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
            
         
            
            let data = String(data : response.data!,encoding: .utf8)
            self.delegate?.printRes(newArray : data!)
            
        }
        
    }
    
    
}
