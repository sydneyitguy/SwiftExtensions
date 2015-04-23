extension Dictionary {
    mutating func merge(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
