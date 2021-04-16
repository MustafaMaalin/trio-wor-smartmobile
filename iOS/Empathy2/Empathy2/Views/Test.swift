//
//  Test.swift
//  Empathy2
//
//  Created by Vlad on 14/04/2021.
//

import SwiftUI

struct Test: View {
    init()
    {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    var icons = ["house","person.2", "plus.app.fill","message","person",]
    
    @State var showModal = false
    @State var selectedIndex = 0
    
    var body: some View
    {
        VStack
        {
            ZStack
            {
                Spacer()
                    .fullScreenCover(isPresented: $showModal, content: {
                        Button(action: {showModal.toggle()}, label: {
                            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        })
                        Text("Wassup")
                    })
                
                switch selectedIndex
                {
                case 0: PostView()
                case 1: EventsView()
                case 2: AddPost()
                case 3: ContentView()
                case 4: Profile()
                    
                default:
                    Text("Remaining")
                }
            }
            
            Spacer()
 
            HStack
            {
                ForEach(0..<5) {num in
                    Button(action: {
                        
                        selectedIndex = num
                        
                        if num == 2
                        {
                       
                        }
                        
                    }, label: {
                        Spacer()
                        
                        if num == 2
                        {
                            Image(systemName: icons[num])
                                .font(.system(size:49,weight: .light))
                                .foregroundColor(.white)
                        }
                        else
                        {
                        Image(systemName: icons[num])
                            .font(.system(size:22,weight: .bold))
                            .foregroundColor( selectedIndex == num ? Color(.label) :
                                                .init(.gray))
                        }
                        Spacer()
                        
                    })
                    
                  
                }
               
            }
        }
    }
}
    
        





struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
