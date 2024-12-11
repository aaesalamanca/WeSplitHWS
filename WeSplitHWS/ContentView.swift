//
//  ContentView.swift
//  WeSplitHWS
//
//  Created by Alejandro Antonio Estornell Salamanca on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @FocusState private var checkAmountIsFocused: Bool

    @State private var numberOfPeopleIndex = 0

    @State private var tipPercentage = 20

    private var totalAmount: Double {
        checkAmount + checkAmount * Double(tipPercentage) / 100
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Check details") {
                    TextField(
                        "Check amount", value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .focused($checkAmountIsFocused)
                    .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeopleIndex)
                    {
                        ForEach(2..<16) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section("How much tip dou you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            if $0.isMultiple(of: 5) {
                                Text($0, format: .percent)
                            }
                        }
                    }
                    .pickerStyle(.wheel)
                }

                Section("Total amount") {
                    Text(
                        totalAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"))
                }

                Section("Amount per person") {

                }
            }
            .navigationTitle("WeSplitHWS")
            .toolbar {
                if checkAmountIsFocused {
                    Button("Done") {
                        checkAmountIsFocused.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
