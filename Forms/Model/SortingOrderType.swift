//
//  SortingOrderType.swift
//  Forms
//
//  Created by Javier Fernández on 02/06/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation

enum SortingOrderType: Int, CaseIterable {
    
    case alphabetical_AZ = 0
    case alphabetical_ZA = 1
    case rating = 2
    
    init (type: Int) {
        switch type {
        case 0:
            self = .alphabetical_AZ
        case 1:
            self = .alphabetical_ZA
        case 2:
            self = .rating
        default:
            self = .alphabetical_AZ
        }
    }
    
    var description: String {
        switch self {
        case .alphabetical_AZ:
            return "A-Z"
        case .alphabetical_ZA:
            return "Z-A"
        case .rating:
            return "Rating"
        }
    }
}
