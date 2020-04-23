//
//  URLImage.swift
//  Restaurant
//
//  Created by rina on 2020/04/21.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    let url: String
    @ObservedObject private var imageloader = ImageLoader()
    
    init(url: String) {
        self.url = url
        self.imageloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageloader.downloadData {
            let ing = UIImage(data: imageData)
            return VStack {
                Image(uiImage: ing!).resizable()
            }
            
        } else {
            return VStack {
                Image(uiImage: UIImage(systemName: "placeholder")!).resizable()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url:"https://rimage.gnst.jp/rest/img/gc39274r0000/t_0063.jpg")
    }
}
