//
//  TrainingEventListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct TrainingEventListView: View {
    
    var trainingList: [Training]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 15){
                ForEach(trainingList) { item in
                    EventTrainingCard(training: item)
                }
            }
            .padding(.top, 20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        }
    }
}

struct TrainingEventListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingEventListView(trainingList: trainingData)
    }
}
