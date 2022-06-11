//
//  FilesView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct FilesView: View {

    @ObservedObject var fileModel = FilesModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 35){
            VStack(alignment: .leading, spacing: 25){
                Text("type_files_title")
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                CustomPickerFileView(selection: fileModel)
                
            }
            VStack(alignment: .leading, spacing: 25){
                Text("list_files_title")
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                GeometryReader { _ in
                    SwitchFileView(userScreenEntry: $fileModel.showSection, viewModel: fileModel)
                }
                .frame(width: 340, height: 480, alignment: .top)
            }
        }
        .padding(.top, 120)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("fourthLightBlueColor"))
        .onChange(of: documentsData) { _ in
            documentsData.shuffle()
                }
    }
}

struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        FilesView()
    }
}
