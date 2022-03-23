//
//  EmptyTaskView.swift
//  Medo
//
//  Created by Aayush Pokharel on 2022-03-19.
//

import SwiftUI

struct EmptyTaskView: View {
    let isEmpty: Bool

    var body: some View {
        VStack {
            Image(systemName: "shippingbox")
                .font(.system(size: 200.0))
                .padding(.top)
            Text("Wow such an empty")
                .font(.largeTitle.bold())
        }
        .foregroundStyle(.tertiary)
        .padding(.bottom, 140)
        .blur(radius: isEmpty ? 0 : 75)
        .opacity(isEmpty ? 1 : 0)
    }
}

struct EmptyTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTaskView(isEmpty: true)
    }
}
