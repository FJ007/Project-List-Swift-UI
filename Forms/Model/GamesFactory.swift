//
//  GamesFactory.swift
//  Forms
//
//  Created by Javier Fernández on 25/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation

struct GamesFactory {
    static var games = [
        Game(name: "Death Stranding",
             description: nil,
             developer: "Kojima Productions",
             genre: .Adventure,
             platform: .PS4,
             image: "deathstranding",
             note: 8,
             isFinished: true,
             isFavorited: true,
             isGOTY: false),
        Game(name: "Spiderman",
             description: nil,
             developer: "Insomniac Games",
             genre: .Adventure,
             platform: .PS4,
             image: "spiderman",
             note: 9,
             isFinished: true,
             isFavorited: true,
             isGOTY: false),
        Game(name: "God of War",
             description:
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam ex ut nibh fermentum, eget porta lorem hendrerit. In eleifend magna eu ornare volutpat. In
            blandit elitvitae neque dignissim aliquam. Nulla feugiat nec velit vel imperdiet. Curabitur eleifend gravida nunc, vel aliquam lacus dictum id. In maximus felis in
            sollicitudin imperdiet. Phasellus faucibus eleifend leo et venenatis. Cras tempus, augue nec molestie tincidunt, nisi nisi vehicula nisi, id semper tortor dui sed
            nisi.
            """,
             developer: "Santa Mónica Studios",
             genre: .Adventure,
             platform: .PS4,
             image: "godofwar",
             note: 10,
             isFinished: true,
             isFavorited: true,
             isGOTY: true),
        Game(name: "Ratchet and Clank",
             description: nil,
             developer: "Insomniac Games",
             genre: .Action,
             platform: .PS4,
             image: "ratchetclank",
             note: 8,
             isFinished: true,
             isFavorited: false,
             isGOTY: false),
        Game(name: "Final Fantasy VII",
             description:
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam ex ut nibh fermentum, eget porta lorem hendrerit. In eleifend magna eu ornare volutpat. In
            blandit elitvitae neque dignissim aliquam. Nulla feugiat nec velit vel imperdiet. Curabitur eleifend gravida nunc, vel aliquam lacus dictum id. In maximus felis in
            sollicitudin imperdiet. Phasellus faucibus eleifend leo et venenatis. Cras tempus, augue nec molestie tincidunt, nisi nisi vehicula nisi, id semper tortor dui sed
            nisi.
            """,
             developer: "Square Enix",
             genre: .RPG,
             platform: .PS4,
             image: "finalfantasy7",
             note: 9,
             isFinished: false,
             isFavorited: false,
             isGOTY: false),
        Game(name: "The Last of Us II",
             description:
            """
             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin aliquam ex ut nibh fermentum, eget porta lorem hendrerit. In eleifend magna eu ornare volutpat. In
             blandit elitvitae neque dignissim aliquam. Nulla feugiat nec velit vel imperdiet. Curabitur eleifend gravida nunc, vel aliquam lacus dictum id. In maximus felis in
             sollicitudin imperdiet. Phasellus faucibus eleifend leo et venenatis. Cras tempus, augue nec molestie tincidunt, nisi nisi vehicula nisi, id semper tortor dui sed
             nisi.
             """,
             developer: "Naughty Dog",
             genre: .Adventure,
             platform: .PS4,
             image: "thelastofus2",
             note: 10,
             isFinished: false,
             isFavorited: true,
             isGOTY: false)
    ]
}
