//
//  Connection.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/23/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

class Connection {
    var request : URLRequest?
    
    func get(url: String?,param: [String:Any]? ,closure: @escaping (Data?,String?) -> Void){
        var endpointUrl = URLComponents(string: url ?? "")
        
        if param != nil {
            for (key,value) in param!{
                endpointUrl?.queryItems = [
                    URLQueryItem(name: key, value: value as? String)
                ]
            }
        }
        
        request = URLRequest(url: (endpointUrl?.url!)!)
        request?.httpMethod = "GET"
        request?.httpBody = param?.percentEscaped().data(using: .utf8)
        request?.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request?.addValue("application/json", forHTTPHeaderField: "Accept")
        
        print(request?.description ?? "")
        URLSession.shared.dataTask(with: request!) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse else{
                    return
                }
                ///Si existe un Objeto de error aqui lo podriamos retornar
                switch(httpResponse.statusCode){
                case 200:
                    closure(data,nil)
                    print("Servicio exitoso")
                    break
                case 404:
                    closure(nil,"Servicio no Encontrado")
                    print("Servicio no Encontrado")
                    break
                default:
                    closure(nil,"el servicio regreso un codigo \(httpResponse.statusCode)")
                    print("el servicio regreso un codigo \(httpResponse.statusCode)")
                    break
                }
        }.resume()
    }
}
