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
    
    var body: some View {
        VStack
        {
            
            Image(uiImage: img)
                .resizable()
                .scaledToFill()
                .frame(width:200,height:200)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .clipped()
            
            Button(action:
                    {
                        self.isShowingImage.toggle()
                        print("nruv")
                    },
                   label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                   })
                .sheet(isPresented: $isShowingImage, content: {
                    imgPicker(isPresented: self.$isShowingImage,selectedImg: self.$img)
                })
        }
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
