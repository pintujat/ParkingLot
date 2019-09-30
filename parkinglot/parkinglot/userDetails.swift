

import Foundation

class userDetails
{
 
    var name: String!
    var email: String!
    var password: String!
    var gender: String!
    
    
     private static var userList = [String: userDetails]()
  
    init(){
        self.name = ""
        self.email = ""
        self.password = ""
        self.gender = ""
    }
    init(_ name: String,  _ email: String, _ password: String, _ gender: String) {
        self.name = name
        self.email = email
        self.password = password
        self.gender = gender
    }
   
    static func deleteUser(newUser: userDetails) -> Bool {
        self.userList[newUser.email] = nil
        return true
    }
    
    static func getAllUsers() -> [String: userDetails]{
        return userList
    }
    
    static func addUser(newUser: userDetails) -> Bool {
        if self.userList[newUser.email] == nil{
            self.userList[newUser.email] = newUser
            return true
        }
        return false
    }
    
    static func searchUser(userEmail: String) -> userDetails {
        if self.userList[userEmail] != nil{
            return self.userList[userEmail]!
        }
        return userDetails()
    }
    
    static func updateUser(userEmail: String, password: String) -> Bool {
        self.userList[userEmail]?.password = password
        return true
    }
}
