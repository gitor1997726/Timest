import SwiftUI

struct AddFolderModalView: View {
    @Binding var isPresented: Bool
    @Binding var folders: [String]
    @State private var folderName: String = ""

    var body: some View {
        VStack {
            HStack {
                Button("キャンセル") {
                    isPresented = false
                }
                .foregroundColor(.green)

                Spacer()

                Text("新規フォルダ")
                    .font(.custom("Roboto-Bold", size: 18))
                    .foregroundColor(.white)

                Spacer()

                Button("完了") {
                    if !folderName.isEmpty {
                        folders.append(folderName)
                        isPresented = false
                    }
                }
                .foregroundColor(folderName.isEmpty ? .gray : .green)
                .disabled(folderName.isEmpty)
            }
            .padding()

            HStack {
                Image(systemName: "folder")
                    .foregroundColor(.green)
                    .frame(width: 32, height: 32) // アイコンのサイズを調整

                TextField("", text: $folderName)
                    .padding(10)
                    .background(Color.secondary)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .font(.custom("Roboto", size: 18))
                    .padding(.leading, 5) // アイコンとテキストの間にスペースを追加
            }
            .padding()

            Spacer()
        }
        .background(Color.black)
    }
}

struct AddFolderModalView_Previews: PreviewProvider {
    @State static var isPresented = true
    @State static var folders = ["Sample Folder"]

    static var previews: some View {
        AddFolderModalView(isPresented: $isPresented, folders: $folders)
    }
}