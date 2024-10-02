//
//  ContentView.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/23/24.
//

import SwiftUI

struct HomeDigimon: View {
    @StateObject var digimonViewMachine = digimonMachine()
    @State var textName = "Tony"
    var DigiWorldEndpoint = ApiEndpoints().digimonEndpoint
    var constants = Constants()
    var body: some View {
        NavigationStack {
            HStack {
                Button("Refresh") {
                    refreshButton()
                }
                Spacer().frame(width: 40)
                NavigationLink(constants.marketTitle) {
                    MarketView()
                }
            }
            List(digimonViewMachine.digimonBook) { digimonBook in
                NavigationLink(digimonBook.name + " " + textName,
                               destination: DigimonDetail(digimonData: digimonBook, textName: $textName))
            }.onAppear() {
                digimonViewMachine.getDigimonBook(url: DigiWorldEndpoint)
                if digimonViewMachine.customError == nil{
                    
                }else {
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func refreshButton(){
        DispatchQueue.main.async {
            digimonViewMachine.getDigimonBook(url: DigiWorldEndpoint)
        }
    }
}

#Preview {
    HomeDigimon(digimonViewMachine: digimonMachine())
}
