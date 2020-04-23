//
//  RestaurantData.swift
//  Restaurant
//
//  Created by rina on 2020/04/12.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI
import Combine

var locationManager = LocationManager()

//RestData構造体
///ショップイメージ画像
struct Image_url: Codable {
    var shop_image1: String
    var shop_image2: String
    var qrcode: String
}
///レストラン詳細
struct Rest: Codable, Identifiable {
    let uuid = UUID()
    var id: String
    var name: String
    var image_url: Image_url
    var address: String
    var tel: String
    var opentime: String
}
///エラー
struct Errors: Codable {
    var code: Int
    var message: String
}

//レスポンス構造体
struct Response: Codable {
    var errors: Errors
    var rest: [Rest]
}

//API通信
class Api: ObservableObject {
    ///パラメータ
    let keyid = "74b23a539fc6c885cc90952d648b6952"
    var Latitude: Double {
        return locationManager.lastLocation?.coordinate.latitude ?? 0
    }

    var Longitude: Double {
        return locationManager.lastLocation?.coordinate.longitude ?? 0
    }
    
    //APIレスポンス
    @Published var rest: [Rest] = []
    
    func getRestDada(param: Param) {
        let latitude = Latitude
        let longitude = Longitude
        
        ///ぐるなびAPI_URL
        guard let url = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=\(keyid)&latitude=\(latitude)&longitude=\(longitude)&range=\(param.range)") else { return }
        
        //URL通信
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(jsondata, response, error) in

            ///JSONデコード処理
            let decoder: JSONDecoder = JSONDecoder()
            let responses: Response = try! decoder.decode(Response.self, from: jsondata!)

            self.rest = responses.rest
        })
        //task実行
        task.resume()
    }

}
