//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Jared  Long on 5/13/21.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
//        using geometryReader to make the shae the same size as the view
        GeometryReader { geometry in
//        paths are used to combine lines, curves and drawings
        Path { path in
            var width: CGFloat = min(geometry.size.width, geometry.size.height)
            let height = width
            let xScale: CGFloat = 0.832
            let xOffSet = (width * (1.0 - xScale)) / 2.0
            width *= xScale
//            move(to:) moves the drawing cursor within the bounds of a shape
            path.move(
                to: CGPoint(
                    x: width * 0.95 + xOffSet,
                    y: height * ( 0.20 + HexagonParameters.adjustment)
                )
            )
            HexagonParameters.segments.forEach{ segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x + xOffSet,
                        y: height * segment.line.y
                    )
                )
//                using addQuadCurve to draw out better curves
                path.addQuadCurve(
                    to: CGPoint(
                        x: width * segment.curve.x + xOffSet,
                        y: height * segment.curve.y
                    ),
                    control: CGPoint(
                        x: width * segment.control.x + xOffSet,
                        y: height * segment.control.y
                    )
                )
            }
        }
        .fill(Color.black)
        }
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
