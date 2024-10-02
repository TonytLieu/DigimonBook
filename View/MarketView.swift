//
//  MarketView.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/26/24.
//

import SwiftUI

struct MarketView: View {
    @State var searchText = ""
    var constants = Constants()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TopSectionalView(title: constants.marketTitle)
                    .frame(height: constants.hieghtBetweenViews)
                //searchBar
                TextField("Search", text: $searchText)
                    .padding(12)
                    .background(
                        Capsule()
                            .fill(Color.gray.opacity(0.2))
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.top, 8)
                Spacer().frame(height: constants.hieghtBetweenViews)
                
                ScrollView(.vertical,  showsIndicators: false) {
                    //HotDeals
                    HotDealSectionView()
                    //Treading
                    TrendingSectionView()
                }
                .padding(.horizontal, 16)
            }
            .navigationBarBackButtonHidden(true)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    MarketView()
}
