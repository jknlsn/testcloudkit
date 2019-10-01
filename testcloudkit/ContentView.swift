//
//  ContentView.swift
//  testcloudkit
//
//  Created by Jake Nelson on 1/10/19.
//  Copyright © 2019 Jake Nelson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var totalClicked: Int = 0
    
    var body: some View {
        VStack {
            Text("\(totalClicked)").font(.title)
            Spacer()
            Button(action: {
                
                self.totalClicked = self.totalClicked + 1
                
                /// Create Account
                let account = Account(context: self.managedObjectContext)
                
                // Create User
                let user = User(context: self.managedObjectContext)
                
                // Configure User
                user.firstName = "Bart"
                user.lastName = "Jacobs"
                
                account.addToUsers(user)
                // account.users = user
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                
            }) {
                Text("Increment Total")
            }.padding(.all)
        }.padding(.all, 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
