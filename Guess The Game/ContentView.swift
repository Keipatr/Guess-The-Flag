//
//  ContentView.swift
//  Guess The Game
//
//  Created by MacBook Pro on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    var angkaRandom = Int.random(in: 0...9)
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[angkaRandom])
                    .foregroundStyle(.black)
            }
          
        }
        
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
        }
        
        
    }
    
    func printConsole() {
        print("Hai")
    }
    
    func buttonBerbahaya(){
        print("wow")
    }
}

#Preview {
    ContentView()
}
