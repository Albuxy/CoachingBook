//
//  FilesView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct FilesView: View {

    @ObservedObject var fileModel: FilesModel
    @ObservedObject var documentsList: DocumentModelList
    @ObservedObject var imagesList: ImageModelList
    @ObservedObject var videoslist: VideoModelList
    
    var body: some View {
        VStack(alignment: .center, spacing: 35){
            VStack(alignment: .leading, spacing: 25){
                Text("type_files_title")
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                CustomPickerFileView(selection: fileModel,
                                     documentsList: documentsList,
                                     imagesList: imagesList,
                                     videoslist: videoslist)
                
            }
            VStack(alignment: .leading, spacing: 25){
                Text("list_files_title")
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                GeometryReader { _ in
                    SwitchFileView(userScreenEntry: $fileModel.showSection,
                                   documentsList: documentsList,
                                   imagesList: imagesList,
                                   videoslist: videoslist)
                }
                .frame(width: 340, height: 480, alignment: .top)
            }
        }
        .padding(.top, 120)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("fourthLightBlueColor"))
    }
}

struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        FilesView(fileModel: FilesModel(),
                  documentsList: DocumentModelList(),
                  imagesList: ImageModelList(),
                  videoslist: VideoModelList())
    }
}
