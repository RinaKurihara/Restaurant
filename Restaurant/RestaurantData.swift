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

//ショップイメージ画像
struct Image_url: Codable {
    let shop_image1: String?
    let shop_image2: String?
    let qrcode: String?
}
//レストラン詳細
struct Rest: Codable, Identifiable {
    let uuid = UUID()
    let id: String
    let name: String
    let image_url: Image_url?  
    let address: String
    let tel: String
    let opentime: String
}
//エラー
struct Errors: Codable {
    let code: Int
    let message: String
}
//APIレスポンス
struct Response: Codable {
    let errors: Errors?
    let rest: [Rest]
}

//API通信
class Api {
    
    func getRestData(completion: @escaping ([Rest]) -> ()) {
        
        guard let url = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=\(keyid)&latitude=&longitude=") else { return }
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(jsondata, response, error) in
            
            let decoder: JSONDecoder = JSONDecoder()
                let RestData: Response = try! decoder.decode(Response.self, from: jsondata!)
               
            DispatchQueue.main.async {
                completion(RestData.rest)
            }
        })
        task.resume()
    }
}
