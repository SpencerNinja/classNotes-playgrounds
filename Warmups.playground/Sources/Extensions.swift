import Foundation

///
///
///
///```
///let exampleStr = "hello"
///print(exampleStr[0])
///output: 'h'
///
///let exampleStr2 = "goodbye"
///print(exampleStr2[-1])
///output: 'e'
///```
///
///
///
public extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
