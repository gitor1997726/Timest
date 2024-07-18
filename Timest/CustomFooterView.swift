import SwiftUI

struct CustomFooterView: View {
    @State private var selectedIcon: String = "clock" // 初期選択はタイマーアイコン

    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .frame(height: 2)
                .background(Color.green)
            HStack {
                Spacer()
                CustomFooterButton(iconName: "list.bullet", selectedIcon: $selectedIcon)
                Spacer()
                CustomFooterButton(iconName: "clock", selectedIcon: $selectedIcon)
                Spacer()
                CustomFooterButton(iconName: "calendar", selectedIcon: $selectedIcon)
                Spacer()
                CustomFooterButton(iconName: "chart.bar", selectedIcon: $selectedIcon)
                Spacer()
            }
            .padding()
        }
        .background(Color.black)
    }
}

struct CustomFooterButton: View {
    let iconName: String
    @Binding var selectedIcon: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 27, height: 30)
                .foregroundColor(selectedIcon == iconName ? Color.green : Color.gray)
                .onTapGesture {
                    selectedIcon = iconName
                }
        }
    }
}
