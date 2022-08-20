import Foundation

/*
 * Reto #33
 * CICLO SEXAGENARIO CHINO
 * Fecha publicación enunciado: 15/08/22
 * Fecha publicación resolución: 22/08/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un función, que dado un año, indique el elemento y animal correspondiente
 * en el ciclo sexagenario del zodíaco chino.
 * - Información: https://www.travelchinaguide.com/intro/astrology/60year-cycle.htm
 * - El ciclo sexagenario se corresponde con la combinación de los elementos madera,
 *   fuego, tierra, metal, agua y los animales rata, buey, tigre, conejo, dragón, serpiente,
 *   caballo, oveja, mono, gallo, perro, cerdo (en este orden).
 * - Cada elemento se repite dos años seguidos.
 * - El último ciclo sexagenario comenzó en 1984 (Madera Rata).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

/// CALLS

(1984...2043).forEach(getChineseEquivalent(for:))

/// SETUP

struct Constants {
    static let kStartingCycleReferenceYear = 1924
}

protocol ChineseItem: CaseIterable, CustomStringConvertible, Hashable {
    static var numberOfYearsInARow: Int { get set }
}

enum WuXing: ChineseItem {
    case wood, fire, grass, metal, water
    
    var description: String {
        switch self {
        case .wood: return "Wood"
        case .fire: return "Fire"
        case .grass: return "Earth"
        case .metal: return "Metal"
        case .water: return "Water"
        }
    }
    
    static var numberOfYearsInARow = 2
}

enum ZodiacSign: ChineseItem {
    case rat, ox, tiger, rabbit, dragon, snake, horse, sheep, monkey, rooster, dog, pig
    
    var description: String {
        switch self {
        case .rat: return "Rat"
        case .ox: return "Ox"
        case .tiger: return "Tiger"
        case .rabbit: return "Rabbit"
        case .dragon: return "Dragon"
        case .snake: return "Snake"
        case .horse: return "Horse"
        case .sheep: return "Sheep"
        case .monkey: return "Monkey"
        case .rooster: return "Rooster"
        case .dog: return "Dog"
        case .pig: return "Pig"
        }
    }
    
    static var numberOfYearsInARow = 1
}

/// Given a positive year, this method returns the corresponding Chinese items: WuXing and ZodiacSign.
func getChineseEquivalent(for year: Int) {
    // Validations
    guard year >= 0 else {
        print("[ERROR] The year to calculate \(year) must be positive.")
        return
    }
    
    // Calculations
    let yearWuXing: WuXing = getItem(for: year)
    let yearZodiacSign: ZodiacSign = getItem(for: year)
    
    // Final Result
    print("[\(year)] WuXing: \(yearWuXing) - ZodiacSign: \(yearZodiacSign)")
}

/// Given a positive year, this method returns the corresponding item.
func getItem<T: ChineseItem>(for year: Int) -> T {
    let yearDifference = year - Constants.kStartingCycleReferenceYear
    let numberOfItems = T.allCases.count
    
    var itemYearIndex = (Int(yearDifference/T.numberOfYearsInARow)) % numberOfItems
    
    // Check the given year is more recent than the starting cycle reference year.
    // Otherwise, calculate the positive difference, and consequently the positive index for the item.
    if yearDifference < 0 {
        itemYearIndex = numberOfItems - itemYearIndex
    }
    
    let yearItem = Array(T.allCases)[itemYearIndex]
    
    return yearItem
}
