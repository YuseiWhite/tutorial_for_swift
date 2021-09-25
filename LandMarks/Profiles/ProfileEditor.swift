import SwiftUI
 
struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        // 前後1年間のカレンダーデータを取得するComputed propaty
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            VStack(alignment: .leading, spacing: 20) {  // 左よせ
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {  // Pickerコントロール
                    ForEach(Profile.Season.allCases) { season in  // 列挙型の全ケースを取得し表示
                        Text(season.rawValue).tag(season)  // .tag()で選ばれているものを強調
                    }
                }
                .pickerStyle(SegmentedPickerStyle())  // 横並びのPickerスタイル
            }
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}
 
struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
