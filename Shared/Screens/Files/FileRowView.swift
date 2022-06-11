//
//  FileRowView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct FileDocumentRowView: View {
    var item: DocumentModel
    
    @State var showAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(item.image)
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
                Text(item.name.localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Text("upload_date_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
                + Text(item.date)
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
                    documentsData.remove(object: item)
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
    var item: ImageModel
    
    @State var showAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(item.image)
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
                Text(item.name.localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Text("upload_date_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
                + Text(item.date)
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
                    imagesData.remove(object: item)
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
    var item: VideoModel
    
    @State var showAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(item.image)
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
                Text(item.name.localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Text("upload_date_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.8))
                + Text(item.date)
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
                    videosData.remove(object: item)
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
        FileImageRowView(item: imagesData[0])
    }
}
