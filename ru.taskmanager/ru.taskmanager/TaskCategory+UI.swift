extension TaskCategory {
    var iconName: String {
        switch self {
        case .work: "briefcase.fill"
        case .study: "graduationcap.fill"
        case .personal: "person.fill"
        }
    }
}
