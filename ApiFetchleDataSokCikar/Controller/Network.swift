import Foundation
import SwiftUI


class Network: ObservableObject {
    
    @Published var users: [User] = []
    
    
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 { //MARK: statusCode == 200 means request has succeeded
                guard let data = data else { return }
                
                    do {
                        
                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                        DispatchQueue.main.async {
                            self.users = decodedUsers
                        }
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                
            }
        }
        
        dataTask.resume()
        
    }
    
}


