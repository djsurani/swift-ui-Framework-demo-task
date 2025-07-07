//
//  Untitled.swift
//  swift-ui-Framework
//
//  Created by DhruvSurani on 7/6/25.
//

import SwiftUI

struct TaskPannelView: View {
    var task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .font(.title3)
                .scaleEffect(task.isCompleted ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: task.isCompleted)

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
                    .strikethrough(task.isCompleted, color: .gray)

                Text(task.category)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}
