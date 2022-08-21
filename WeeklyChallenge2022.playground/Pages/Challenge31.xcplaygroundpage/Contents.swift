import Foundation

/*
 * Reto #31
 * AÑOS BISIESTOS
 * Fecha publicación enunciado: 01/08/22
 * Fecha publicación resolución: 08/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que imprima los 30 próximos años bisiestos siguientes a uno dado.
 * - Utiliza el menor número de líneas para resolver el ejercicio.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

calculateNextThirtyLeapYears(from: 2020)

func calculateNextThirtyLeapYears(from year: Int) {
    var nextThirtyLeapYears = [Int]()
    
    var potentialLeapYear = year
    
    while nextThirtyLeapYears.count != 30 {
        let divisibleBy4 = potentialLeapYear.isMultiple(of: 4)
        let notDivisibleBy100 = !potentialLeapYear.isMultiple(of: 100)
        let divisibleBy400 = potentialLeapYear.isMultiple(of: 400)
        
        let meetsLeapConditions = divisibleBy4 && (notDivisibleBy100 || divisibleBy400)
        
        if  meetsLeapConditions {
            nextThirtyLeapYears.append(potentialLeapYear)
        }
        
        potentialLeapYear += 1
    }
    
    print("Next 30 leap years from \(year): ")
    print(nextThirtyLeapYears)
}
