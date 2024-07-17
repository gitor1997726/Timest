import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            TaskButton()
                .padding(.top, 60)
            TimerView()
                .padding(.top, 100)
            Spacer()
            FooterView()
        }
        .background(Color.black)
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.green)
                Text("Timest")
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

struct TaskButton: View {
    var body: some View {
        Button(action: {
            // Action for button
        }) {
            Text("XcodeとGitHubの連携")
                .font(.custom("Roboto", size: 18))
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 266, height: 67)
                .background(Color.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.green, lineWidth: 3)
                )
        }
    }
}

struct TimerView: View {
    var body: some View {
        VStack {
            Text("15:14 - 15:39")
                .font(.custom("Roboto", size: 24))
                .foregroundColor(Color.green)
                .opacity(0.5)
            Text("25:00")
                .font(.custom("Roboto-Bold", size: 96))
                .foregroundColor(Color.green)
            Button(action: {
                // Action for play button
            }) {
                Image(uiImage: UIImage(named: "play_button_image")!) // ここに再生ボタンの画像名を指定
                    .resizable()
                    .frame(width: 82, height: 82)
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct FooterView: View {
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .frame(height: 2)
                .background(Color.green)
            HStack {
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: 27, height: 30)
                    .foregroundColor(Color.gray)
                Spacer()
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 27, height: 30)
                    .foregroundColor(Color.gray)
                Spacer()
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 27, height: 30)
                    .foregroundColor(Color.gray)
                Spacer()
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 27, height: 30)
                    .foregroundColor(Color.gray)
                Spacer()
                Image(systemName: "chart.bar")
                    .resizable()
                    .frame(width: 27, height: 30)
                    .foregroundColor(Color.gray)
            }
            .padding()
        }
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
