import Cocoa

struct Cookie{
    var size = 5
    var hasChoclateChips = false
}

struct Bakery{
    var delegate: BakeryDelegate?
    func makeCookie(){
        var cookie = Cookie()
        cookie.size = 6
        cookie.hasChoclateChips = true
        delegate?.cookieWasBaked(made: cookie)
    }
}
protocol BakeryDelegate{
    func cookieWasBaked(made cookie: Cookie)
}

class CookieShop : BakeryDelegate{
    func cookieWasBaked(made cookie: Cookie) {
        print("cookie was made in \(cookie.size)")
    }
}

let shop = CookieShop()
var bakery = Bakery()
bakery.delegate = shop
bakery.makeCookie()

