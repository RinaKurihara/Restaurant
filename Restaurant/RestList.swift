//
//  RestList.swift
//  Restaurant
//
//  Created by rina on 2020/04/16.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI

struct RestList: View {
    
    @State var RestData: [Rest] = []
    
    var body: some View {
        VStack{
            
            List(RestData) { rest in
                Text(rest.name)
            }
            .onAppear {
                Api().getRestData { (RestData) in
                    self.RestData = RestData
                    }
            }
        }
    }
}

struct RestList_Previews: PreviewProvider {
    static var previews: some View {
        RestList()
    }
}
