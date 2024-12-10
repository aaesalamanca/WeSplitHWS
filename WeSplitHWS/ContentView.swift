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

                }

                Section("Total amount") {

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
