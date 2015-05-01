extension String {
    var length: Int {
        return count(self)
    }

    func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    // TODO: Handle multiple spaces
    func titleize() -> String {
        var textArray = split(self) { $0 == " " }
        var join:String = ""
        for word in textArray {
            join += "\(String(first(word)!).uppercaseString)\(dropFirst(word)) "
        }

        return dropLast(join)
    }
}

infix operator =~ {}
//  Pattern matching using a regular expression
public func =~ (string: String, pattern: String) -> Bool {
    let regex = ExSwift.regex(pattern, ignoreCase: false)!
    let matches = regex.numberOfMatchesInString(string, options: nil, range: NSMakeRange(0, string.length))

    return matches > 0

}

public class ExSwift {
    internal class func regex (pattern: String, ignoreCase: Bool = false) -> NSRegularExpression? {
        var options = NSRegularExpressionOptions.DotMatchesLineSeparators.rawValue

        if ignoreCase {
            options = NSRegularExpressionOptions.CaseInsensitive.rawValue | options
        }

        var error: NSError? = nil
        let regex = NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions(rawValue: options), error: &error)

        return (error == nil) ? regex : nil
    }
}
