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

extension UIHostingController {
    convenience public init(rootView: Content, ignoreSafeArea: Bool) {
        self.init(rootView: rootView)

        if ignoreSafeArea {
            disableSafeArea()
        }
    }

    func disableSafeArea() {
        guard let viewClass = object_getClass(view) else { return }

        let viewSubclassName = String(cString: class_getName(viewClass)).appending("_IgnoreSafeArea")
        if let viewSubclass = NSClassFromString(viewSubclassName) {
            object_setClass(view, viewSubclass)
        }
        else {
            guard let viewClassNameUtf8 = (viewSubclassName as NSString).utf8String else { return }
            guard let viewSubclass = objc_allocateClassPair(viewClass, viewClassNameUtf8, 0) else { return }

            if let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.safeAreaInsets)) {
                let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { _ in
                    return .zero
                }
                class_addMethod(viewSubclass, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
            }

            if let method2 = class_getInstanceMethod(viewClass, NSSelectorFromString("keyboardWillShowWithNotification:")) {
                let keyboardWillShow: @convention(block) (AnyObject, AnyObject) -> Void = { _, _ in }
                class_addMethod(viewSubclass, NSSelectorFromString("keyboardWillShowWithNotification:"), imp_implementationWithBlock(keyboardWillShow), method_getTypeEncoding(method2))
            }

            objc_registerClassPair(viewSubclass)
            object_setClass(view, viewSubclass)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
