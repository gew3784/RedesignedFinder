//
//  ContentView.swift
//  Redesigned Finder
//
//  Created by Garrit Witters on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var filename = ""
    @State private var isFilePresent = false
    
    var body: some View {
        VStack {
            TextField("Enter file name", text: $filename)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                let utils = Utils()
                self.isFilePresent = utils.isFilePresentOnDesktop(filename: self.filename)
            }, label: {
                Text("Check if file exists")
            })
            if isFilePresent {
                Text("The file '\(filename)' exists on the desktop.")
                    .padding()
            } else {
                Text("The file '\(filename)' does not exist on the desktop.")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
