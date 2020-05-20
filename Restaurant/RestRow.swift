//
//  RestRow.swift
//  Restaurant
//
//  Created by rina on 2020/04/22.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI

struct RestRow: View {
    var rest : Rest
    @State private var Url = ""
    
    
    var body: some View {
        VStack {
            Text(rest.name)
            Text(rest.address)
            URLImage(url: rest.image_url.shop_image1)
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct RestRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RestRow(rest:Api().rest[0])
            .previewLayout(.fixed(width: 300, height: 400)) //仮
        }
    }
}
