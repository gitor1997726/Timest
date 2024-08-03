import SwiftUI

struct ScheduleCardView: View {
    var taskName: String
    var pomodoroCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(taskName)
                .font(.headline)
                .foregroundColor(.white)

            HStack(spacing: 4) {
                ForEach(0..<pomodoroCount, id: \.self) { _ in
                    Image(systemName: "clock")
                        .foregroundColor(Color.green)
                }
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green, lineWidth: 2)
        )
        .frame(height: CGFloat(pomodoroCount) * 30)  // 1ポモドーロ = 50ポイントの高さと仮定
    }
}

struct ScheduleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCardView(taskName: "Sample Task", pomodoroCount: 2)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
