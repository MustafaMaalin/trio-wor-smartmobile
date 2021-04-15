//
//  Posts.swift
//  Empathy2
//
//  Created by Mihail on 15/04/2021.
//

import Foundation
import SwiftUI
import Combine

class Posts : ObservableObject{
  @Published var posts: [Post] = [
        .init(id:0,time: "4 hrs ago", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "user4",user: "Billy Boy"),
        .init(id:1,time: "3 hrs ago", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "baby",user: "Nathalia Gornicioy"),
        .init(id:2,time: "18 minutes ago", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "user1",user: "Savaje Levan"),
        .init(id:3,time: "yesterday", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "baby",user: "Bruno Pluto")
        ]
}
