//
//  ContentView.swift
//  Restaurant
//
//  Created by rina on 2020/04/12.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI
import CoreLocation
import Combine


///APIパラメータ
class Param: ObservableObject {
    @Published var range = 2
}

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView{
            VStack {
                Title()
                Text("現在地を取得し、周辺のレストランを検索します。")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Spacer()
                Text("半径何m以内を検索するか選べます。")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .padding()

                Search()
            }
        }.padding()
    }

}

///タイトル
struct Title: View {
    var body: some View {
        Text("Restaurant")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color.orange)
            .padding()
    }
}


struct Search: View {
    @EnvironmentObject var param: Param
    
    var body: some View {
        VStack {
            ///半径選択
            Picker(selection: self.$param.range, label: EmptyView()) {
                Text("300m").tag(1)
                Text("500m").tag(2)
                Text("1000m").tag(3)
                Text("2000m").tag(4)
                Text("3000m").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(height: 90)
                
            
            ///検索ボタン
            NavigationLink (destination: RestList()) {
                Text("検索")
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)
                    .background(Color.orange)
                    .cornerRadius(50)
            }
            .shadow(radius: 13)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(Param())
    }
}
