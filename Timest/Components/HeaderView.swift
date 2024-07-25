import SwiftUI

struct HeaderView: View {
    var iconName: String
    var title: String
    var onBack: (() -> Void)? = nil  // デフォルトでnilを設定

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if let onBack = onBack {
                    Button(action: onBack) {
                        Image(systemName: iconName)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.green)
                    }
                } else {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color.green)
                }
                Text(title)
                    .font(.custom("Roboto-Bold", size: 24))
                    .foregroundColor(Color.green)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Spacer()
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.gray)
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.gray)
            }
            .padding()
            Divider()
                .frame(height: 2)
                .background(Color.green)
        }
        .background(Color.black)
        .padding(.top, 15) // ここでSafe Areaのパディングを調整
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(iconName: "star", title: "サンプルタイトル")
            .previewLayout(.sizeThatFits)
            .background(Color.black) // プレビュー背景色を設定
    }
}
