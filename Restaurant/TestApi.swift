//
//  TestApi.swift
//  Restaurant
//
//  Created by rina on 2020/04/12.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI

struct TestApi: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear() {
                Api().getPosts()
        }
    }
}

struct TestApi_Previews: PreviewProvider {
    static var previews: some View {
        TestApi()
    }
}
