//
//  CryptoListCell.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 23/02/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CryptoListCell: View {
    
    var coin: Coin
    
    var body: some View {
        NavigationLink(
            destination: CryptoDetailsView(coin: coin)
                .navigationBarTitle("", displayMode: .inline)
        ) {
            HStack(alignment: .center) {
                RoundImage(imageLink: "https://cryptocompare.com/\(coin.imageUrl)")
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(Font.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.black)
                    Text("\(coin.shortName)")
                        .foregroundColor(Color.black)
                        .font(Font.system(size: 10, weight: .medium))
                }
                
                Spacer()
                
                if let price = coin.price.value, let formattedPrice = price.toString() {
                    Text("\(formattedPrice)€")
                        .padding(.trailing, 10)
                        .foregroundColor(Color.black)
                        .font(Font.system(size: 15, weight: .semibold))
                }
            }
        }
    }
}
