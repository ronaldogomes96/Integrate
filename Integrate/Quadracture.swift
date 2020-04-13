
import Foundation
import Accelerate
import Darwin

//Extendendo para aceitar funcoes trigonometricas
@objc
public extension NSNumber{
    
    func tan() -> NSNumber{
        return NSNumber(value: Darwin.tan(self.doubleValue))
    }

    func sin() -> NSNumber{
        return NSNumber(value: Darwin.sin(self.doubleValue))
    }

    func cos() -> NSNumber{
        return NSNumber(value: Darwin.cos(self.doubleValue))
    }
    
    func acos() -> NSNumber{
        return NSNumber(value: Darwin.acos(self.doubleValue))
    }
    
    func atan() -> NSNumber{
        return NSNumber(value: Darwin.atan(self.doubleValue))
    }
    
    func asin() -> NSNumber{
        return NSNumber(value: Darwin.asin(self.doubleValue))
    }
    
    func sinh() -> NSNumber{
        return NSNumber(value: Darwin.sinh(self.doubleValue))
    }
    
    func cosh() -> NSNumber{
        return NSNumber(value: Darwin.cosh(self.doubleValue))
    }
    
    func tanh() -> NSNumber{
        return NSNumber(value: Darwin.tanh(self.doubleValue))
    }
    
}


// extension pra uso da nsexpression
extension String {
    var expression: NSExpression{
        return NSExpression(format: self)
    }
}


func Integrate(){
    
    // Configurações padrão do Quadrature sobre intervalos máximo e tolerância de erros.
    let quadrature = Quadrature(integrator:.qags(maxIntervals: 10),
                                absoluteTolerance: 1.0e-2,
                                relativeTolerance: 1.0e-2)

    // Onde calcula o integral com o Quadrature.
    let result = quadrature.integrate(over: range) { x in
        
        // aqui eh montado o dicinario que a NSExpression necessita
        let intDictionary = ["x": x, "pi": Double.pi]
        
        // aqui onde eh calculado o valor da equacao baseado na string formula
        if let timesResult = formula.expression.expressionValue(with: intDictionary, context: nil) as? Double {
            return timesResult
        }
        else { return 0 } 
    }

    // Mostra o resultado (sucesso ou erro) do cálculo da integral.
    switch result {
        case .success(let integralResult):
            print("Integral calculada:\n\(integralResult)")
        case .failure(let error):
            print("Erro no cálculo da integral:", error.errorDescription)
            formula = ""
    }

}
