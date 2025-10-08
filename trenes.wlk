class VagonDePasajeros {
    const largo
    const anchoUtil

    method cantidadDePasajeros() {
        if(anchoUtil <= 2.5){
            return largo * 8
        } else{
            return largo * 10
        }
    }

    method pesoMaximo() = self.cantidadDePasajeros() * 80

    method esLiviano() = self.pesoMaximo() < 2500
}

class VagonDeCarga {
    const cargaMaxima

    method cargaMaxima() = cargaMaxima
    method pesoMaximo() = cargaMaxima + 160
    method esLiviano() = self.pesoMaximo() < 2500
}

class  Locomotora{
    const peso
    const pesoMaximoDeArrastre
    const velocidadMaxima

    method arrastreUtil() = pesoMaximoDeArrastre - peso
    method velocidadMaxima() = velocidadMaxima
    method pesoMaximoDeArrastre() = pesoMaximoDeArrastre
    method peso() = peso
}

class Formacion {
    const locomotoras
    const vagones

    method agregarVagon(nuevoVagon) {
        vagones.add(nuevoVagon)
    }
    
    method agregarLocomotora(nuevaLocomotora) {
        locomotoras.add(nuevaLocomotora)
    }

    method cantidadDeVagones() = vagones.size()

    method totalDePasajeros() = vagones
        .sum({vagon => vagon.cantidadDePasajeros()})
    
    method totalDeVagonesLivianos() = vagones
        .filter({vagon => vagon.esLiviano()}).size()
    
    method velocidadMaxima() = locomotoras
        .map({locomotora => locomotora.velocidadMaxima()}).min()
    
    method esEficiente() = locomotoras
        .all({locomotora => locomotora.pesoMaximoDeArrastre() >= locomotora.peso() * 5})
    
    method puedeMoverse() =  self.arrastreUtilTotal() >= self.pesoMaximoTotalVagones() 

    method arrastreUtilTotal() = locomotoras.sum({locomotora => locomotora.arrastreUtil()})

    method pesoMaximoTotalVagones() = vagones.sum({vagon => vagon.pesoMaximo()})

    method pesoMaximoTotalLocomotoras() = locomotoras.sum({locomotora => locomotora.peso()})

    method kilosDeEmpujeFaltantes() = self.pesoMaximoTotalVagones() - self.arrastreUtilTotal()

    method vagonMasPesado() {
        const pesoDelVagonMasPesado = vagones.map({vagon => vagon.pesoMaximo()}).max()
        return vagones.find({vagon => vagon.pesoMaximo() == pesoDelVagonMasPesado})
    }

    method esCompleja() = self.unidadesTotales() > 20 || self.pesoTotal() > 10000

    method unidadesTotales() = locomotoras.size() + vagones.size()

    method pesoTotal() = self.pesoMaximoTotalVagones() + self.pesoMaximoTotalLocomotoras()

    method locomotoras() = locomotoras

    method vagones() = vagones
}