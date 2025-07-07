//
//  StatsView.swift
//  swift-ui-Framework
//
//  Created by DhruvSurani on 7/6/25.
//

import SwiftUI

struct StatsView: View {
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("📊 Today's Stats")
                .font(.title)
                .bold()
                .padding(.top)

            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Total Tasks:")
                    Spacer()
                    Text("\(viewModel.totalTasks)")
                }

                HStack {
                    Text("Completed:")
                    Spacer()
                    Text("\(viewModel.completedTasks)")
                }

                VStack(alignment: .leading) {
                    Text("Progress:")
                    ProgressView(value: viewModel.completionRate)
                        .accentColor(.green)
                        .frame(height: 12)
                }

                Text("\(Int(viewModel.completionRate * 100))% complete")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 2)

            Spacer()
        }
        .padding()
        .navigationTitle("Stats")
    }
}
