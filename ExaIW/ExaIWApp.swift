//
//  ExaIWApp.swift
//  ExaIW
//
//  Created by CCDM31 on 14/11/22.
//

import SwiftUI

@main
struct ExaIWApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
