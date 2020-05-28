
import UIKit

extension SRCore {

    public class Color {

        /// Allows you to convert a 6 digit hex string into a UIColor instance
        /// - Warning: the '#' symbol is stripped from the beginning of the hex string.
        /// - Parameters:
        ///   - hexString: A 6 digit hexadecimal string.
        ///   - alpha: alpha value for the color
        /// - Returns: A UIColor defined by the hexString parameter.
        internal class func fromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
            let r, g, b: CGFloat
            let offset = hexString.hasPrefix("#") ? 1: 0
            let start = hexString.index(hexString.startIndex, offsetBy: offset)
            let hexColor = String(hexString[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                return UIColor(red: r, green: g, blue: b, alpha: alpha)
            }
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }

        /// The primary color for SR apps
        public static var srColor: UIColor {
            return self.fromHexString("006736")
        }

        public static var srSecondaryColor: UIColor {
            return self.fromHexString("003736")
        }
    }
}
