//
//  cornerShape.swift
//  With (iOS)
//
//  Created by Nhất Minh on 15/06/2022.
//

import Foundation
import SwiftUI
struct CustomCorner : Shape{
    var corner : UIRectCorner
    var size : Int
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        return Path(path.cgPath)
    }
}
