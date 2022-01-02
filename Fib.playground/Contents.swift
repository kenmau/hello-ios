func fib(n: Int) -> [Int] {
    var arr = [0, 1]
    
    if n == 0 {
        return []
    } else if n == 1 {
        return [0]
    } else if n == 2 {
        return [0, 1]
    }
    
    for i in 2..<n {
        let next = arr[i-1] + arr[i-2]
        arr.append(next)
    }
    return arr
}

fib(n: 5)
fib(n: 10)
