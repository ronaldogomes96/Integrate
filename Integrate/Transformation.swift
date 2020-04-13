
import Foundation

/*
    Pega a string digitada e trasforma da maneira que
    a NSExpression aceita para receber parametros diferentes
    de numeros ou da constante x
 */

func transformacaoString(input: String){
    
    //Array de possiveis entradas trigonometricas
    let validations: [String] = ["cos", "sin", "tan", "asin", "acos", "atan",
                                 "sinh", "cosh", "tanh"]
    let inputArray: Array = Array(input)
    
    // Variavel de controle
    var i = 0
    
    while(i < inputArray.count) {
        
        //Verifica se ja esta no final do array
        if(i>=(inputArray.count-2)){
            
            formula.append(String(inputArray[i...inputArray.count-1]))
            break
        }
        
        //Verifica se esta contido no validations
        else if validations.contains(String(inputArray[i...i+2]))  &&
                !validations.contains(String(inputArray[i...i+3])){
            
            formula += "function(x, '\(String(inputArray[i...i+2]))')"
            i += 6
        }
        
        else if validations.contains(String(inputArray[i...i+3])){
                   
            formula += "function(x, '\(String(inputArray[i...i+3]))')"
            i += 7
        }
        
        else{
            
            formula.append(inputArray[i])
            i += 1
        }
    }
    
}

