//
//  AddPost.swift
//  Empathy2
//
//  Created by Vlad on 14/04/2021.
//

import SwiftUI

struct AddPost: View {
    
    @State var isShowingImage = false
    
    @State var img = UIImage()
    
    @State var receive = false
    @State var number = 1
    @State var selection = 2
    @State var date = Date()
    @State var title = ""
    @State var description = ""
    @State var submit = false
    
    var body: some View {
        VStack
        {
            
            
            
            NavigationView {
                
                Form {
                    
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFill()
                        .frame(width:320,height:200)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .clipped()
                    
                    Button(action:
                            {
                                self.isShowingImage.toggle()
                                print("nruv")
                            },
                           label: {
                            Text("Add a photo")
                           })
                        .sheet(isPresented: $isShowingImage, content: {
                            imgPicker(isPresented: self.$isShowingImage,selectedImg: self.$img)
                        })
                    
                Picker(selection: $selection, label: Text("Topic")) {
                    Text("Depression").tag(1)
                    Text("Unemployment").tag(2)
                }
                Section(header: Text("Title")) {
                    TextField("Your title", text: $title)
                }
                
                
                Section(header: Text("Description")) {
                    
                    TextField("Your description", text: $description)
                        .frame( height: 150, alignment: .topLeading)
                        
                }
                
                Button(action: {submit.toggle() }) {
                    Text("Submit")
                }
                
                    
            }
            .navigationBarTitle("Post your story")
        }        }
    }
}






struct imgPicker: UIViewControllerRepresentable{
    
    @Binding var isPresented: Bool
    @Binding var selectedImg: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imgPicker>) -> UIViewController
    {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    //Make COordintaor
    func makeCoordinator() -> imgPicker.Coordintaor{
        return Coordintaor(parent: self)
    }
    
    //Coordinattor classs-------
    class Coordintaor: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        let parent:imgPicker
        init(parent:imgPicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let selectedImgPick = info[.originalImage] as? UIImage {
                print("\(selectedImgPick)")
                self.parent.selectedImg = selectedImgPick
            }
            self.parent.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: imgPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<imgPicker>) {
        
    }
}



struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost()
    }
}
