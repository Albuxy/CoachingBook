//
//  MiniCardsFeedback.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import Foundation
import SwiftUI
import UIKit

struct MiniTrainingSessionGivePuncCard: View {
    
    var currentTrainingSession: Training

    @State var navigateToFeedback = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentTrainingSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentTrainingSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentTrainingSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            NavigationLink(
              destination: GivePunctualityView(),
              isActive: $navigateToFeedback,
              label: {
                  Button(action: {
                      navigateToFeedback.toggle()
                  }) {
                      Text("give_upper_title"
                            .localized(LocalizationService.shared.language))
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct MiniMatchSessionGivePuncCard: View {

    var currentMatchSession: Match

    @State var navigateToFeedback = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentMatchSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentMatchSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentMatchSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            NavigationLink(
              destination: GivePunctualityView(),
              isActive: $navigateToFeedback,
              label: {
                  Button(action: {
                      navigateToFeedback.toggle()
                  }) {
                      Text("give_upper_title".localized(LocalizationService.shared.language))
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct MiniTrainingSessionGiveBehaCard: View {
    
    var currentTrainingSession: Training

    @State var navigateToFeedback = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentTrainingSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentTrainingSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentTrainingSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            NavigationLink(
              destination: GiveBehaviourView(),
              isActive: $navigateToFeedback,
              label: {
                  Button(action: {
                      navigateToFeedback.toggle()
                  }) {
                      Text("give_upper_title"
                            .localized(LocalizationService.shared.language))
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct MiniMatchSessionGiveBehaCard: View {

    var currentMatchSession: Match

    @State var navigateToFeedback = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentMatchSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentMatchSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentMatchSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            NavigationLink(
              destination: GiveBehaviourView(),
              isActive: $navigateToFeedback,
              label: {
                  Button(action: {
                      navigateToFeedback.toggle()
                  }) {
                      Text("give_upper_title".localized(LocalizationService.shared.language))
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct MiniTrainingSessionGiveAttCard: View {
    
    var currentTrainingSession: Training

    @State var navigateToFeedback = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentTrainingSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentTrainingSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentTrainingSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            NavigationLink(
              destination: GiveAttitudeView(),
              isActive: $navigateToFeedback,
              label: {
                  Button(action: {
                      navigateToFeedback.toggle()
                  }) {
                      Text("give_upper_title"
                            .localized(LocalizationService.shared.language))
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct MiniMatchSessionGiveAttCard: View {

    var currentMatchSession: Match

    @State var navigateToFeedback = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentMatchSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentMatchSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentMatchSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            NavigationLink(
              destination: GiveAttitudeView(),
              isActive: $navigateToFeedback,
              label: {
                  Button(action: {
                      navigateToFeedback.toggle()
                  }) {
                      Text("give_upper_title".localized(LocalizationService.shared.language))
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}
