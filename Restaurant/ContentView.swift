//
//  ContentView.swift
//  Restaurant
//
//  Created by rina on 2020/04/12.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    @State var radius = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Restaurant Searcher")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.orange)
                .padding()
                
            Text("現在地を取得し、周辺のレストランを検索します。")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
            
            Spacer()
            
            HStack {
                /*半径入力TextField*/
                TextField("ここで半径を入力", text: self.$radius).padding(.all).keyboardType(.numberPad)
                .border(Color.gray, width: 0.6)
                
                /*検索Button*/
                Button(action:{
                   
                }){
                    HStack {
                        Text("検索")
                            .fontWeight(.semibold)
                            .padding()
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 50)
                    .background(Color.orange)
                    .cornerRadius(50)
                }
            }
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*位置情報を取得Button
struct Location: View {
    
    @State var latitude = 0.0
    @State var longitude = 0.0
    
    var body: some View {
        
        Button(action:{
            print("位置情報")
        }){
            Text("位置情報を取得")
                .font(.body)
        }
        
    }
}
*/
