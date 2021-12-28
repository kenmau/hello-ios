let array = [7, 2, 6, 3, 9, -4, 5, 10, 4, 7, 43, -3]

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count/2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    print("leftArray: \(leftArray)")
    print("rightArray: \(rightArray)")
    
    let mergedArray = merge(leftArray, rightArray)
    print("mergedArray: \(mergedArray)")
    return mergedArray
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        } else if right[rightIndex] < left[leftIndex] {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        } else {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

mergeSort(array)
