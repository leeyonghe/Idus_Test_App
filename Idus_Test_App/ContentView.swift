//
//  ContentView.swift
//  Idus_Test_App
//
//  Created by lee on 2019/12/02.
//  Copyright © 2019 lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("This Test")
                .font(.title)
                .colorMultiply(.green)
            HStack {
                Text("this is subline1")
                    .font(.subheadline)
                Spacer()
                Text("this is subline1")
                .font(.subheadline)
            }
        }.padding(25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
