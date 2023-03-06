import UIKit

let url1 = URL(string: "https://applecoding.com/wp-content/uploads/2019/06/combine-operators-1024x573-1024x576.jpg")!
let url2 = URL(string: "https://applecoding.com/wp-content/uploads/2019/06/wwdc_2_0.jpg")!
let url3 = URL(string: "https://applecoding.com/wp-content/uploads/2019/03/UI-Kit-apple-796x412-390x220.jpg")!

func getImageSimple(url: URL) async throws -> UIImage? {
    let (data, _) = try await URLSession.shared.data(from: url)
    return UIImage(data: data)!
}

Task {
    let image1 = try await getImageSimple(url: url1)
    let image2 = try await getImageSimple(url: url2)
    let image3 = try await getImageSimple(url: url3)

    if let image1, let image2, let image3 {
        image1
        image2
        image3
    }
}

Task {
    async let image1 = getImageSimple(url: url1)
    async let image2 = getImageSimple(url: url2)
    async let image3 = getImageSimple(url: url3)

    let (i1, i2, i3) = try await (image1, image2, image3)

    if let i1, let i2, let i3 {
        i1
        i2
        i3
    }
}
