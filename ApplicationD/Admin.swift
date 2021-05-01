//
//  Admin.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//

import SwiftUI
import CoreData

struct Admin: View {
    
    var moc: NSManagedObjectContext
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    var body: some View {
        VStack {
            Text("Admin View")
            List {
                ForEach(users, id: \.self) { user in
                    Text("User: \(user.firstName) \(user.lastName)")
                }
                .onDelete(perform: { indexSet in
                    deleteItem(indexSet: indexSet)
                })
            }
            Button(action: {
                printUserDefaults()
            }) {
                Text("Print User")
            }
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                
            }
        }
        
    } // end of body
    
    // MARK: func deleteItem()
    
    func deleteItem(indexSet: IndexSet) {
        withAnimation {
            indexSet.map { users[$0] }.forEach(moc.delete)

            do {
                try moc.save()
                print("Deleted users")
            } catch {
                print("Error deleting user")
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func printUserDefaults() {
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
    }
    
    
    
}

//struct Admin_Previews: PreviewProvider {
//    static var previews: some View {
//        Admin()
//    }
//}
