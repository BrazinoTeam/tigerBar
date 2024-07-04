//
//  ProgressBarView.swift

import Foundation
import SwiftUI

struct ProgressBarView: View {
    @State private var barLength: CGFloat = 0
    
    var currentProgress: CGFloat
    var maxProgress: CGFloat
    
    var innerProgressBarLength: CGFloat {
        let ratio = currentProgress / maxProgress
        return max(0, min(barLength * ratio, barLength - 2))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(LinearGradient(
                    colors: [
                        Color(hex:"#CC6200"),
                        Color(hex:"#FFA800"),
                        Color(hex:"#CC6200")
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                ), lineWidth: 2)
                .background {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.clear)
                }
            
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hex:"#CC6200"),
                            Color(hex:"#FFA800"),
                            Color(hex:"#CC6200")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: innerProgressBarLength)
                .frame(height: 16)
                .padding(4)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 320)
        .clipShape( RoundedRectangle(cornerRadius: 20))
        .readSize { self.barLength = $0.width }
    }
}

#Preview {
    ProgressBarView(currentProgress: 50, maxProgress: 280)
}
