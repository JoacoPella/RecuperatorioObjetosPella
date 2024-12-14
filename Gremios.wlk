import Mago.*

class Gremio {
    const listaDeIntegrantes 

    method poderTotal(){
        return self.listaDePoderesDeIntegrantes().sum()
    }

    method listaDePoderesDeIntegrantes(){
        return listaDeIntegrantes.map({ integrante => integrante.poderTotal() })
    }
}