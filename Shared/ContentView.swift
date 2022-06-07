//
//  ContentView.swift
//  Shared
//
//  Created by maple on 2022/05/26.
//

import SwiftUI

struct ContentView: View {
    //総支払金額
    @State private var total = "000"
    // 人数
    @State private var ninzu = 2
    // 一人当たりの支払い金額
    @State private var kingaku = 0
    // 端数
    @State private var hasu = 0
    // 単位
    @State private var unit = 10
    // 入力にエラーがある場合
    @State private var inputError = false
    // アラートダイアログボックスに表示するメッセージ
    @State private var msg = ""
    
    var body: some View{
        VStack{
            Text("割り勘くん")
                .font(.largeTitle)
            HStack{
                Text("金額：")
                TextField("000", text: $total)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Text("円")
            }
            
            Stepper(value: $ninzu, in:2...10){
                Text("人数： \(ninzu)人")
            }
            
            HStack{
                Text("単位：")
                Picker(selection: $unit, label: Text("最小支払金額")){
                    Text("10円").tag(10)
                    Text("100円").tag(100)
                    Text("500円").tag(500)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                self.calc()
            }){
                Text("計算")
                    .foregroundColor(.black)
                    .background(Capsule()
                        .foregroundColor(.purple)
                        .frame(width: 120, height: 35))
            }
            .padding(.top)
            .alert(isPresented: $inputError){
                Alert(title: Text("入力エラー"), message: Text(self.msg), dismissButton: .default(Text("OK")))
            }
            
            if kingaku != 0{
                Text("一人当たりの金額：\(kingaku)円")
                    .padding(.top)
                Text("端数：\(hasu)円")
                    .padding(.top)
            }
            Rectangle()
                .foregroundColor(.yellow)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }
        .font(.title)
        .background(Color.orange)

    }
    
    func calc(){
        if let totalInt = Int(total){
            let kingakuReal = totalInt / ninzu
            kingaku = kingakuReal / unit*unit
            hasu = totalInt - kingaku * ninzu
            if kingaku == 0 {
                msg = "\(unit * ninzu)円以上の金額を入力してください"
                inputError = true
            }
        } else {
            msg = "正しい金額を入力してください"
            inputError = true
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
