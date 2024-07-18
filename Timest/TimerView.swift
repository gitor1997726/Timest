import SwiftUI

struct TimerView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack {
            // TimerView専用のヘッダー
            HeaderView(iconName: "clock", title: "Timest")
            TaskButton()
                .padding(.top, 60)
            TimerDisplayView(timerManager: timerManager)
                .padding(.top, 100)
            Spacer()
        }
        .background(Color.black)
    }
}

struct TaskButton: View {
    var body: some View {
        Button(action: {
            // ボタンが押されたときのアクション
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

struct TimerDisplayView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack {
            Text("15:14 - 15:39")
                .font(.custom("Roboto", size: 24))
                .foregroundColor(Color.green)
                .opacity(0.5)
            Text(formatTime(timerManager.timeRemaining))
                .font(.custom("Roboto-Bold", size: 96))
                .foregroundColor(Color.green)
            Button(action: {
                self.timerManager.startPause() // スタート/一時停止ボタンを押したときの動作
            }) {
                Image(systemName: timerManager.isActive ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 82, height: 82)
                    .foregroundColor(Color.green)
            }
        }
    }

    private func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
