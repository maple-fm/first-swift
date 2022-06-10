//
//  ContentView.swift
//  Shared
//
//  Created by maple on 2022/05/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View{

        TabView{
            calView()
                .tabItem{
                    Text("カレンダー")
                        
                }
            dutchview()
                .tabItem{
                    Text("計算")
                }
                
        }

    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}
