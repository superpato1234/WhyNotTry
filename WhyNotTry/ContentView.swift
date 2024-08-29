//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Luis Pablo Serrano Muñoz on 29/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    
    @State private var colorSelected: Color = .blue
    @State private var selected = "Baseball"
    @State private var id = 1
    
    var body: some View{
        VStack{
            Text("Why not try…")
                    .font(.largeTitle.bold())
            Spacer()
            VStack{
                Circle()
                    .fill(colorSelected)
                    .padding()
                    .overlay(
                        Image(
                            systemName: "figure.\(selected.lowercased())")
                                .font(.system(size: 144))
                                .foregroundColor(.white)
                    )
                Text("\(selected)!")
                    .font(.title)
            }.transition(.slide)
                .id(id)
            Spacer()
        }
        Button("Try again") {
            withAnimation(.easeIn(duration: 1)){
                selected = activities.randomElement() ?? "Archery"
                colorSelected = colors.randomElement() ?? .blue
                id+=1
            }
        }
        .buttonStyle(.borderedProminent)
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
