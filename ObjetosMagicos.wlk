class ObjetosMagicos {
    method poderAportado(unMago)
}

class Varitas inherits ObjetosMagicos {
    const valorBaseDePoder

    override method poderAportado(unMago){
        if(self.cantidadParDeLetrasEnNombre(unMago)){
            return valorBaseDePoder * 1.5
        }
        else {
            return valorBaseDePoder
        }
    }

    method cantidadParDeLetrasEnNombre(unMago){
        return unMago.cantidadDeLetrasEnNombre().even()
    }
}

class TunicasComunes inherits ObjetosMagicos {
    
    override method poderAportado(unMago){
        return self.aportePorResistenciaMagica(unMago)
    }

    method aportePorResistenciaMagica(unMago){
        return unMago.resistenciaMagicaPorDos()
    }
}

class TunicasEpicas inherits TunicasComunes {
    override method poderAportado(unMago){
        return self.aportePorResistenciaMagica(unMago) + 10
    }
}

class Amuletos inherits ObjetosMagicos {
    override method poderAportado(unMago){
        return 200
    }
}


object ojotaMagica inherits ObjetosMagicos {

    override method poderAportado(unMago){
        return 10 * unMago.cantidadDeLetrasEnNombre()
    }
}