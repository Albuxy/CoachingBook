//
//  ExtensionsView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 21/4/22.
//

import Foundation
import SwiftUI

extension View {
  func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
    NavigationView {
      ZStack {
        self
          .navigationBarTitle("")
          .navigationBarHidden(true)

        NavigationLink(
          destination:
            view
            .navigationBarTitle("")
            .navigationBarHidden(true),
          isActive: binding
        ) {
          EmptyView()
        }
      }
    }
  }

  func navigationAppearance(
    backgroundColor: UIColor, foregroundColor: UIColor, tintColor: UIColor? = nil, hideSeparator: Bool = false
  ) -> some View {
    self.modifier(NavigationColorBar(backgroundColor: backgroundColor, foregroundColor: foregroundColor))
  }
}

struct NavigationColorBar: ViewModifier {

  init(backgroundColor: UIColor, foregroundColor: UIColor) {

    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithTransparentBackground()
    navBarAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
    navBarAppearance.backgroundColor = backgroundColor
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
  }

  func body(content: Content) -> some View {
    content
  }

}

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {

    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}

extension LocalizedStringKey {
    var stringKey: String {
        let description = "\(self)"

        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }
}

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey, locale: locale)
    }
}
