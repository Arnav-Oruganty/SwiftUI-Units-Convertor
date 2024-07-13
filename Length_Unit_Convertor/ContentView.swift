//
//  ContentView.swift
//  Length_Unit_Convertor
//
//  Created by Arnav Oruganty on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input_exist: Double?
    @FocusState private var is_focused: Bool
    let units: [UnitLength] = [.meters , .kilometers , .feet , .yards , .miles]
    @State private var input_unit: UnitLength = .meters
    @State private var output_unit: UnitLength = .kilometers
    
    var result: Double? {
        if let input_exist = input_exist{
            let input = Measurement(value: input_exist, unit: input_unit)
            return input.converted(to: output_unit).value
        }
        else{
            return nil
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("input") {
                    Picker ("Input Unit", selection: $input_unit) {
                        ForEach(units , id: \.self){
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField ("Enter Value", value: $input_exist, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($is_focused)
                }
                
                Section("output") {
                    Picker ("Input Unit", selection: $output_unit) {
                        ForEach(units , id: \.self){
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(result?.formatted() ?? "")
                }
                
            }
            .navigationTitle("Unit Convertor")
            .toolbar{
                if is_focused{
                    Button("Done"){
                        is_focused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
