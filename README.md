# 📅 Daily Focus – A SwiftUI Productivity App

**Daily Focus** is a lightweight, modern task management app built entirely with SwiftUI using the MVVM architecture. Designed to help users stay focused and organized, it provides a clean interface for managing tasks, tracking progress, and staying consistent.

---

## 🔑 Key Features

- ✅ Add, delete, and categorize tasks
- ✅ Mark tasks as completed with animation
- ✅ View daily task completion stats with a visual progress bar
- ✅ Data persistence using `UserDefaults`
- ✅ Schedule local reminders using `UNUserNotificationCenter`

---

## 🧱 Built With

- **SwiftUI** – Declarative UI framework by Apple
- **MVVM Architecture** – Separation of UI, logic, and data
- **UserDefaults** – Lightweight persistence
- **Local Notifications** – Daily task reminder using system scheduler

---

## 💡 Architecture Overview

App.swift
│
├── ContentView.swift // Main task list + navigation
├── TaskViewModel.swift // Business logic + data binding
├── Task.swift // Task model (Codable, Identifiable)
├── AddTaskView.swift // Add new task via form
├── StatsView.swift // Show daily progress summary
└── NotificationManager.swift // Local notification setup



- `@ObservedObject` and `@Published` power real-time updates
- Custom components like `TaskPannelView` create reusable, clean UI



## 📲 Requirements

- iOS 16+
- Xcode 15+


## 📁 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/DailyFocus.git
2. Open DailyFocus.xcodeproj in Xcode
3. Run on simulator or real device (iOS 16+)
ℹ️ Make sure to enable notification permissions when prompted.

👨‍💻 Author

Dhruv Surani
iOS Developer | SwiftUI Enthusiast | Full-stack Enginee

📝 License
This project is licensed under the MIT License.



