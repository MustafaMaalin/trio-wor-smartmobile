//
//  PostPageTest.swift
//  Empathy2
//
//  Created by Vlad on 14/04/2021.
//

import SwiftUI

struct PostPageTest: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 2
    @State var date = Date()
    @State var title = ""
    @State var description = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
        Form {
            Toggle(isOn: $receive, label: {
                Text("Recieve notification")
            })
            Stepper(value: $number, in: 1...10) {
                Text("\(number) Notification\(number > 1 ? "s" : "") per week")
            }
            Picker(selection: $selection, label: Text("Topic")) {
                Text("Depression").tag(1)
                Text("Unemployment").tag(2)
            }
            DatePicker(selection: $date) {
                Text("Date")
            }
            Section(header: Text("Title")) {
                TextField("Your title", text: $title)
            }
            
            Section(header: Text("Description")) {
                TextField("Your description", text: $description)
            }
            
            Button(action: {submit.toggle() }) {
                Text("Submit")
            }
            
                
        }
        .navigationBarTitle("Settings")
    }
}
}

struct PostPageTest_Previews: PreviewProvider {
    static var previews: some View {
        PostPageTest()
    }
}
