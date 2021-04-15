//
//  AddPost.swift
//  Empathy2
//
//  Created by Vlad on 14/04/2021.
//

import SwiftUI
import Firebase


struct AddPost: View {
    
    let storage = Storage.storage().reference()
    
    @State var imgTest = Data()
    @State var isShowingImage = false
    
    @State var img = UIImage()
    
    @State var receive = false
    @State var number = 1
    @State var selection = 2
    @State var date = Date()
    @State var title = ""
    @State var description = ""
    @State var submit = false
    
    @State var isHovered = false
    
    @ObservedObject var posts = Posts()
    @ObservedObject var postList = PostList()
    
    
    var body: some View {
        
        VStack
        {
            NavigationView {
                
                Form {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFill()
                        .frame(width:300,height:200)
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
                            imgPicker(isPresented: self.$isShowingImage,selectedImg: self.$img, imgPost: self.$imgTest)
                        })
                    
                    Picker(selection: $selection, label: Text("Topic")) {
                        Text("Depression").tag(1)
                        Text("Unemployment").tag(2)
                        Text("Addiction").tag(3)
                    }
                    Section(header: Text("Title")) {
                        TextField("Your title", text: $title)
                    }
                    
                    
                    Section(header: Text("Description")) {
                        
                        TextField("Your description", text: $description)
                            .frame( height: 150, alignment: .topLeading)
                    }
                    
                    Button(action: {
                        submit.toggle()
                        putData()
                        
                        PostView.postList.postList.append(NewPosts(id:0, image:self.img, description:self.description, user: "Lewie Balkan"))
                        
                        PostView.posts.posts.append(Post(id: 4, time: "Anytime", body: "bruh",
                                                         image: "5", user: "Billy boy"))
                       
                        
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                    
                    
                    
                }.frame(alignment:.center)
                .navigationBarTitle("New Post")
            }
            
        }.padding(.top,-50)
    }
    
    

    
    func putData() {
        
        
        
        storage.child("images/file.png").putData(imgTest, metadata: nil, completion: {_, error in
            guard error == nil else {
                print("failed to upload")
                return
            }
            self.storage.child("images/file.png").downloadURL(completion: {url, error in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                print("Donwload url: \(urlString)")
                UserDefaults.standard.setValue(urlString, forKey: "url")
                
            })
        })
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url,completionHandler: {data,_,error in
            guard let data = data, error == nil else {
                return
            }
            
            let image = UIImage(data: data)
            self.img = image!
        })
        
    }
    
    
    
    
    struct imgPicker: UIViewControllerRepresentable{
        
        @Binding var isPresented: Bool
        @Binding var selectedImg: UIImage
        @Binding var imgPost: Data
        
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
            
            var parent:imgPicker
            init(parent:imgPicker) {
                self.parent = parent
            }
            //Image picker Controller
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                picker.dismiss(animated: true, completion: nil)
                
                if let selectedImgPick = info[.originalImage] as? UIImage {
                    print("\(selectedImgPick)")
                    self.parent.selectedImg = selectedImgPick
                    
                    guard let imageData = selectedImgPick.pngData() else{
                        return
                    }
                    self.parent.imgPost = imageData
                    
                    
                }
                
                
                
                self.parent.isPresented = false
                
            }
            
            
        }
        
        
        //    func addToDB(){
        //           db.collection("images").addDocument(data: Storage) {(error) in
        //               if let e = error{
        //                   print("There was an error, \(e)")
        //               }
        //               else {
        //                   print("Success")
        //               }
        //           }
        //       }
        
        func updateUIViewController(_ uiViewController: imgPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<imgPicker>) {
            
        }
        
        
    }
    
    
    
    
    
    
    struct AddPost_Previews: PreviewProvider {
        static var previews: some View {
            AddPost()
        }
    }
    
    
    
}

