import Foundation
 
struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
 
    // defaultはswicth-case構文で予約された単語なので通常変数名などでは使えない．
    // もし変数名としてどうしても扱いたい場合は， ` `で囲む
    static let `default` = Profile(username: "g_kumar")
 
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
 
        var id: String { self.rawValue }
    }
}
