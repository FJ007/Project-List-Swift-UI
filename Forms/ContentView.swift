//
//  ContentView.swift
//  Forms
//
//  Created by Javier Fernández on 21/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var defaults: SetupUserDefaults
    
    @State private var games = GamesFactory.games
    @State private var showConfiguration = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(games) { game in
                    NavigationLink(destination: DetailView(game: game)) {
                        CellView(game: game)
                            .frame(width: 370, height: 215, alignment: .center)
                            .contextMenu {
                                Button(action: {
                                    self.setFavorite(item: game)
                                }) {
                                    HStack{
                                        Text(game.isFavorited ? "No Favorite" : "Favorite")
                                        Image(systemName: game.isFavorited ? "heart" : "heart.fill")
                                    }
                                }
                                Button(action: {
                                    self.setFinished(item: game)
                                }) {
                                    HStack{
                                        Text(game.isFinished ? "No Finished" : "Finished")
                                        Image(systemName: game.isFinished ? "circle" : "checkmark.circle")
                                    }
                                }
                                Button(action: {
                                    self.deleted(item: game)
                                }) {
                                    HStack{
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                            }
                    }
                }.onDelete { (indexSet) in
                    self.games.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle(Text("Top Games"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.showConfiguration = true
                }) {
                   Image(systemName: "line.horizontal.3.decrease.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                }
            )
            .sheet(isPresented: $showConfiguration) {
                FilterView(defaults: self.defaults)
            }
        }
    }
    
    private func setFavorite(item game: Game) {
        if let index = games.firstIndex(where: {$0.id == game.id}) {
           games[index].isFavorited.toggle()
        }
    }
    
    private func setFinished(item game: Game) {
        if let index = games.firstIndex(where: {$0.id == game.id}) {
            games[index].isFinished.toggle()
        }
    }
    
    private func deleted(item game: Game) {
        if let index = games.firstIndex(where: {$0.id == game.id}) {
            games.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(defaults: SetupUserDefaults())
    }
}
