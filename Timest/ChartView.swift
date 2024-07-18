import SwiftUI

struct ChartView: View {
    var body: some View {
        VStack {
            // ChartView専用のヘッダー
            HeaderView(iconName: "chart.bar", title: "チャート")
            Text("これはチャートページです")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            Spacer()
        }
        .background(Color.black)
    }
}
