import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            // CalendarView専用のヘッダー
            HeaderView(iconName: "calendar", title: "カレンダー")
            Text("これはカレンダーページです")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            Spacer()
        }
        .background(Color.black)
    }
}
