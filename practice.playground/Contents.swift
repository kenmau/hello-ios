let arr1 = [12, 15, 25, 65, 75, 89, 100]
let arr2 = [23, 25, 27, 65, 80, 89, 101]

// Find the number of elements in common
// 25, 65, 89

// Brute force approach: For each element in arr1, loop through arr2
var numCommon = 0
//for a in arr1 {
//    for b in arr2 {
//        if a == b {
//            numCommon += 1
//            break
//        }
//    }
//}

var pos1 = 0, pos2 = 0

while pos1 < arr1.count && pos2 < arr2.count {
    if arr1[pos1] == arr2[pos2] {
        numCommon += 1
        pos1 += 1
        pos2 += 1
    } else if arr1[pos1] > arr2[pos2] {
        pos2 += 1
    } else {
        pos1 += 1
    }
}

print(numCommon)

// 1.1
let uniqueCharacters = "abcdefg"

hasAllUniqueCharacters(uniqueCharacters)
hasAllUniqueCharactersDict(uniqueCharacters)

func hasAllUniqueCharacters(_ str: String) -> Bool {
    
    // brute force
    for (index, current) in str.enumerated() {
        // search the rest of the string
        let x = str.index(str.endIndex, offsetBy: index-str.count+1)
        let substr = str[x...]
        print(substr)
        
        for next in substr {
            if current == next {
                return false
            }
        }
    }
    
    return true
}

func hasAllUniqueCharactersDict(_ str: String) -> Bool {
    var characters: [Character: Int] = [:]
    for (i, c) in str.enumerated() {
        if characters[c] != nil {
            return false
        } else {
            characters[c] = i
        }
    }
    return true
}
