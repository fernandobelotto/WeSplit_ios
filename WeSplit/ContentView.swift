import SwiftUI

struct ContentView: View {
    
//    @State var tapCount = 0
//    @State var tapCountSecond = 0
//    @State private var name = ""
    
//    let students = ["fer", "julio", "carolina"]
//    @State private var selectedStudent = "harry"
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let orderAmount = Double(checkAmount) ?? 0
//        let stringValue = "0.5"
//        let doubleValue = Double(stringValue)
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("how much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
        
//        Picker("select student", selection: $selectedStudent) {
//            ForEach(0 ..< students.count) {
//                Text(self.students[$0])
//            }
//        }
//        NavigationView {
//            Form {
//                ForEach(0 ..< 100) {
//                    Text("Row \($0)")
//                }
//            }
//            .navigationBarTitle(Text("SwiftUI"))
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Section {
//    TextField("digite seu nome", text: $name)
//    Text("Hello World")
//    Button("Tap Count: \(tapCount)") {
//        self.tapCount += 1
//        self.tapCountSecond += 2
//    }
//    Text("\(tapCountSecond)")
//    Text("\(name)")
//}
