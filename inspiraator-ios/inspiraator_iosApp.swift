//
//  inspiraator_iosApp.swift
//  inspiraator-ios
//
//  Created by Anti on 11.02.2022.
//

import SwiftUI

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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
