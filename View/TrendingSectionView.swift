//
//  TrendingSectionView.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/26/24.
//

import SwiftUI

struct TrendingSectionView: View {
    var constants = Constants()
    
    var body: some View {
        Text(constants.TrendingTitle)
            .bold()
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        //TrendingSection
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: constants.spaceBetweenItems){
                Items()
                
            }
        }
    }
}

#Preview {
    TrendingSectionView()
}
