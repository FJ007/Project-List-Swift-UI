//
//  Game.swift
//  Forms
//
//  Created by Javier Fernández on 23/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation



enum Platform: String {
    case PSX, PS2, PS3, PS4, PS5, PSVITA, PSP
    case Xbox, Xbox360, XboxOne, XboxOneX, XboxOneS, XboxSeriesX
    case N64, GameCube, Wii, WiiU, NintedoSwitch, SwitchLite
    case PC, Mobile, iOS, Android, Multiplatform, VR
}

enum Genre: String {
    case Unknow, Adventure, Action, RPG, Casual, FPS, Puzzle, Arcade, HackSlash, Sandbox, BattleRoyale, Sports
}

struct Game: Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var developer: String
    var genre: Genre
    var platform: Platform
    var image: String
    var note: Int
    var isFinished: Bool = false
    var isFavorited: Bool = false
    var isGOTY: Bool = false
    
    
    static func ratings(note: Int) -> Int {
        switch note {
        case 1...4:
            return 1
        case 5:
            return 2
        case 6...7:
            return 3
        case 8...9:
            return 4
        case 10:
            return 5
        default:
            return 1
        }
    }
}


