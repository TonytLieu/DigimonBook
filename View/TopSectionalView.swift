//
//  TopSectionalView.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/27/24.
//

import SwiftUI

struct TopSectionalView: View {
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                //backButton
                Button("Back") {
                }
                Spacer().frame(width: geometry.size.width * 0.2)
                //Title of screen
                Text(title)
                    .font(.title)
                    .bold()
                Spacer().frame(width: geometry.size.width * 0.2)
                //filter
                Button("Filter") {
                }
            }.frame(maxWidth: .infinity, alignment: .top)
        }
    }
}

#Preview {
    TopSectionalView(title: "Somthing")
}
