//
//  User.swift
//  With (iOS)
//
//  Created by Nhất Minh on 16/06/2022.
//

import SwiftUI

struct User : Identifiable , Codable{
    var id = UUID().uuidString
    var name :String
    var password: String
}
