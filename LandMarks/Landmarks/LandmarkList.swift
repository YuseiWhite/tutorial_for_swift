import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
//    @State var showFavoritesOnly: Bool = true
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}
 
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone X"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(UserData())
        }
    }
}
