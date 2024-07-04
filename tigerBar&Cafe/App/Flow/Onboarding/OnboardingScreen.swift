//
//  OnboardingScreen.swift

import Foundation
import SwiftUI
import Combine

struct OnboardingScreen: View {
    @ObservedObject var loadignViewModel: OnboardingViewModel
    @State private var loadingProgress: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Loading...")
                .font(Font.custom("Aclonica-Regular", size: 14))
                .foregroundStyle(.white)
            ProgressBarView(currentProgress: loadingProgress, maxProgress: 296)
        }
        .padding(.bottom, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .backgroundImage(image: .bgLoad)
        .onChange(of: loadignViewModel.isAnimating) { animating in
            if animating {
                withAnimation(.linear(duration: 2)) {
                    loadingProgress = 280
                }
            }
        }
    }
}

#Preview {
    OnboardingScreen(loadignViewModel: OnboardingViewModel())
}
