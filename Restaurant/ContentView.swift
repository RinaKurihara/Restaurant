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
    
    var body: some View {
        VStack {
            Spacer()
            Title()
            
            Text("現在地を取得し、周辺のレストランを検索します。")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
            
            Spacer()
            
            Text("半径何m以内を検索するか選べます。")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
            
            Search()
            
        }.padding()
    }
}

struct Title: View {
    var body: some View {
        Text("Restaurant Searcher")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color.orange)
            .padding()
    }
}


struct Search: View {
    @State var range = 2
    
    var body: some View {
        VStack {
            Picker(selection: $range, label: Text("set range")) {
                Text("300m").tag(1)
                Text("500m").tag(2)
                Text("1000m").tag(3)
                Text("2000m").tag(4)
                Text("3000m").tag(5)
            }.pickerStyle(SegmentedPickerStyle())
                .frame(height: 100)
            /*検索Button*/
            Button(action:{
//                RestList()
            }){
                
                Text("検索")
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)
                    .background(Color.orange)
                    .cornerRadius(50)
            }
            .shadow(radius: 50)
            
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
}
