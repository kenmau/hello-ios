let arr = [256741038,623958417,467905213,714532089,938071625]

// Write your code here

// Look for the index with the smallest number, the max sum will be the sum of all other integers
var smallest = Int.max
var smallestIndex = -1

// Look for the index with the largest number, the min sum will be the sum of all other integers

var largest = 0
var largestIndex = -1

for (index, num) in arr.enumerated() {
    if num < smallest {
        smallest = num
        smallestIndex = index
    }
    
    if num > largest {
        largest = num
        largestIndex = index
    }
}

var mini: Int = 0
var max: Int = 0

for (index, num) in arr.enumerated() {
    if index != smallestIndex {
        max += num
    }
    
    if index != largestIndex {
        mini += num
    }
}

print(String(format: "%d %d", mini, max))

