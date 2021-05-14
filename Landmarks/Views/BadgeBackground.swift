//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Jared  Long on 5/13/21.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
//        paths are used to combine lines, curves and drawings
        Path { path in
            var width: CGFloat = 100.0
            let height = width
//            move(to:) moves the drawing cursor within the bounds of a shape
            path.move(
                to: CGPoint(
                    x: width * 0.95,
                    y: height * 0.20
                )
            )
            HexagonParameters.segments.forEach{ segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x,
                        y: height * segment.line.y
                    )
                )
            }
        }
        .fill(Color.black)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
