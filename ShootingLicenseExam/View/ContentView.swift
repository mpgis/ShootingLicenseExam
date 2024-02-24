//
//  ContentView.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var counter: Int = 1
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        NavigationStack(path: $navigationPath){
            VStack{
                Text("Liczba egzaminow")
                
                Stepper(value: $counter, in: 1...Int.max, step: 1) {
                    Text("Adjust Number: \(counter)")
                }
                
                Button("GO"){
                    isPressed.toggle()
                }
    
            }
            .navigationDestination(isPresented: $isPressed){
                ExamView(examViewModel: ExamViewModel(howManyExam: counter))
            }
        }
    }
}

#Preview {
    ContentView()
}
