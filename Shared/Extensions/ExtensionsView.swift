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
    public func toString() -> String {
        let mirror = Mirror(reflecting: self)
        let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
            let (label, _) = arg0
            if(label == "key"){
                return true;
            }
            return false;
        }
        
        if(attributeLabelAndValue != nil) {
            return String.localizedStringWithFormat(NSLocalizedString(attributeLabelAndValue!.value as! String, comment: ""));
        }
        else {
            return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
        }
    }
}

extension String {
    func localized(_ language: Language) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return localized(bundle: bundle)
    }

    func localized(_ language: Language, args arguments: CVarArg...) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return String(format: localized(bundle: bundle), arguments: arguments)
    }

    private func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}


struct KeyboardAvoiderPreferenceReader: ViewModifier {
    
    let tag: Int
    
    func body(content: Content) -> some View {
        
        content
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.clear)
                        .preference(
                            key: KeyboardAvoiderPreferenceKey.self,
                            value: [
                                KeyboardAvoiderPreference(tag: self.tag, rect: geometry.frame(in: .global))
                        ])
                }
            )
    }
}

extension View {
    
    func avoidKeyboard(tag: Int) -> some View {
        self.modifier(KeyboardAvoiderPreferenceReader(tag: tag))
    }
 }

struct KeyboardAvoiderPreference: Equatable {
    
    let tag: Int
    let rect: CGRect
    
    static func == (lhs: KeyboardAvoiderPreference, rhs: KeyboardAvoiderPreference) -> Bool {
        print("y: \(lhs.rect.minY) vs \(rhs.rect.minY)")
       return  lhs.tag == rhs.tag && (lhs.rect.minY == rhs.rect.minY)
    }
}

struct KeyboardAvoiderPreferenceKey: PreferenceKey {
    
    typealias Value = [KeyboardAvoiderPreference]
    
    static var defaultValue: [KeyboardAvoiderPreference] = []
    
    static func reduce(value: inout [KeyboardAvoiderPreference], nextValue: () -> [KeyboardAvoiderPreference]) {
         value.append(contentsOf: nextValue())
    }
}
