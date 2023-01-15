import Foundation

struct User: Identifiable, Decodable, Hashable {
    var id: Int
    var name: String
    var username: String
    var email: String
  
    var phone: String
    var website: String
    

    struct Address: Decodable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo

        struct Geo: Decodable {
            var lat: String
            var lng: String
        }
    }

    struct Company: Decodable {
        var name: String
        var catchPhrase: String
        var bs: String
    }
}
