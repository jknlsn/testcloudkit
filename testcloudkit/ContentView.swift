//
//  ContentView.swift
//  testcloudkit
//
//  Created by Jake Nelson on 1/10/19.
//  Copyright © 2019 Jake Nelson. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var totalClicked: Int = 0
    @State var debugString: String = ""
    
    @FetchRequest(fetchRequest: fetchRequest(), animation: nil) var people : FetchedResults
    
    //Core Data Fetch Request
    static func fetchRequest() -> NSFetchRequest<User> {
        let request : NSFetchRequest = User.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: false)]
        return request
    }
    
    // Account fetch
    @FetchRequest(fetchRequest: accountsFetchRequest(), animation: nil) var accounts : FetchedResults
    
    //Core Data Fetch Request
    static func accountsFetchRequest() -> NSFetchRequest<Account> {
        let request : NSFetchRequest = Account.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: false)]
        return request
    }
    
    var body: some View {
        VStack {
            Text("\(totalClicked)").font(.title)
            Text("\(debugString)").font(.title)
            Spacer()
            List (people, id: \.objectID) {person in
                Text("\(person.lastName ?? "")")
                Text("\(person.firstName ?? "")")
            }
            Spacer()
            List (accounts, id: \.objectID) {account in
                Text("no bueno")
            }
            Spacer()
            Button(action: {
                
                self.totalClicked = self.totalClicked + 1
                
//                /// Create Account
//                let account = Account(context: self.managedObjectContext)
//                account.title = "Admin"
//
//                // Create User
//                let user = User(context: self.managedObjectContext)
//
//                // Configure User
//                user.firstName = "Bart"
//                user.lastName = "Jacobs"
//
//                account.addToUsers(user)
//                // account.users = user
//
//                do {
//                    try self.managedObjectContext.save()
//                } catch {
//                    print(error)
//                }
                
                print(self.accounts[0].users?.allObjects)
                
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
