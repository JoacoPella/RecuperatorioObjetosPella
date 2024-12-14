class Mago {
    const poderInnato // de 1 a 10
    const objetosMagicos
    const resistenciaMagica
    const nombre
    var energiaMagica
    var categoria

    method cantidadDeLetrasEnNombre(){
        return nombre.size()
    }

    method resistenciaMagica() = resistenciaMagica

    method resistenciaMagicaPorDos(){
        return resistenciaMagica * 2
    }

    method poderTotal() {
        return self.poderAportadoPorSusObjetos() * poderInnato
    }

    method poderAportadoPorSusObjetos(){
        return self.poderDeSusObjetos().sum()
    }

    method poderDeSusObjetos(){
        return objetosMagicos.filter({ objeto => objeto.poderAportado(self) })
    }

    method sumarEnergiaMagica(cantidadASumar){
        energiaMagica = energiaMagica + cantidadASumar
    }

    method enfrentarA(otroMago, recompensaDelEnfrentamiento){
        if(categoria.pierde(self, otroMago)){
            categoria.consecuenciaDePerderEnfrentamiento(self)
        }
        else{
            self.recompensaDelEnfrentamiento(recompensaDelEnfrentamiento)
        }
    }

// dice que se roba cierta cantidad, no aclara si es la misma que pierde el otro mago.
    method recompensaDelEnfrentamiento(recompensaDelEnfrentamiento){ 
        self.sumarEnergiaMagica(recompensaDelEnfrentamiento)
    }
}

object magoAprendiz {
    method pierde(unMago, otroMago){
        unMago.resistenciaMagica()  < otroMago.poderTotal()
    }

    method consecuenciaDePerderEnfrentamiento(unMago){
        unMago.sumarEnergiaMagica(-unMago.energiaMagica() * 0.5)
    }
}

object magoVeterano {
    method pierde(unMago, otroMago){
        otroMago.poderTotal() >= 1.5 * unMago.resistenciaMagica()
    }

    method consecuenciaDePerderEnfrentamiento(unMago){
        unMago.sumarEnergiaMagica(-4)
    }
}

object magoInmortal {
    method pierde(unMago, otroMago){
        return false
    }

    method consecuenciaDePerderEnfrentamiento(unMago){
        return false // no pierde
    }
}