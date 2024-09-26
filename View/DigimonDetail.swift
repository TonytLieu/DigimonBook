//
//  DigimonDetail.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/24/24.
//

import SwiftUI

struct DigimonDetail: View {
    var digimonImage: String
    var digimonName: String
    var digimonLevel: String
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: digimonImage), scale: 1)
            Text("Name: " + digimonName)
            Text("Level: " + digimonLevel)
        }
    }
}

#Preview {
    DigimonDetail(digimonImage: "https://digimon.shadowsmith.com/img/koromon.jpg",
                  digimonName: "Koromon",
                  digimonLevel: "In Training")
}
