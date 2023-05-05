//
//  Redesigned_FinderApp.swift
//  Redesigned Finder
//
//  Created by Garrit Witters on 5/4/23.
//

import SwiftUI

class Utils {
    func isFilePresentOnDesktop(filename: String) -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)
        if let desktopPath = paths.first {
            do {
                let files = try FileManager.default.contentsOfDirectory(atPath: desktopPath)
                let isFileFound = files.contains { $0 == filename }
                return isFileFound
            } catch {
                print("Error: \(error)")
            }
        } else {
            print("Unable to get desktop path")
        }
        return false
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
