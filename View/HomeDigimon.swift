//
//  ContentView.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/23/24.
//

import SwiftUI

struct HomeDigimon: View {
    @StateObject var digimonViewMachine = digimonMachine()
    var DigiWorldEndpoint = ApiEndpoints().digimonEndpoint
    
    var body: some View {
        Button("Refresh") {
            refreshButton()
        }
        
        NavigationStack {
            List(digimonViewMachine.digimonBook) { digimonBook in
               NavigationLink(digimonBook.name,
                              destination: DigimonDetail(digimonImage: digimonBook.img ?? "noImage",
                                                         digimonName: digimonBook.name,
                                                         digimonLevel: digimonBook.level ?? "0"))
           }.onAppear() {
               digimonViewMachine.getDigimonBook(url: DigiWorldEndpoint)
           }
        }
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
