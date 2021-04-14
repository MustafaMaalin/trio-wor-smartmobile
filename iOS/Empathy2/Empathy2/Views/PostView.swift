//
//  PostView.swift
//  Empathy2
//
//  Created by Mihail on 12/04/2021.
//
import SwiftUI

struct PostView: View {
    
    let posts: [Post] = [
        .init(id:0,time: "4 hrs ago", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "user1",user: "Billy Boy"),
        .init(id:1,time: "3 hrs ago", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "user1",user: "Nathalia Gornicioy"),
        .init(id:2,time: "18 minutes ago", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "user1",user: "Savaje Levan"),
        .init(id:3,time: "yesterday", body: "Some Info to be added according to the first line of the last initialisation on the transport thingie", image: "user1",user: "Bruno Pluto")
        ]
    
    var body: some View {
        NavigationView{
            
            List{
            // Trending Group
              TrendLine()
                    
                //------Posts---------
                ForEach(posts, id: \.id) { post in
                    PostRow(post: post)
                }
            }.navigationTitle("Feed")
            
        }
    }






struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .preferredColorScheme(.dark)
    }
}

}
