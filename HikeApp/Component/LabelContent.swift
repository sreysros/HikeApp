//
//  LabelContent.swift
//  HikeApp
//
//  Created by Sreysros Leak on 10/6/24.
//

import SwiftUI

struct LabelContent<Content: View, Label: View>: View {
    @ViewBuilder var content: () -> Content
    @ViewBuilder var label: () -> Label

    var body: some View {
        HStack {
            label()
                .font(.system(size: 20, weight: .regular))
            Spacer()
            content()
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 10)
    }
}
