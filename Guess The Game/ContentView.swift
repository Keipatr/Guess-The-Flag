//
//  ContentView.swift
//  Guess The Game
//
//  Created by MacBook Pro on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philippines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    @State var jawabBenar = []
    @State var angkaRandom = Int.random(in: 0...9)
    @State private var cekBenar = 0
    @State private var cekSalah = 0
    @State private var cekHasil = false

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
        .alert(isPresented: $cekHasil) {
                    Alert(
                        title: Text("Game Over"),
                        message: Text("Tebakan Total : \(cekBenar + cekSalah) | Wrong: \(cekSalah)"),
                        dismissButton: .default(Text("Main Ulang!")) {
                            playAgain()
                        }
                    )
                }
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        cekJawab(number: number)
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
                        cekJawab(number: number)
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
    
    func cekJawab(number: Int) {
        if asean[number] == asean[angkaRandom]
        {
            cekBenar += 1
            jawabBenar.append(asean[angkaRandom])
            if cekBenar == 10
            {
                cekHasil = true
            }
            else
            {
                randomize()
            }
        }
        else
        {
            cekSalah += 1
            randomize()
        }
        
    }
    
    func randomize(){
        repeat {
                    angkaRandom = Int.random(in: 0..<asean.count)
        } while jawabBenar.contains(where: { $0 as! String == asean[angkaRandom] })
    }
    
    func playAgain(){
        asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philippines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
        jawabBenar = []
        angkaRandom = Int.random(in: 0...9)
        cekBenar = 0
        cekSalah = 0
        cekHasil = false
    }
}

#Preview {
    ContentView()
}
