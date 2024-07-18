import SwiftUI

struct HeaderView: View {
    var iconName: String
    var title: String

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.green)
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
