//
//  Created by James(Zhanao占鳌) Sun on 12/7/20.
//  Visit ZhanaoSun.com
//

import SwiftUI

struct ContentView: View {
    
    let tipPercentages = [10, 15, 20, 25, 30]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    @State private var tapCount = 0
    
    var finalTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople+1)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    
    var body: some View {
        
        NavigationView {
            
        Form {
            
            Section(header: Text("WhatsTip by Zhanao Sun")) {
                
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)

                Picker("Type of Meal", selection: $numberOfPeople) {
                    ForEach(1 ..< 100) { num in
                        if num == 1{
                            Text("1 Person Meal")}
                        else {
                        Text("\(num) People Meal")
                        }
                    }
                }
            }
            
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
                Text("You chose: \(tipPercentages[tipPercentage]) %")
                Text("Tip: $\(finalTip, specifier: "%.2f")")
             
                
                if numberOfPeople > 0 {
                Text("Each should pay $\(totalPerPerson, specifier: "%.2f")")
                } else {
                Text("You should pay $\(totalPerPerson, specifier: "%.2f")")
            }
            
            Section{
                Text("Setting")
                Text("Donation :D")
                Text("Suggestion")
                }
            
            Section(header: Text("Use tap count to decide who to pay the tip?")){
                Button("Tap Count: \(tapCount)") {
                            self.tapCount += 1
                        }
                Button("Clear Tap Count"){self.tapCount = 0}
                    }
                }
        .navigationBarTitle("WhatsTip")
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
