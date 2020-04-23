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
    @ObservedObject var response = Api()
    
    
    var body: some View {
        List(response.rest) { (rest) in
            RestRow(rest: rest)
        }
    }
}


struct RestList_Previews: PreviewProvider {
    static var previews: some View {
        RestList()
        .environmentObject(Param())
        .environmentObject(Api())
    }
}
