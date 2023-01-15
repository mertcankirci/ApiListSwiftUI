//
//  ApiFetchleDataSokCikarApp.swift
//  ApiFetchleDataSokCikar
//
//  Created by Mertcan Kırcı on 7.01.2023.
//

import SwiftUI

@main
struct ApiFetchleDataSokCikarApp: App {
    @EnvironmentObject var network : Network
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Network())
        }
    }
}
