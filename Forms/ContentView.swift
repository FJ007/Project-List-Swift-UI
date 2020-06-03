//
//  ContentView.swift
//  Forms
//
//  Created by Javier Fernández on 21/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var filters: UserPreferencesFilter
    @State private var games = GamesFactory.games
    @State private var showConfiguration = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(games
                    .filter(shouldApplyFilters)
                    .sorted(by: filters.sortedFilter.sortingOrder())) { game in
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
                    Image(systemName: someApplyFilter() ? "line.horizontal.3.decrease.circle" : "line.horizontal.3.decrease.circle.fill")
                    .font(.title)
                    .foregroundColor(.black)
                }
            )
            .sheet(isPresented: $showConfiguration) {
                FilterView().environmentObject(self.filters)
            }
        }
    }
    
    // MARK: - Funcs
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
    
    private func shouldApplyFilters(item game: Game) -> Bool {
        let checkFavorite = (game.isFavorited && filters.favoriteFilter) || !filters.favoriteFilter
        let checkFinished = (game.isFinished && filters.finishedFilter) || !filters.finishedFilter
        let checkRating = (Game.ratings(note: game.note) == filters.ratingFilter) || !filters.showRatingFilter
        return checkFavorite && checkFinished && checkRating
    }
    
    private func someApplyFilter() -> Bool {
        return  !self.filters.favoriteFilter &&
                !self.filters.finishedFilter &&
                !self.filters.showRatingFilter &&
                self.filters.sortedFilter == .alphabetical_AZ
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserPreferencesFilter())
    }
}
