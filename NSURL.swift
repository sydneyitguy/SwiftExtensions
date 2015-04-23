extension NSURL {
    var allQueryItems: [NSURLQueryItem] {
        get {
            let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: false)!
            let allQueryItems = components.queryItems!

            return allQueryItems as! [NSURLQueryItem]
        }
    }

    func queryItemForKey(key: String) -> NSURLQueryItem? {
        let predicate = NSPredicate(format: "name=%@", key)

        return (allQueryItems as NSArray).filteredArrayUsingPredicate(predicate).first as? NSURLQueryItem
    }
}
