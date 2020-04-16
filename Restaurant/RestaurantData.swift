//
//  RestaurantData.swift
//  Restaurant
//
//  Created by rina on 2020/04/12.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI

var locationManager = LocationManager()

///パラメータ
let keyid = "74b23a539fc6c885cc90952d648b6952"
var latitude = locationManager.lastLocation?.coordinate.latitude ?? 0
var longitude = locationManager.lastLocation?.coordinate.longitude ?? 0
var range = 2

//レスポンス構造体
struct Image_url: Codable {
    let shop_image1: String?
    let shop_image2: String?
    let qrcode: String?
}

struct Rest: Codable {
    let id: String
    let name: String
    let image_url: Image_url?  
    let address: String
    let tel: String
    let opentime: String
}

struct Errors: Codable {
    let code: Int
    let message: String
}

struct Response: Codable {
    let errors: Errors?
    let rest: [Rest]
}

struct wrapResponse: Codable {
    let response: Response
}



class Api {
    
    func getPosts() {
        
        guard let url = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=\(keyid)&latitude=&longitude=") else { return }
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(jsondata, response, error) in
            
            let decoder: JSONDecoder = JSONDecoder()
//            do {
                let json: Response = try! decoder.decode(Response.self, from: jsondata!)
                print(json)
                
//            } catch {
//                print("error: ", error.localizedDescription)
//            }
//            do {
//                let posts = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//
//                print(posts)
//
//            } catch {
//                print("errorです")
//            }
        })
        task.resume()
    }
}
