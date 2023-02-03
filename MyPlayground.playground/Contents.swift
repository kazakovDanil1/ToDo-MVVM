import Foundation

func squareSum(_ vals: [Int]) -> Int {
  
  var total = 0
    
  let sum = vals.map { $0 * 2 }
  
  for i in sum {
    total += i
  }
    
  return total
}

let first = squareSum([1,2,2])
print(first)
