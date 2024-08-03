import SwiftUI

// タスクカード表示部分のサブビュー
struct ScheduledTaskCardsView: View {
    @EnvironmentObject var taskManager: TaskManager

    var body: some View {
        ForEach($taskManager.tasks) { $task in
            if let scheduledTime = task.scheduledTime {
                let hour = scheduledTime / 100
                let minute = scheduledTime % 100
                let positionY = calculatePositionY(hour: hour, minute: minute)
                ScheduleCardView(taskName: task.name, pomodoroCount: task.pomodoroCount)
                    .position(x: UIScreen.main.bounds.width / 2, y: positionY)
            }
        }
    }

    private func calculatePositionY(hour: Int, minute: Int) -> CGFloat {
        return CGFloat((hour - 6) * 60 + (minute * 30 / 30))  // 位置計算の簡略化
    }
}
