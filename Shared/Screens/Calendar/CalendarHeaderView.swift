//
//  CalendarHeaderView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 31/5/22.
//

import SwiftUI

struct CalendarHeaderView: View {
    
    @Binding var currentMonth: Int
    @Binding var currentDate: Date
    
    var body: some View {
        HStack{
            HStack(spacing: 10) {
                Text(extraDate()[1].capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(extraDate()[0])
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            Spacer()
            HStack(spacing: 30){
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 10, height: 20)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .fill(Color("baseColor"))
                                .frame(width: 30, height: 30)
                        )
                }
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 20)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .fill(Color("baseColor"))
                                .frame(width: 30, height: 30)
                        )
                }
                
            }
        }
    }

    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
}

struct CalendarHeaderView_Previews: PreviewProvider {
    @State static var value = Date()
    @State static var value1 = 0
    static var previews: some View {
        CalendarHeaderView(currentMonth: $value1, currentDate: $value)
    }
}
