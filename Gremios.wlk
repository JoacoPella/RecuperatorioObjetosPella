import Mago.*

class Gremio {
    const listaDeIntegrantes 

/*
el initialize() es para test, uso la exception si la lista de
integrantes tiene menos de dos integrantes
*/

    method poderTotal(){
        return self.listaDePoderesDeIntegrantes().sum()
    }

    method reservaDeEnergiaMagica(){
        return self.listaDeEnergiaMagicaDeIntegrantes().sum()
    }

    method listaDePoderesDeIntegrantes(){
        return listaDeIntegrantes.map({ integrante => integrante.poderTotal() })
    }

    method listaDeEnergiaMagicaDeIntegrantes(){
        return listaDeIntegrantes.map({ integrante => integrante.energiaMagica() })
    }

    method liderDelGrmio(){
        return listaDeIntegrantes.max({ integrante => integrante.poderTotal() })
    }

    method enfrentarGremio(otroGremio, recompensaDeGuerra){
        if(self.leGana(self, otroGremio)) {
            self.liderDelGrmio().sumarEnergiaMagica(recompensaDeGuerra)
        }
        else{
            listaDeIntegrantes.forEach({ integrante => integrante.categoria().consecuenciaDePerderEnfrentamiento(integrante) })
        }
    }

    method leGana(unGremio, otroGremio){
        return unGremio.poderTotal() > (otroGremio.reservaDeEnergiaMagica() + otroGremio.liderDelGrmio().energiaMagica())
    }
}