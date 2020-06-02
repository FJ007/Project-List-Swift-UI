//
//  FilterView.swift
//  Forms
//
//  Created by Javier Fernández on 28/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    
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
                    }
                ,trailing:
                    Button(action: {
                        self.presentationModedMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                            .bold()
                    }
            )
        }
    }
}



struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
