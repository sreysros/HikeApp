//
//  SettingView.swift
//  HikeApp
//
//  Created by Sreysros Leak on 10/6/24.
//

import SwiftUI

struct SettingView: View {
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                        startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack {
                    Text("Where can you find \n perfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } // : HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button(action: {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                                
                                    UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                      if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                      } else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                      }
                                    }
                            }, label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            })
                            .buttonStyle(.borderless)
                        }
                    }
                } // SCROLL VIEW
                .padding(.top, 12)
                HStack {
                    Spacer()
                    Text("Choose your favorite app icon from the collection above.")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }.listRowSeparator(.hidden)
            
            // MARKS: - SECTION: APP
            Section(header: Text("About the app"), footer: HStack {
                Spacer()
                Text("Copyright © All right reserved.")
                Spacer()
            }.padding()
            ) {
                VStack {
                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                    CustomListRowView(rowLabel: "Compatibility", rowIcon: "info", rowContent: "iOS, iPadOS", rowTintColor: .red)
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: Color.purple)
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Sreysros", rowTintColor: .indigo)
                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .purple, rowLinkLabel: "Chip Mong Bank", rowLinkDestination: "https://chipmongbank.com.kh")
                }
            }.listRowSeparator(.visible)
        }
    }
}

#Preview {
    SettingView()
}
