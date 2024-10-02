//
//  DigimonDetail.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/24/24.
//

import SwiftUI

struct DigimonDetail: View {
    @State var changeText = ""
    var digimonData: DigimonBook?
    var digimonName: String?
    var constants = Constants()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: digimonData?.img ?? "https://digimon.shadowsmith.com/img/koromon.jpg"), scale: 1)
            Text(digimonData?.name ?? "koncha")
            Text(digimonData?.level ?? "In Training")
            TextField("Name", text: $changeText)
                .padding(12)
                .background(
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                )
                .padding([.leading, .trailing], 16)
                .padding(.top, 8)
            Spacer().frame(height: constants.hieghtBetweenViews)
            Button("Change") {
                changeName(name: changeText)
            }.background(
                Capsule()
                    .fill(Color.white)
            )
        }
    }
    func changeName(name: String){
        digimonData?.name = name
    }
}

#Preview {
    DigimonDetail(digimonData: nil)
}
