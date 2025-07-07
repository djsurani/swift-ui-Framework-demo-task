//
//  swift_ui_FrameworkApp.swift
//  swift-ui-Framework
//
//  Created by DhruvSurani on 7/4/25.
//

import SwiftUI

@main
struct swift_ui_FrameworkApp: App {
    @StateObject var viewModel = TaskViewModel()
    init() {
           NotificationManager.shared.requestAuthorization()
           NotificationManager.shared.scheduleDailyReminder(atHour: 20) // 8 PM
       }
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
