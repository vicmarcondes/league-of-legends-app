//
//  File.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import Foundation
import UIKit

struct Champion: Codable {
<<<<<<< HEAD
    let id: String
    let key: String
    let name: String
=======
    let version: String
    let id: String
    let key: String
    let name: String
    let title: String
    let blurb: String
    let image: Image
    let tags: [String]
    let partype: String
}

struct Image: Codable {
    let full: String
    let sprite: String
    let group: String
    let x: Int
    let y: Int
    let w: Int
    let h: Int
>>>>>>> main
}
