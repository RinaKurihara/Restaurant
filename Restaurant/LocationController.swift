//
//  LocationController.swift
//  Restaurant
//
//  Created by rina on 2020/04/12.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var lastLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    private let locationManager = CLLocationManager()
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location
    }
}
    
//class LocationController: NSObject, ObservableObject {
//
//    // 緯度
//    var latitudeNow: String = ""
//    // 経度
//    var longitudeNow: String = ""
//
//    /// ロケーションマネージャ
//    var locationManager: CLLocationManager!
//
//    /// "位置情報を取得"ボタンを押下した際、位置情報を取得
//    func getLocationInfo() {
//        // マネージャの設定
//        let status = CLLocationManager.authorizationStatus()
//        if status == .denied {
//            //showAlert()
//        } else if status == .authorizedWhenInUse {
//            self.latitude = latitudeNow
//            self.longitude = longitudeNow
//        }
//
//        print(latitude,longitude)
//    }
//
//
//    /// ロケーションマネージャのセットアップ
//    func setupLocationManager() {
//        locationManager = CLLocationManager()
//
//        // 権限をリクエスト
//        guard let locationManager = locationManager else { return }
//        locationManager.requestWhenInUseAuthorization()
//
//        // マネージャの設定
//        let status = CLLocationManager.authorizationStatus()
//
//        // ステータスごとの処理
//        if status == .authorizedWhenInUse {
//            locationManager.delegate = self
//            locationManager.startUpdatingLocation()
//        }
//    }
///*
//    /// アラートを表示する
//    func showAlert() {
//        let alertTitle = "位置情報取得が許可されていません。"
//        let alertMessage = "設定アプリの「プライバシー > 位置情報サービス」から変更してください。"
//        let alert: UIAlertController = UIAlertController(
//            title: alertTitle,
//            message: alertMessage,
//            preferredStyle:  UIAlertController.Style.alert
//        )
//        // OKボタン
//        let defaultAction: UIAlertAction = UIAlertAction(
//            title: "OK",
//            style: UIAlertAction.Style.default,
//            handler: nil
//        )
//        // UIAlertController に Action を追加
//        alert.addAction(defaultAction)
//        // Alertを表示
//        .sheet(isPresented: $isPresented) {
//            alert
//          }
//
//    }*/
//}
//
//extension LocationController: CLLocationManagerDelegate {
//
//    /// 位置情報が更新された際、位置情報を格納する
//    /// - Parameters:
//    ///   - manager: ロケーションマネージャ
//    ///   - locations: 位置情報
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations.first
//        let latitude = location?.coordinate.latitude
//        let longitude = location?.coordinate.longitude
//        // 位置情報を格納する
//        self.latitudeNow = String(latitude!)
//        self.longitudeNow = String(longitude!)
//    }

