//
//  HotDealSectionView.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/26/24.
//

import SwiftUI

struct HotDealSectionView: View {
    var constants = Constants()
    
    var body: some View {
        Text(constants.HotDealsTitle)
            .bold()
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        //HotDealsSection
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: constants.spaceBetweenItems) {
                Items()
                Items()
            }
        }
    }
}

#Preview {
    HotDealSectionView()
}
