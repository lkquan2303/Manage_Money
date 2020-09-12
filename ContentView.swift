//
//  ContentView.swift
//  Manage_Money
//
//  Created by Uri on 9/4/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isMoney = false
    var body: some View {
        SignInView()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
