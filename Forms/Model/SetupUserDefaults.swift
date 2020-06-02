//
//  SettingsFactory.swift
//  Forms
//
//  Created by Javier Fernández on 02/06/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation

enum Key: String {
    case sorted = "filter.view.sorted"
    case favorite = "filter.view.favorite"
    case finished = "filter.view.finished"
    case showRating = "filter.view.showRating"
    case rating = "filter.view.rating"
}

final class SetupUserDefaults {
    
    var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            Key.sorted.rawValue : 0,
            Key.favorite.rawValue : false,
            Key.finished.rawValue : false,
            Key.showRating.rawValue : false,
            Key.rating.rawValue : 1
        ])
    }
    
    var sortedFilter: SortingOrderType {
        get{
            SortingOrderType(type: defaults.integer(forKey: Key.sorted.rawValue))
        }
        set{
            defaults.set(newValue.rawValue, forKey: Key.sorted.rawValue)
        }
    }
    
    var favoriteFilter: Bool {
        get{
            defaults.bool(forKey: Key.favorite.rawValue)
        }
        set{
            defaults.set(newValue, forKey: Key.favorite.rawValue)
        }
    }
    
    var finishedFilter: Bool {
        get{
            defaults.bool(forKey: Key.finished.rawValue)
        }
        set{
            defaults.set(newValue, forKey: Key.finished.rawValue)
        }
    }
    
    var showRatingFilter: Bool {
        get{
            defaults.bool(forKey: Key.showRating.rawValue)
        }
        set{
            defaults.set(newValue, forKey: Key.showRating.rawValue)
        }
    }
    
    var ratingFilter: Int {
        get{
            defaults.integer(forKey: Key.rating.rawValue)
        }
        set{
            defaults.set(newValue, forKey: Key.rating.rawValue)
        }
    }
    
}
