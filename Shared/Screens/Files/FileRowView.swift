//
//  FileRowView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct FileDocumentRowView: View {
    var document: DocumentModel
    @ObservedObject var listDocuments: DocumentModelList
    
    @State var showAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(document.image)
                .resizable()
                .frame(width: 25, height: 25)
                .padding(9)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color("secondDarkBlueColor"))
                        )
                )
            VStack(alignment: .leading, spacing: 5) {
                Text(document.name.localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Text("upload_date_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
                + Text(document.date)
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
            }
            .frame(width: 210, alignment: .leading)
            Spacer()
            Button {
                showAlert.toggle()
            } label: {
                Image("ic_remove_red")
                    .resizable()
                    .frame(width: 21, height: 21)
            }

        }
        .alert(
          isPresented: $showAlert,
          content: {
            Alert(
                title: Text("remove_file".localized(LocalizationService.shared.language)),
              message: Text("confirmation_remove_file".localized(LocalizationService.shared.language)),
              primaryButton: .cancel(
                Text("button_cancel".localized(LocalizationService.shared.language)),
                action: {}),
              secondaryButton: .destructive(
                Text("button_remove".localized(LocalizationService.shared.language)),
                action: {
                    let index = listDocuments.documents.firstIndex(where: {$0.name == document.name})
                    listDocuments.documents.remove(at: index ?? 0)
                })
            )
          })
        .padding([.leading, .trailing], 10)
        .frame(width: 340, height: 55, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(Color("secondBlueColor").opacity(0.6), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 6).fill(Color.white)
                )
        )
    }
}

struct FileImageRowView: View {
    
    var image: ImageModel
    @ObservedObject var listImages: ImageModelList
    
    @State var showAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(image.image)
                .resizable()
                .frame(width: 25, height: 25)
                .padding(9)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color("secondDarkBlueColor"))
                        )
                )
            VStack(alignment: .leading, spacing: 5) {
                Text(image.name.localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Text("upload_date_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
                + Text(image.date)
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
            }
            .frame(width: 210, alignment: .leading)
            Spacer()
            Button {
                showAlert.toggle()
            } label: {
                Image("ic_remove_red")
                    .resizable()
                    .frame(width: 21, height: 21)
            }

        }
        .alert(
          isPresented: $showAlert,
          content: {
            Alert(
                title: Text("remove_file".localized(LocalizationService.shared.language)),
              message: Text("confirmation_remove_file".localized(LocalizationService.shared.language)),
              primaryButton: .cancel(
                Text("button_cancel".localized(LocalizationService.shared.language)),
                action: {}),
              secondaryButton: .destructive(
                Text("button_remove".localized(LocalizationService.shared.language)),
                action: {
                    let index = listImages.images.firstIndex(where: {$0.name == image.name})
                    listImages.images.remove(at: index!)
                })
            )
          })
        .padding([.leading, .trailing], 10)
        .frame(width: 340, height: 55, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(Color("secondBlueColor").opacity(0.6), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 6).fill(Color.white)
                )
        )
    }
}

struct FileVideoRowView: View {
    
    var video: VideoModel
    @ObservedObject var listVideos: VideoModelList
    
    @State var showAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(video.image)
                .resizable()
                .frame(width: 25, height: 25)
                .padding(9)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color("secondDarkBlueColor"))
                        )
                )
            VStack(alignment: .leading, spacing: 5) {
                Text(video.name.localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Text("upload_date_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
                + Text(video.date)
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
            }
            .frame(width: 210, alignment: .leading)
            Spacer()
            Button {
                showAlert.toggle()
            } label: {
                Image("ic_remove_red")
                    .resizable()
                    .frame(width: 21, height: 21)
            }

        }
        .alert(
          isPresented: $showAlert,
          content: {
            Alert(
                title: Text("remove_file".localized(LocalizationService.shared.language)),
              message: Text("confirmation_remove_file".localized(LocalizationService.shared.language)),
              primaryButton: .cancel(
                Text("button_cancel".localized(LocalizationService.shared.language)),
                action: {}),
              secondaryButton: .destructive(
                Text("button_remove".localized(LocalizationService.shared.language)),
                action: {
                    let index = listVideos.videos.firstIndex(where: {$0.name == video.name})
                    listVideos.videos.remove(at: index!)
                })
            )
          })
        .padding([.leading, .trailing], 10)
        .frame(width: 340, height: 55, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(Color("secondBlueColor").opacity(0.6), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 6).fill(Color.white)
                )
        )
    }
}

struct FileRowView_Previews: PreviewProvider {
    static var previews: some View {
        FileImageRowView(image: ImageModel(name: "",
                                           date: ""),
                         listImages: ImageModelList())
    }
}
