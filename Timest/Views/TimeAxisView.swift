import SwiftUI
import UniformTypeIdentifiers

struct TimeAxisView: View {
    let handleDrop: (_ providers: [NSItemProvider], _ hour: Int, _ minute: Int) -> Bool

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(6..<24) { hour in
                ForEach([0, 30], id: \.self) { minute in
                    HStack {
                        Text(String(format: "%02d:%02d", hour, minute))
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)

                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 1)
                            .padding(.leading, 8)

                        Spacer()
                    }
                    .padding(.vertical, 24)  // 30分単位なので間隔を設定
                    .contentShape(Rectangle())  // ヒットテスト範囲を拡大
                    .onDrop(of: [UTType.plainText], isTargeted: nil) { providers in
                        handleDrop(providers, hour, minute)
                    }
                }
            }
        }
//        .padding(.horizontal)  // 水平方向のパディングを追加
//        .padding(.vertical, 10)  // 垂直方向のパディングを追加
    }
}

struct TimeAxisView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAxisView { _, _, _ in true }
    }
}
