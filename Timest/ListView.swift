import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            // ListView専用のヘッダー
            HeaderView(iconName: "list.bullet", title: "List")
            Text("これはリストページです")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            Spacer()
        }
        .background(Color.black)
    }
}
