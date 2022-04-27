//
//  PlaceService.swift
//  TestiOSProject
//
//  Created by ODC on 27/4/2022.
//

import Foundation


class UserController
{
   static let shared = UserController()
    
    func login( completion : (String) -> Void )
    {
        var x = 0
        
        if x == 3
        {
            completion("iOS")
          
        }else{
            completion("Android")
          
        }
        
        
    }
    
    func logout()
    {
        
    }

}



class PlaceService
{
    
    
    func getAll(url:String,method:String,header:[String:String] = [:]) async throws -> Any?
    {
    
        guard let url = URL(string: url) else { return nil }
    
        var urlRequest = URLRequest(url: url)
    
        urlRequest.httpMethod = method
        //urlRequest.httpBody = try JSONEncoder().encode(<#T##value: Encodable##Encodable#>)ead
        urlRequest.allHTTPHeaderFields = header
            
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
        if let response = (response as? HTTPURLResponse)
        {
            if response.statusCode == 200
            {
                
                return try JSONDecoder().decode([PlaceModel].self, from: data)
                
                
            }else {
                
                return nil
                
            }
            
        }else{
             
            return nil
            
        }
        
        
    }
    
}
