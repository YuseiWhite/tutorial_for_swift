//
//  ProfileHost.swift
//  LandMarks
//
//  Created by 田中優成 on 2021/09/25.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var userData: UserData
//    @State private var draftProfile = Profile.default
    @State private var draftProfile = Profile.default
     
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = userData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {  // Done
                        draftProfile = userData.profile
                    }
                    .onDisappear {  // Cancel
                        userData.profile = draftProfile
                    }
                }
        }
        .padding()
    }
    
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(UserData())
    }
}
