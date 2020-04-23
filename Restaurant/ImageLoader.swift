//
//  ImageLoader.swift
//  Restaurant
//
//  Created by rina on 2020/04/21.
//  Copyright © 2020 rina kurihara. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadData: Data? = nil
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
}
