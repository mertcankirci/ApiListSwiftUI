//
//  UIApplication Extension.swift
//  ApiFetchleDataSokCikar
//
//  Created by Mertcan Kırcı on 13.01.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
