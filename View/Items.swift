//
//  Items.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/26/24.
//

import SwiftUI

struct Items: View {
    let constants = Constants()
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://digimon.shadowsmith.com/img/koromon.jpg"), scale: 1.5)
            Text("Item #1 Name")
                .frame(maxWidth: .infinity, 
                       alignment: .leading)
            Text("Goes Here")
                .frame(maxWidth: .infinity, 
                       alignment: .leading)
            Text("$19.99")
                .bold()
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            Spacer()
            
        }
    }
}

#Preview {
    Items()
}
