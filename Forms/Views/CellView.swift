//
//  CellDefaultView.swift
//  Forms
//
//  Created by Javier Fernández on 23/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct CellView: View {
    
    var game: Game
    var maxStars = 5
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(width: 350, height: 205, alignment: .center)
            .foregroundColor(.white)
            //.shadow(radius: 4)
            .overlay(
                HStack {
                    Image(game.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:70, height: 120)
                        .padding(15)
                        .clipped()
                        .layoutPriority(0)
                    Spacer()
                    VStack (alignment: .leading) {
                        Spacer()
                        HStack {
                            Image(systemName: game.isFinished ? "checkmark.circle" : "circle")
                                .font(.body)
                                .foregroundColor(.green)
                                .padding(.horizontal, 5)
                            Spacer()
                            if game.description != nil {
                                Image(systemName: "doc.text")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 5)
                            }
                            if game.isGOTY {
                               Image(systemName: "rosette")
                                .font(.body)
                                .foregroundColor(.orange)
                                .padding(.horizontal, 5)
                            }
                            Image(systemName: game.isFavorited ? "heart.fill" : "heart")
                                .font(.body)
                                .foregroundColor(.red)
                                .padding(.horizontal, 5)
                        }
                        .padding(.trailing, 5)
                        Spacer()
                        Text(game.developer)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        Text(game.name)
                            .font(.title)
                            .foregroundColor(.primary)
                            .bold()
                            .lineLimit(2)
                        HStack {
                            Text("\(game.genre.rawValue)")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .layoutPriority(10)
                            Text("\(game.platform.rawValue)")
                                .font(.callout)
                                .fontWeight(.light)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.trailing)
                                .layoutPriority(5)
                        }
                        .padding(.bottom, 5)
                        HStack{
                            VStack (alignment: .leading) {
                                Text("Rating".uppercased())
                                    .font(.caption)
                                    .fontWeight(.thin)
                                    .foregroundColor(.secondary)
                                ZStack (alignment: .leading) {
                                    HStack {
                                        ForEach(1..<maxStars + 1) { index in
                                            Image(systemName: "star")
                                                .font(.body)
                                                .foregroundColor(.orange)
                                        }
                                    }
                                    HStack {
                                        ForEach(1..<Game.ratings(note: game.note) + 1) { index in
                                            Image(systemName: "star.fill")
                                                .font(.body)
                                                .foregroundColor(.orange)
                                        }
                                    }
                                }
                            }
                            Spacer()
                            Text("\(game.note)")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 35, height: 35)
                                .padding(10)
                                .background(Range(1...5).contains(game.note) ? Color.red :
                                            game.note == 10 ? Color.blue : Color.green)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 5)
                        Spacer()
                    }.layoutPriority(1)
                    Spacer()
                }
                
        )
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(game: Game(name: "Spiderman",
                                   description: "",
                                   developer: "Insomniac Games",
                                   genre: .Adventure,
                                   platform: .PS4,
                                   image: "spiderman",
                                   note: 10,
                                   isFinished: true,
                                   isFavorited: true,
                                   isGOTY: true))
    }
}

