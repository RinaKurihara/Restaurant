//
//  RestList.swift
//  Restaurant
//
//  Created by rina on 2020/04/16.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI
import Combine

struct RestList: View {
    @EnvironmentObject var param: Param
    @State var RestData: [Rest] = []
    
    var body: some View {
        VStack{

            List(RestData) { rest in
                    Text(rest.name)

            }
            .onAppear {
                Api().getRestData(param: self.param) { (RestData) in
                    self.RestData = RestData
                    }
            }
        }
    }
}

struct RestList_Previews: PreviewProvider {
    static var previews: some View {
        RestList()
        .environmentObject(Param())
    }
}
