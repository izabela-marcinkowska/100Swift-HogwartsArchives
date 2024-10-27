//
//  ContentView.swift
//  HogwartsArchives
//
//  Created by Izabela Marcinkowska on 2024-10-25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Student.name) private var students: [Student]
    
    func loadData() async {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/students") else {
            print("invaild url")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("this is data \(data)")
            let decoder = JSONDecoder()
            print("inside the do")
            if let decodedResponse = try? decoder.decode([Student].self, from: data) {
                DispatchQueue.main.async {
                    for student in decodedResponse {
                        print("This is student (\(student.name))")
                        self.modelContext.insert(student)
                    }
                    try? self.modelContext.save()
                }
            } else {
                print("Failed to decode JSON")
            }
        } catch {
            print("Error fetching data")
        }
    }
    
    var body: some View {
        NavigationStack{
            List(students) { student in
                NavigationLink(value: student) {
                    VStack (alignment: .leading) {
                        Text(student.name)
                        Text(student.house ?? "No house")
                    }
                }
            }
            .navigationTitle("Hogwarts Archives")
            .navigationDestination(for: Student.self) { student in
                StudentView(student: student)
            }
        }
        .task {
            if students.isEmpty {
                await loadData()
            } else {
                print("Already loaded data")
            }
        }
    }
}

#Preview {
    ContentView()
}
