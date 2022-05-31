//
//  SplashView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 31/5/22.
//

import SwiftUI
import Lottie

struct SplashView: View {
    
    @State var showlogin = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                AnimationSplashView(hasFinished: $showlogin)
                    .background(Color.white)
            }.navigate(to: LoginView(), when: $showlogin)
        }
    }
}

struct AnimationSplashView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    @Binding var hasFinished: Bool
    
    func makeUIView(context: UIViewRepresentableContext<AnimationSplashView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        animationView.animation = Animation.named("splashAnimation")
        animationView.contentMode = .scaleAspectFit
        animationView.play { (finished) in
            hasFinished.toggle()
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimationSplashView>) {
        //Nothing
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
