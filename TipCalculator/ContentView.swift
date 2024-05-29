//
//  ContentView.swift
//  TipCalculator
//
//  Created by Mohammad Azam on 9/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    
    //we will create a instance to use tipCalculator
    let tipCalculator = TipCalculator()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                    /*
                     Here we are adding identifier so that we can access the value
                     in ui testing
                     */
                    .accessibilityIdentifier("totalTextField")
                
                Picker(selection: $tipPercentage) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)
                    .accessibilityIdentifier("tipPercentageSegementedControl")
                
                Button("Calculate Tip") {
                  
                    message = ""
                    tip = ""
                    /*
                     Here we will calculate the tip, to do so we need to first convert
                     '$total' var to double to use it in calculate tip function
                     */
                    guard let total =  Double(self.total) else{
                        message = "Invalid Input"
                        return
                    }
                    
                    /*
                     Now since tipCalculator.calculate is a throwable function ,
                     we cant directly call it , so we will wrap it in do catch block
                     to handel errors
                     */
                    do{
                        let result = try tipCalculator.calculate(total: total, tipPercentage: tipPercentage)
                        /*
                         Now here we cant directly print result , but it is not a good
                         practice so first we will format it before displaying
                         */
                        let formatter = NumberFormatter ()
                        formatter.numberStyle = .currency
                        tip = formatter.string(from: NSNumber(value: result))
                    }
                    catch TipCalculatorError.invalidInput{
                        message = "Invalid Input"
                    }
                    catch {
                        message = error.localizedDescription
                    }
                    
                }.padding(.top, 20)
                
                Text(message)
                    .padding(.top, 50)
                
                Spacer()
                
            
                Text(tip ?? "")
                    .font(.system(size: 54))
                
                Spacer()
                .navigationTitle("Tip Calculator")
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
