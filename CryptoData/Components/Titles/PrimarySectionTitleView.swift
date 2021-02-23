//
//  PrimarySectionTitle.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation
import SwiftUI

struct PrimarySectionTitleView: View {
    
    var title: String
    
    var body: some View {
            Text(title)
                .font(Font.system(size: 35))
                .fontWeight(.heavy)
                .foregroundColor(Color(Colors.primarySectionTitleColor))
    }
}

struct PrimarySectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PrimarySectionTitleView(title: "Currencies")
    }
}
