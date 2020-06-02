//
//  FilterView.swift
//  Forms
//
//  Created by Javier Fernández on 28/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    
    var defaults: SetupUserDefaults
    @Environment (\.presentationMode) var presentationModedMode
    
    @State private var selectedSorted = SortingOrderType.alphabetical_AZ
    @State private var showOnlyFavorite = false
    @State private var showOnlyFinished = false
    @State private var showRating = false
    @State private var ratingStars = 1 {
        didSet {
            if ratingStars > 5 {
                ratingStars = 5
            }
            if ratingStars < 1 {
                ratingStars = 1
            }
        }
    }
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("ORDER TYPE")) {
                    Picker(selection: $selectedSorted, label: Text("Select mode")) {
                        ForEach(SortingOrderType.allCases, id:\.self) { typeOrder in
                            Text("\(typeOrder.description)")
                        }
                    }
                }
                Section(header: Text("FILTER BY")) {
                    Toggle(isOn: $showOnlyFavorite) {
                        Text("Favorites")
                    }
                    Toggle(isOn: $showOnlyFinished) {
                        Text("Finished")
                    }
                    Toggle(isOn: $showRating) {
                        Text("Show rating")
                    }
                    if self.showRating {
                        Stepper(onIncrement: {
                            self.ratingStars += 1
                        }, onDecrement: {
                            self.ratingStars -= 1
                        }) {
                            HStack{
                                ForEach(0..<self.ratingStars, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.orange)
                                }
                            }
                        }.animation(.default)
                    }
                }
            }
            .navigationBarTitle(Text("Configuration"))
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.presentationModedMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                ,trailing:
                    Button(action: {
                        // Save data
                        self.defaults.sortedFilter = self.selectedSorted
                        self.defaults.favoriteFilter = self.showOnlyFavorite
                        self.defaults.finishedFilter = self.showOnlyFinished
                        self.defaults.showRatingFilter = self.showRating
                        self.defaults.ratingFilter = self.ratingStars
                        self.presentationModedMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                            .foregroundColor(.black)
                            .bold()
                    }
            )
        }
        .onAppear {
            // Get Data
            self.selectedSorted = self.defaults.sortedFilter
            self.showOnlyFavorite = self.defaults.favoriteFilter
            self.showOnlyFinished = self.defaults.finishedFilter
            self.showRating = self.defaults.showRatingFilter
            self.ratingStars = self.defaults.ratingFilter
        }
    }
}



struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(defaults: SetupUserDefaults())
    }
}
