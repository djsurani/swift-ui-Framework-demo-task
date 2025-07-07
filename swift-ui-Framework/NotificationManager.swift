//
//  NotificationManager.swift
//  swift-ui-Framework
//
//  Created by DhruvSurani on 7/6/25.
//

import UserNotifications
import Foundation

class NotificationManager {
    static let shared = NotificationManager()

    private init() {}

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("🔴 Notification permission error: \(error.localizedDescription)")
            }
            print("✅ Notification permission granted: \(granted)")
        }
    }

    func scheduleDailyReminder(atHour hour: Int = 20) {
        let content = UNMutableNotificationContent()
        content.title = "🧘 Daily Focus"
        content.body = "Have you completed your tasks today?"
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = hour

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "daily-reminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("🔴 Failed to schedule notification: \(error.localizedDescription)")
            } else {
                print("✅ Notification scheduled at \(hour):00")
            }
        }
    }
}
