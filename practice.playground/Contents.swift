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

// 1.3 URLify

//let stringToURLify = "Hello World My Name Is Ken "
//urlify(stringToURLify)
//
//
//
//func urlify(_ str: String) -> String {
//    let oldStr = str
//    for (index, c) in oldStr.enumerated() {
//        if c == " " {
//            str.insert("%", at: index)
//            str.insert("2", at: index+1)
//            str.insert("0", at: index+2)
//        }
//    }
//
//    return str
//}


// 1.5 One Away

let str1 = "pale"
let str2 = "ple"

oneAway(str1, str2)

func oneAway(_ str1: String, _ str2: String) -> Bool {
    
    // order matters
    if str1 == str2 {
        return false
    }
    
    // if string lengths differ by 1: add/remove
    if abs(str1.count - str2.count) == 1 {
        var diff = false
        
        let str1Bigger = str1.count > str2.count
        
        for (index, c) in str1.enumerated() {
            if str1.index == str2[index] {
                continue
            } else if diff == false {
                diff = true
            } else {
                return false
            }
        }
    }
    
    // if string lenths same: different character
    else if str1.count == str2.count {
        
    }
    
    else {
        return false
    }
    
    // return true if only 1 add, modify, or remove
    return true
}
