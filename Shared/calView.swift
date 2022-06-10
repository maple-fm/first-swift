//
//  calender.swift
//  swift_porject
//
//  Created by 出口楓真 on 2022/06/10.
//

import SwiftUI

struct calView: View {
    @State var date = Date()
    var body: some View {
        VStack{
            Spacer()
            Text("カレンダー")
                .font(.largeTitle)
            Spacer()
            DatePicker("Select Date", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
            Spacer()
        }
        
    }
}

struct calView_Previews: PreviewProvider {
    static var previews: some View {
        calView()
    }
}
