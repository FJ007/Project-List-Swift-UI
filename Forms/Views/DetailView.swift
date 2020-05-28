//
//  DetailView.swift
//  Forms
//
//  Created by Javier Fernández on 26/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Environment (\.presentationMode) var presentationMode
    var game: Game
    
    var body: some View {
        VStack {
            Spacer()
            Image(game.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250, alignment: .center)
            Text(game.developer)
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
            Text(game.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.trailing)
            Text(game.genre.rawValue)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(game.platform.rawValue)
                .font(.caption)
            if game.description != nil {
                Text(game.description!)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(game: GamesFactory.games[2])
    }
}
