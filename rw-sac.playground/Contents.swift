var hashTable: [String: String] = [
    "firstName": "Steve"
]

print(hashTable["firstName"]!)

print("firstName".hashValue)
print("hobbies".hashValue)

func naiveHash(_ string: String) -> Int {
    let unicodeScalars = string.unicodeScalars.map { Int($0.value) }
    return unicodeScalars.reduce(0, +)
}


func djb2Hash(_ string :String) -> Int {
    let unicodeScalars = string.unicodeScalars.map { Int($0.value) }
    return unicodeScalars.reduce(5381) {
        ($0 << 5) &+ $0 &+ Int($1)
    }
}

abs(djb2Hash("abc")) % 3
abs(djb2Hash("cba")) % 3
