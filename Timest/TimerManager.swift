import SwiftUI
import Combine

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int = 1500 // 25 minutes in seconds
    @Published var isActive: Bool = false

    var timer = Timer()

    // タイマーの開始と一時停止を管理する関数
    func startPause() {
        if isActive {
            // タイマーが動作中なら一時停止
            timer.invalidate()
            isActive = false
        } else {
            // タイマーが停止中なら開始
            isActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.updateTimer()
            }
        }
    }

    private func updateTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer.invalidate()
            isActive = false
            // タイマー完了時の処理（今は不要なので省略）
        }
    }
}
