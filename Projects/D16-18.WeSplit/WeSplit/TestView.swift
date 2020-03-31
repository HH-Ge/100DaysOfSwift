//
//  Test.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/13.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI


struct TestView: View {
  
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("body").font(.body)
            Text("callout").font(.callout)
            Text("caption").font(.caption)
            Text("footnote").font(.footnote)
            Text("headline").font(.headline)
            Text("largeTitle").font(.largeTitle)
            Text("subheadline").font(.subheadline)
            Text("title").font(.title)

        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
