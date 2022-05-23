//
//  FilesModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import Foundation

struct DocumentModel: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var image: String = "ic_document"
}

var documentsData: [DocumentModel] = [
    DocumentModel(name: "Documento acta 345", date: "3 February 2019"),
    DocumentModel(name: "Pdf acta 5", date: "7 January 2017"),
    DocumentModel(name: "Word acta 4", date: "23 December 2020"),
    DocumentModel(name: "Documento acta 2", date: "3 March 2020"),
]

struct ImageModel: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var image: String = "ic_image"
}

var imagesData: [ImageModel] = [
    ImageModel(name: "Image entreno 345", date: "3 February 2019"),
    ImageModel(name: "Image acta 5", date: "7 January 2017"),
    ImageModel(name: "Image entreno 4", date: "23 December 2020"),
    ImageModel(name: "Image acta 2", date: "3 March 2020"),
    ImageModel(name: "Image acta 5", date: "7 January 2017"),
    ImageModel(name: "Image entreno 8", date: "23 December 2020"),
]

struct VideoModel: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var image: String = "ic_video"
}

var videosData: [VideoModel] = [
    VideoModel(name: "Video partido 345", date: "3 February 2019"),
    VideoModel(name: "Video entreno 5", date: "7 January 2017"),
    VideoModel(name: "Video entreno 2", date: "3 March 2020"),
]
