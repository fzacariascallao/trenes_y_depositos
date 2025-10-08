class Deposito {
    const formaciones
    const locomotorasSueltas

    method vagonesMasPesados() = formaciones.map({formacion => formacion.vagonMasPesado()})

    method necesitaUnConductorExperimentado() = formaciones.any({formacion => formacion.esCompleja()})

    method agregarLocomotora(nuevaLocomotora, formacionBuscada) {
        const formacionEncontrada = formaciones.find({formacion => formacion == formacionBuscada})
        formacionEncontrada.agregarLocomotora(nuevaLocomotora)
        if (not formacionEncontrada.puedeMoverse() && not self.locomotoraSueltaConMasArrastreQue(formacionEncontrada.kilosDeEmpujeFaltantes()).isEmpty()){
            formacionEncontrada.agregarLocomotora(self.locomotoraSueltaConMasArrastreQue(formacionEncontrada.kilosDeEmpujeFaltantes()))
        }

    }

    method locomotoraSueltaConMasArrastreQue(kilos) = locomotorasSueltas
        .find({locomotora => locomotora.arrastreUtil() >= kilos})
}