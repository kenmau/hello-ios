
func insertionSort(_ array: [Int]) -> [Int]? {
    
    var sortedArray = array
    
    // Loop through each element in the array and sort the array as you go through (in-place sort)
    
    for i in 1 ..< sortedArray.count {
        print("start: \(sortedArray)")
        if sortedArray[i] < sortedArray[i-1] {
            var c = i
            
            // store the value temporarily until we know where to insert it
            let temp = sortedArray[c]
            while c > 0 && temp < sortedArray[c-1] {
                print("before swap: \(sortedArray)")
                // shift to right
                sortedArray[c] = sortedArray[c-1]
                print("after swap: \(sortedArray)")
                c = c-1
            }
            sortedArray[c] = temp
        }
    }
    
    return sortedArray
}

let arr = [5, 2, -6, 10, 4, 6, 9, 12, -4, 5, 3, 2]
print(insertionSort(arr) ?? [])
