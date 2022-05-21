//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Omar Abdulrahman on 1/4/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                    .foregroundColor(.accentColor)

                Text("Wikipedia")
                
                Spacer()
               
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: "https://wikipedia.org")!))
                } // : GROP
                .foregroundColor(.accentColor)

            } // : HSTACK
        } // : GROP BOX
    }
}
 
// MARK: - PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWebLinkView(animal: animals[1])
    }
}
