//
//  CategoryHome.swift
//  LandMarks
//
//  Created by 田中優成 on 2021/09/24.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var userData: UserData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            List {
                PageView(pages: userData.features.map { FeatureCard(landmark: $0) })
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                
                ForEach(userData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: userData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {  // NavigationのToolbarにビューを追加
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {  // showingProfile == trueならばシートを開く
                ProfileHost()
                    .environmentObject(userData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
