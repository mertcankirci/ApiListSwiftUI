//
//  ContentView.swift
//  ApiFetchleDataSokCikar
//
//  Created by Mertcan Kırcı on 7.01.2023.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var network: Network
    @State private var showingSheet: Bool = false
    @State private var searchText: String = ""
    @State private var alphSorted : [User] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("All users")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .center) {
                    SearchBar(text: $searchText)
                    
                    ForEach(network.users.filter {
                        searchText.isEmpty ? true : ($0.name + " " + $0.email + " " + $0.phone).lowercased().contains(searchText.lowercased())
                    }, id:\.self) { user1 in
                        
                        NavigationLink(destination: SecondView(userModel: user1)) {
                            HStack(alignment:.top) {
                                
                                Text("\(user1.id)")
                                    .foregroundColor(Color(hex: 0x939B62))
                                
                                VStack(alignment: .leading) {
                                    Text(user1.name)
                                        .foregroundColor(Color(hex: 0x939B62))
                                        .bold()
                                    
                                    Text(user1.email.lowercased())
                                        .foregroundColor(Color(hex: 0x939B62))
                                    
                                    Text(user1.phone)
                                        .foregroundColor(Color(hex: 0x939B62))
                                }
                            }
                        }
                        .frame(width: 300, alignment: .leading)
                        .padding()
                        .background(Color(hex: 0xFF7B54, opacity: 0.8))
                        .cornerRadius(20)
                    }
                }
                HStack {
                    Button("Alfabetik", action: {
                        alphSorted = network.users.sorted {$0.name < $1.name}
                        network.users = alphSorted
                    })
                    .frame(width: 100, height: 100)
                    .background(Color(hex: 0x939B62))
                    .cornerRadius(15)
                    .foregroundColor(Color(hex: 0xFF7B54))
                    
                    Button("Ters Alfabetik", action: {
                        alphSorted = network.users.sorted {$0.name > $1.name}
                        network.users = alphSorted
                    })
                    .frame(width: 100, height: 100)
                    .background(Color(hex: 0x939B62))
                    .cornerRadius(15)
                    .foregroundColor(Color(hex: 0xFF7B54))
                }
            }
        }
        .onAppear {
            network.getUsers()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
