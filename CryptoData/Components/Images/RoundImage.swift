//
//  RoundImage.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 23/02/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct RoundImage: View {
    
    var imageLink: String
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: imageLink))
                .resizable()
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}
