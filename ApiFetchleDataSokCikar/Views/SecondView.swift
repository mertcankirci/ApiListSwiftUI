//
//  SecondView.swift
//  ApiFetchleDataSokCikar
//
//  Created by Mertcan Kırcı on 7.01.2023.
//

import SwiftUI
import Foundation

struct SecondView: View {
   
    @EnvironmentObject var network : Network
    var userModel : User
    init(userModel: User) {
        self.userModel = userModel
    }
    
   
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                        Text("User Detail")
                        .font(.largeTitle)
                    HStack{
                        Text("\(userModel.id)")
                            .font(.headline)
                        VStack {
                            Text(userModel.name)
                                .font(.title)
                            Text(userModel.phone)
                                .font(.subheadline)
                            Text(userModel.email)
                                .font(.title3)
                        }
                    }
                    .frame(width: 300, height: 300)
                    .background(Color(hex: 0xFF7B54))
                    .cornerRadius(30)
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
    }
    
    
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(userModel: Network().users[0], userName: "YARRAK")
//
//    }
//}
