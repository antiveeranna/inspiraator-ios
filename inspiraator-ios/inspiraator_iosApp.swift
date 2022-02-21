//
//  inspiraator_iosApp.swift
//  inspiraator-ios
//
//  Created by Anti on 11.02.2022.
//

import SwiftUI
import Intents

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var releaseVersionNumberPretty: String {
        return "v\(releaseVersionNumber ?? "1.0.0")"
    }
}


@main
struct inspiraator_iosApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {phase in
            INPreferences.requestSiriAuthorization({status in
                
            })
        }
    }
}
