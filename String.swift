extension String {
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