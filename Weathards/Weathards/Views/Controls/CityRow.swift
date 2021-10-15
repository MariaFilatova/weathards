//
//  CityRow.swift
//  Weathards
//
//  Created by Waind Storm on 15.10.21.
//

import SwiftUI

struct CityRow: View {
    var name: String
    
    var body: some View {
        BodyText(text: name, textColor: .white)
            .listRowBackground(Color.black)
    }
}
