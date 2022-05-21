//
//  ContentView.swift
//  Africa
//
//  Created by Omar Abdulrahman on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
   
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    @State private var isGridViewActive: Bool = false
    
    //: MARK - FUNCTIONS
      
      func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
          toolbarIcon = "square.grid.2x2"
        case 2:
          toolbarIcon = "square.grid.3x2"
        case 3:
          toolbarIcon = "rectangle.grid.1x2"
        default:
          toolbarIcon = "square.grid.2x2"
        }
      }

    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach (animals) { animal in
                            NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                                AnimalListRowView(animal: animal)
                            } // : LINK
                        } // : LOOP
                    } // : LIST
                    .listStyle(.plain)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach (animals) { animal in
                                NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } // : NAV LINK
                            } // : LOOP
                        } // : GRID
                        .padding(10)
                        .animation(.easeIn)
                    } // : SCROLL
                } // : CONDITION
            } // : GROUP
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 8) {
                        Button(action : {
                            isGridViewActive = false
                            haptics.impactOccurred()
                            
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action : {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    } // : HSTACK
                } // : TOOLBAR ITEMS
            } // : TOOL BAR
        } // : NAV
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
