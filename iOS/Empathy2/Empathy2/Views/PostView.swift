//
//  PostView.swift
//  Empathy2
//
//  Created by Mihail on 12/04/2021.
//
import SwiftUI
import UIKit
import Firebase
import Combine

struct PostView: View {
    
    
    @State var searchText = ""
    @State var isSearching = false
    @ObservedObject  static var posts = Posts()
    @ObservedObject static var postList = PostList()
    
    var body: some View {
            
            List{
                //Search Bar
                HStack{
                    TextField("Search For a User...", text: $searchText)
                        .padding(.leading,24)
                }
                .padding()
                .background(Color(.systemFill))
                .cornerRadius(6)
                .onTapGesture {
                    isSearching = true
                }
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                        if isSearching{
                            Button(action: {searchText = ""}, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            })
                           
                        }
                       
                    }.padding(.horizontal,12)
                    .foregroundColor(.black)
                )
                
            // Trending Group
              TrendLine()
                
                    
                //------Posts---------
                ForEach(PostView.posts.posts.filter({$0.user.contains(searchText) || searchText.isEmpty}), id: \.id) { post in
                    PostRow(post: post)
                }
                ForEach(PostView.postList.postList.filter({$0.user.contains(searchText) || searchText.isEmpty}), id: \.id) { post in
                    NewPostsRow(newPosts: post)
                  
                   
                }
                
            }
            
       
    }



struct PostView_Previews: PreviewProvider {
    let posts: Posts
    static var previews: some View {
        PostView()
            .preferredColorScheme(.light)
    }
}

}
