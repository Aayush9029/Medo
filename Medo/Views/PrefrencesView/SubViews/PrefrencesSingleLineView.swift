//
//  PrefrencesSingleLineView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-23.
//

import SwiftUI

struct PrefrencesSingleLineView: View {
    let icon: String
    let title: String
    let value: Int

    var body: some View {
        HStack {
            Label(title, systemImage: icon)
                .foregroundStyle(.secondary)

            Spacer()
            Text("\(value)")
                .bold()
                .foregroundStyle(.primary)
        }
        .font(.title3)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(6)
        .symbolVariant(.circle)
    }
}

struct PrefrencesSingleLineView_Previews: PreviewProvider {
    static var previews: some View {
        PrefrencesSingleLineView(icon: "arrow.up", title: "App Launch Count", value: 123)
            .frame(width: 400, height: 200)
    }
}
