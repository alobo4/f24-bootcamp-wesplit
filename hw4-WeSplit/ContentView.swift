//
//  ContentView.swift
//  hw4-WeSplit
//
//  Created by Alec Lobanov on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    
    let tipAmounts = [10,15,20,25,0]
    
    @State private var inputValue:Double = 0.0
    @State private var numPeople:Double = 2
    @State private var inputTip = 10
    @State private var customTip = 0.0
    
    var totalWithTip: Double{
        return inputValue + (inputValue * (Double(inputTip) / 100))
    }
    
    var amountPerPerson: Double{
        return totalWithTip / numPeople
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("Amount",value: $inputValue,format:.number)
                    TextField("Number of People",value: $numPeople,format:.number)
                }
                Section("How much tip do you want to leave?"){
                    Picker("Select a Unit",selection: $inputTip){
                        ForEach(tipAmounts, id:\.self){unit in
                            Text("\(unit)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .textCase(nil)
                Section("Check Total with Tip:"){
                    Text(totalWithTip,format: .currency(code: "USD"))
                }
                .textCase(nil)
                Section("Amount per person:"){
                    Text(amountPerPerson,format: .currency(code: "USD"))
                }
                .textCase(nil)
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
