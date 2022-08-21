import Foundation

/*
 * Reto #32
 * EL SEGUNDO
 * Fecha publicación enunciado: 08/08/22
 * Fecha publicación resolución: 15/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un listado de números, encuentra el SEGUNDO más grande.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

findSecondGreatestNumber(in: [3, 10, 2, 4, 8, 7, 5])
findSecondGreatestNumber(in: [1, 2, 3, 4, 4, 6, 7, 9, 9, 10])
findSecondGreatestNumber(in: [1, 1, 1])

/// Finds the second greatest number in an integer array, even if it's repeated among other numbers.
/// * The number list must be formed by, at least, two numbers.
/// * No second greatest number is printed if the list only contains the same number repeated more than once (e.g: [1, 1, 1]).
func findSecondGreatestNumber(in numberList: [Int]) {
    guard numberList.count >= 2 else {
        print("[ERROR] The number list must contain, at least, two numbers.")
        return
    }
    
    var maxNumber = numberList.first!
    var secondMaxNumber: Int?
    
    for loopNumber in numberList[1...] {
        if loopNumber > maxNumber {
            secondMaxNumber = maxNumber
            maxNumber = loopNumber
        } else {
            if secondMaxNumber != nil {
                if loopNumber > secondMaxNumber! {
                    secondMaxNumber = loopNumber
                }
            }
        }
    }
    
    if let secondMaxNumber = secondMaxNumber {
        print("The second greater number is: \(secondMaxNumber)")
    } else {
        print("No second greater number found. Maybe the number list contains the same number repeated several times.")
    }
}
