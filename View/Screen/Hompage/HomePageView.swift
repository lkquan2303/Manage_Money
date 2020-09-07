//
//  HomePageView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    @State var isPickMoney = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                HStack{
                    Button(action: {
                        self.isPickMoney = false
                    }) {
                        Text("Tiền chi")
                            .foregroundColor(isPickMoney ? Color.orange : Color.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 30)
                    }
                    .background(isPickMoney ? Color.gray.opacity(0.2) : Color.orange)
                    .cornerRadius(8)
                    Spacer().frame(width: 0)
                    Button(action: {
                        self.isPickMoney = true
                    }) {
                        Text("Tiền thu")
                            .foregroundColor(isPickMoney ? Color.white : Color.orange)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 30)
                    }
                    .background(isPickMoney ? Color.orange : Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
                Spacer()
            }
            .padding(.top)
            Spacer()
        }
    }
}
