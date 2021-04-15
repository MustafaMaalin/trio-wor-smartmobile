//
//  newPosts.swift
//  Empathy2
//
//  Created by Mihail on 15/04/2021.
//

import Foundation
import SwiftUI
import Combine

struct NewPosts {
    var id: Int
    var image : UIImage
    var description: String
    var user: String
}

class PostList : ObservableObject {
    @Published var postList = [NewPosts]()
}
