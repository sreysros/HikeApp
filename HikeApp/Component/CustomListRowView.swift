//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Sreysros Leak on 10/6/24.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabelContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .font(.system(size: 18, weight: .bold))
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                Text(rowLabel)
                    .font(.system(size: 18, weight: .regular))
            }
        }

    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .pink, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://chipmongbank.com.kh")
    }
}
