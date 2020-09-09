//
//  CustomSpendingItem.swift
//  Manage_Money
//
//  Created by Uri on 9/8/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct CustomSpendingItem: View {
    @State var idSpending: Int
    var body: some View {
        VStack{
            listSpendingCategory[idSpending].image
            Text("\(listSpendingCategory[idSpending].nameSpending)")
        }.frame(width: UIScreen.main.bounds.width/3 - 43, height: 80)
            .padding()
            .border(Color.gray.opacity(0.5))
            .cornerRadius(13)
    }
}

