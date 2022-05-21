//
//  AnimalDetailsView.swift
//  Africa
//
//  Created by Omar Abdulrahman on 1/4/22.
//

import SwiftUI

struct AnimalDetailsView: View {
    
    // MARK: - PROPERIES
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                
                // TITLE
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 22)
                    )
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                   
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                // MAP
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                   ExternalWebLinkView(animal: animal)
                        .padding(.bottom, 10)
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Learn More about \(animal.name)", displayMode: .inline)
        } // : SCROLL
        
    }
}

// MARK: - PREVIEW
struct AnimalDetailsView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        AnimalDetailsView(animal: animals[0])
    }
}
