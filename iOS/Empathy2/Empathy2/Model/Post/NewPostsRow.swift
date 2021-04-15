//
//  NewPostsRow.swift
//  Empathy2
//
//  Created by Mihail on 15/04/2021.
//

import SwiftUI
import FirebaseStorage
import Combine

struct NewPostsRow: View {
    
    var newPosts:NewPosts
    @State var img = UIImage()
    
    
    
    var body: some View {
        
        
        VStack(alignment: .leading)
        {
            
            HStack
            {
                Image("user1")
                    .resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 60, height: 60)
                    .clipped()
                
                VStack(alignment: .leading){
                    Text(newPosts.user).font(.headline)
                    Text("Posted a while ago").font(.subheadline)
                }
                
            }.padding(.leading,16).padding(.top,16)
            
            
            Text(newPosts.description)
                .padding(.leading,16)
            Image(uiImage: newPosts.image).resizable().aspectRatio(contentMode: .fill).clipped()
            
            
        }.onAppear{
            getData()
        }
        
        
        
    }
    
    func getData() {
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url,completionHandler: {data,_,error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.img = image!
            }
            
            
        })
    }
    
}


