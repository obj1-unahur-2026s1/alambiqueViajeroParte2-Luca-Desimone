object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object alambiqueVeloz {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.head() == "A"
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object antigualla {
    var gangsters = 7
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 6
    method desgaste(){
        gangsters = gangsters -1
    }
    method patenteValida() = chatarra.rapido() 

}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones

}

object convertible{
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar() 
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(vehiculo){
        convertido = vehiculo
    }
    method patenteValida() = convertido.patenteValida()
 
}

object hurlingham{
   method puedeLlegar(vehiculo) =
     vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdoTipico() = "sticker de la Unahur"
}


object moto{
    method rapido() = true
    method puedeFuncionar() = not moto.rapido()
    method desgaste() { }
    method patenteValida() = false
}

// ── NUEVOS VEHÍCULOS PARTE 2 ──────────────────────────────────────

object antiguallaBlindata {
  var gangsters = ["Al", "Scarface", "Lucky", "Bugsy", "Capone", "Dillinger", "Bonnie"]

  method agregarGangster(nombre) { gangsters.add(nombre) }
  method bajarGangster(nombre)   { gangsters.remove(nombre) }

  // velocidad = cantidad de letras de todos los nombres juntos
  method velocidad() = gangsters.sum({ g => g.size() })

  method puedeFuncionar() = gangsters.size().even()
  method rapido()         = gangsters.size() > 6
  method desgaste()       { gangsters.remove(gangsters.last()) }
  method patenteValida()  = gangsters.size() > 0
  method tiempo()         = 1000 / self.velocidad()
}

object nodoyunaYPatan {
  method puedeFuncionar() = true
  method rapido()         = true
  method patenteValida()  = true
  method desgaste()       { }
  // siempre llegan tarde por las trampas
  method tiempo()         = 9999
}

object profesorLocovich {
  var formas = [alambiqueVeloz, chatarra, antiguallaBlindata]
  var indice = 0

  method convertir() {
    indice = (indice + 1) % formas.size()
  }
  method formaActual() = formas.get(indice)

  method puedeFuncionar() = self.formaActual().puedeFuncionar()
  method rapido()         = self.formaActual().rapido()
  method patenteValida()  = self.formaActual().patenteValida()
  method desgaste()       { self.formaActual().desgaste() }
  method tiempo()         = self.formaActual().tiempo()
}

// ── CENTRO DE INSCRIPCIÓN ─────────────────────────────────────────

object centroDeInscripcion {
  var ciudad      = paris
  var anotados    = []
  var rechazados  = []

  method ciudadCarrera(c) { ciudad = c }

  method inscribir(vehiculo) {
    if (ciudad.puedeLlegar(vehiculo))
      anotados.add(vehiculo)
    else
      rechazados.add(vehiculo)
  }

  method replanificar(nuevaCiudad) {
    ciudad = nuevaCiudad
    // los anotados que ya no pueden → pasan a rechazados
    const yaNopueden = anotados.filter({ v => !ciudad.puedeLlegar(v) })
    yaNopueden.forEach({ v =>
      anotados.remove(v)
      rechazados.add(v)
    })
    // los rechazados que ahora pueden → pasan a anotados
    const ahuedenAhora = rechazados.filter({ v => ciudad.puedeLlegar(v) })
    ahuedenAhora.forEach({ v =>
      rechazados.remove(v)
      anotados.add(v)
    })
  }

  method anotados()   = anotados
  method rechazados() = rechazados

  method realizarCarrera() {
    anotados.forEach({ v => luke.viajar(ciudad) })  // sufren consecuencias
    // el ganador es el que tarda menos
    return anotados.min({ v => v.tiempo() })
  }
}