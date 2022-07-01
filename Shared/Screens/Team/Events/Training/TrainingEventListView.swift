//
//  TrainingEventListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct TrainingEventListView: View {
    
    @ObservedObject var trainingModel: TrainingListModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 15){
                ForEach(trainingModel.trainingList) { item in
                    EventTrainingCard(training: item, trainingModel: trainingModel)
                }
            }
            .padding(.top, 20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        }
    }
}

struct TrainingEventListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingEventListView(trainingModel: TrainingListModel())
    }
}
