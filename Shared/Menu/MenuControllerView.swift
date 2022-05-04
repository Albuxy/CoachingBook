//
//  MenuControllerView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct MenuControllerView: View {
    
    @StateObject var menuModel = MenuViewModel()

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
          GeometryReader { _ in
            MenuSwitchView(menuModel: menuModel, userMenuEntry: $menuModel.showSection)
          }
          .background(Color.gray.opacity(0.3))
          .opacity(self.menuModel.showMenu ? 0.1 : 1.0)
          .onTapGesture {
            self.menuModel.showMenu = false
          }
          HStack {
            MenuView(menuData: menuModel)
              .frame(width: UIScreen.main.bounds.width / 1.2)
              .offset(x: self.menuModel.showMenu ? 0 : -UIScreen.main.bounds.width)
              .animation(.easeInOut)
          }
        }
        .navigationBarHidden(menuModel.showMenu ? true : false)
        .background(menuModel.showMenu ? Color("lightGrayColor") : Color.white)
        .edgesIgnoringSafeArea( /*@START_MENU_TOKEN@*/.all /*@END_MENU_TOKEN@*/)
    }
}

struct MenuControllerView_Previews: PreviewProvider {
    static var previews: some View {
        MenuControllerView()
    }
}
