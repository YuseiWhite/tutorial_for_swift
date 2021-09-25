import SwiftUI
 
struct CategoryRow: View {
    var categoryName: String  // カテゴリ名
    var items: [Landmark]     // カテゴリに属する観光地リスト
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)  // 左からパディング
                .padding(.top, 5)  // 上からパディング
 
            ScrollView(.horizontal, showsIndicators: false) {  // 水平方向のスクロール & インディケータ無し
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
     }
}
 
struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = UserData().landmarks
    // プレビューでは観光地データを直接使用
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,  // 仮で0番目の観光地カテゴリ名を使用
            items: Array(landmarks.prefix(5))  // 仮で先頭から3要素だけ
        )
    }
}
