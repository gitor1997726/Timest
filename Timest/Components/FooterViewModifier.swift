import SwiftUI

struct FooterViewModifier: ViewModifier {
    @Binding var selection: Int

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            ZStack {
                content
                VStack {
                    Spacer()
                    Divider()
                        .frame(height: 2)
                        .background(Color.green)
                        .padding(.bottom, 2) 
                    //padding(.bottom, 2)が適用されると、その要素の下に2ポイント分の空白が追加されます。この空白によって、下にある他の要素がその空白分だけ下に押し下げられることになります。
                }
            }
            HStack {
                Button(action: { self.selection = 0 }) {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selection == 0 ? Color.green : Color.gray)
                }
                Spacer()
                Button(action: { self.selection = 1 }) {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selection == 1 ? Color.green : Color.gray)
                }
                Spacer()
                Button(action: { self.selection = 2 }) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selection == 2 ? Color.green : Color.gray)
                }
                Spacer()
                Button(action: { self.selection = 3 }) {
                    Image(systemName: "chart.bar")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(selection == 3 ? Color.green : Color.gray)
                }
            }
            .padding()
            .background(Color.black)
            .frame(height: 60)
        }
    }
}

extension View {
    func withFooter(selection: Binding<Int>) -> some View {
        self.modifier(FooterViewModifier(selection: selection))
    }
}

struct FooterViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Main Content")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
        }
        .withFooter(selection: .constant(0))
        .previewLayout(.sizeThatFits)
        .background(Color.black)
    }
}
