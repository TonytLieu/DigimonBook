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
   @Binding var textName: String
    var constants = Constants()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: digimonData?.img ?? "https://digimon.shadowsmith.com/img/koromon.jpg"), scale: 1)
            Text(textName)
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
        .navigationBarBackButtonHidden(true)
    }
    func changeName(name: String){
        textName = name
    }
}

struct DigimonDetail_Previews: PreviewProvider {
    @State static var previewName = "Agumon" // Dummy state for the preview

    static var previews: some View {
        DigimonDetail(digimonData: nil, textName: $previewName) // Pass the binding to previewName
    }
}
