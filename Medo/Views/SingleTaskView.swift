//
//  SingleTaskView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct SingleTaskView: View {
    @AppStorage(AppStorageStrings.show_time_stamp) var show_time_stamp = true

    let title: String
    let priority: Priority
    let timestamp: Date

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                }
                Group {
                    if show_time_stamp {
                    Text(timestamp, formatter: itemFormatter)
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                    }
                }
            }

            Group {
                switch priority {
                case .low:
                    PriorityLineView(color1: .teal, color2: .blue)
                case .medium:
                    PriorityLineView(color1: .orange, color2: .pink)
                case .high:
                    PriorityLineView(color1: .pink, color2: .red)
                }
            }
            .font(.title3.bold())
            .foregroundColor(.orange)
        }
        .padding(6)
        .background(VisualEffectView(material: .fullScreenUI, blendingMode: .behindWindow))
        .overlay(RoundedRectangle(cornerRadius: 4)
            .stroke(.linearGradient(.init(colors: [
                .white.opacity(0.25),
                .white.opacity(0.5),
                priority == .low ? .blue.opacity(0.75) :   priority == .medium ? .orange.opacity(0.75) : .pink.opacity(0.75)
            ]), startPoint: .top, endPoint: .bottom), lineWidth: 1.5)
                .shadow(color:
                            priority == .low ? .blue :   priority == .medium ? .orange : .pink, radius: 5
                        ,x: 0, y: 0)


        )
    }
}

struct PriorityLineView: View {
    let color1: Color
    let color2: Color

    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: .init(colors: [color1, color2]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .frame(height: 2)
            .shadow(color: color2.opacity(0.5), radius: 1, x: 0, y: -2)
            .shadow(color: color1.opacity(0.5), radius: 8, x: 0, y: -2)
    }
}

struct SingleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            VStack {
                SingleTaskView(title: "Study for 2001 Exam", priority: .medium, timestamp: Date())
                SingleTaskView(title: "Finish SimuText Lab before 20th", priority: .medium, timestamp: Date())
            }.padding()
        }
        .frame(width: 400)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    formatter.timeStyle = .medium
    return formatter
}()
