//
//  Badge.swift
//  Landmarks
//
//  Created by Tatsuya Moriguchi on 1/25/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct Badge: View {
    // 3. Lay the badge’s symbol over the badge background by placing it in a ZStack.
    var badgeSymbols: some View {
        // 5. Add a ForEach view to rotate and display copies of the badge symbol.
        // 5. A full, 360° rotation split into eight segments creates a sun-like pattern by repeating the mountain symbol.
        ForEach(0..<8) { index in
            // Place BadgeBackground in the body of Badge.
//            RotatedBadgeSymbol(angle: Angle(degrees: 0))
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        // 5.
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            // 4. Correct the size of the badge symbol by reading the surrounding geometry and scaling the symbol.
            GeometryReader { geometory in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometory.size.width / 2.0, y: (3.0 / 4.0) * geometory.size.height)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
