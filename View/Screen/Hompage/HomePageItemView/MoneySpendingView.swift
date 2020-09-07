//
//  MoneySpendingView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct MoneySpendingView: View {
    let f = DateFormatter()
    @State var nowDay = Date()
    @State var isShowDayPicker = false
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var body: some View {
        ZStack{
            ZStack{
                isShowDayPicker ? Color.gray.opacity(0.3) : Color.clear
            }
            .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Ngày")
                    Spacer()
                    HStack{
                        Button(action: {
                            
                        }) {
                            Image(systemName: "chevron.left")
                        }
                        HStack{
                            Button(action: {
                                self.isShowDayPicker = true
                            }) {
                                Text("\(nowDay, formatter: dateFormatter) \(f.weekdaySymbols[Calendar.current.component(.weekday, from: nowDay) - 1])")
                                    .foregroundColor(Color.black)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 4)
                            }
                        }.background(Color.yellow.opacity(0.15))

                        Button(action: {
                            
                        }) {
                            Image(systemName: "chevron.right")
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal)
            DayPickerView(nowDay: $nowDay, isShowTime: $isShowDayPicker)
                .offset(y: self.isShowDayPicker ? 0 : UIScreen.main.bounds.height)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.6))
        }
        
    }
}

