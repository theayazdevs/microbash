//
//  MyModel.swift
//
//

import Foundation
import UIKit

class MyModel{
    //array to hold objects of type LearnItem
    var learnItems = [LearnItem]()
    //initializing the intsance of the class
    init(){
        //adding elements to the array
        learnItems.append(LearnItem(name: " INFLUENZA VIRUS ",
                                    description: "Influenza, commonly known as the flu, is a highly contagious viral infection that affects the respiratory system. It is caused by the influenza virus, which is divided into three types: A, B, and C. Influenza A is the most virulent and causes the majority of seasonal outbreaks and pandemics.",
                                    image: UIImage(named: "influenzaVirus.jpg")!))
        learnItems.append(LearnItem(name: " MEASLES VIRUS ",
                                    description: "A highly contagious virus that causes a rash, fever, cough, and runny nose. Measles can be severe and sometimes lead to complications such as pneumonia or encephalitis.",
                                    image: UIImage(named: "measlesVirus")!))
        learnItems.append(LearnItem(name: " STREPTOCOCCUS PNEUMONIAE ",
                                    description: "Streptococcus pneumoniae, also known as pneumococcus, is a type of bacteria that can cause various infections, including pneumonia, meningitis, and ear infections. It is a gram-positive bacteria and is spread through respiratory droplets.",
                                    image: UIImage(named: "streptococcusBacteria.jpg")!))
        learnItems.append(LearnItem(name: " SALMONELLA ",
                                    description: "Salmonella is a type of bacteria that can cause foodborne illness, typically through contaminated food or water. It is a gram-negative bacteria and is commonly found in the intestines of animals and humans.",
                                    image: UIImage(named: "salmonellaBacteria.png")!))
        learnItems.append(LearnItem(name: " FRUITS #1 ",
                                    description: "Fruits are rich in vitamins, minerals, fiber, and antioxidants, which are essential for maintaining good health and preventing chronic diseases.",
                                    image: UIImage(named: "apple")!))
        learnItems.append(LearnItem(name: " FRUITS #2 ",
                                    description: "Fruits are rich in vitamin C, which is important for maintaining a healthy immune system and fighting off infections.",
                                    image: UIImage(named: "orange")!))
        learnItems.append(LearnItem(name: " FRUITS #3 ",
                                    description: "Some fruits, such as berries and cherries, contain antioxidants that can help reduce inflammation in the body, which is linked to many chronic diseases.",
                                    image: UIImage(named: "bananas")!))
        learnItems.append(LearnItem(name: " FRUITS #4 ",
                                    description: "Fruits are a good source of carbohydrates, which are important for providing energy to the body.",
                                    image: UIImage(named: "strawberry")!))
    }
    
    //to return the array
    open func getLearnItems() -> [LearnItem] {
        return learnItems
    }
}

//Learn item class
class LearnItem {
    //variables to hold item name, desciription and image
    private var itemName:String
    private var itemDescription:String
    private var itemImage:UIImage
    
    //initializing the class
    init(name:String, description:String, image:UIImage) {
        self.itemName = name
        self.itemDescription = description
        self.itemImage = image
    }
    //to return the title
    public func getItemName() -> String {
        return itemName
    }
    //to return the description
    public func getItemDescription() -> String {
        return itemDescription
    }
    //to returnt the image
    public func getImage() -> UIImage {
        return itemImage
    }
}
