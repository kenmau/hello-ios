
let myOptional: String?

myOptional = nil

// Force unwrapping
// let text: String = myOptional!

// Check

if myOptional != nil {
    // Force unwrap, but safer
    let text2: String = myOptional!
} else {
    print("My optional was bound to be nil")
}

// Optional Binding

if let safeOptional = myOptional {
    let text3: String = safeOptional
    print(text3)
} else {
    // Can put something in here
}

// Nil Coalescing Operator - ?? ... default value

let text4: String = myOptional ?? "Ken"
print(text4)

struct MyOptional {
    var property = 123
    func method() {
        print("I am the struct's method.")
    }
}

let optionalStruct: MyOptional?

// initialization
optionalStruct = MyOptional()

// Optional chaining

print(optionalStruct?.property)
print(optionalStruct?.method())
