struct MyStructure {
    let instanceProp = "ABC"
    static let typeProp = "123"
    
    func instanceFunc() {
        print("i: \(typeProp)")
    }
    
    static func typeFunc() {
        print("s: \(typeProp)")
    }
}

let myStruct = MyStructure()
myStruct.instanceProp()

MyStructure.typeFunc()
