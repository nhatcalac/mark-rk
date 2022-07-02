//
//  PersistenceViewModel.swift
//  With (iOS)
//
//  Created by Nhất Minh on 25/06/2022.
//
import SwiftUI
import CoreData
class PersistenceViewModel : ObservableObject {
    let container : NSPersistentContainer
    @Published var fruits : [Fruits] = []
    init(){
        container = NSPersistentContainer(name: "With")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("error load persistent \(error)")
            }
        }
        fetchFruits()
    }
    func addFruits(text : String){
        let fruit = Fruits(context: container.viewContext)
        fruit.name = text
        saveFruit()
        fetchFruits()
    }
    func fetchFruits(){
        let request = NSFetchRequest<Fruits>(entityName: "Fruits")
        do {
            let fruit = try container.viewContext.fetch(request)
            fruits = fruit
        }catch{
            print("error fetch Fruits : \(error.localizedDescription)")
        }
    }
    func saveFruit(){
       try? container.viewContext.save()
        fetchFruits()
    }
    func deleteFruit(index: IndexSet){
        guard let index = index.first else { return  }
        let fruit = fruits[index]
        container.viewContext.delete(fruit)
        saveFruit()
    }
}
//mark
