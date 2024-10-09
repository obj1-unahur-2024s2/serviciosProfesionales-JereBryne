class Universidad{
  const property provincia 
  var property honorarios
  var donaciones = 0
  method recibirDonaciones(unImporte){
    donaciones += unImporte
  }
}

object AsociacionProfesionalesDelLitoral {
  var recaudacion = 0
  method recaudar(unImporte){
    recaudacion += unImporte
  }
}

class AsociadosAUniversidad{
  const property universidad
  method honorarios() {
    return universidad.honorarios()
  }
  method puedeTrabajar() {
    return [universidad.provincia()]
  }
  method cobrar(unImporte){
    universidad.recibirDonaciones(unImporte*0.5)
  }
}

class AsociadosAlLitoral{
  const property universidad 
  method honorarios() = 3000
  method puedeTrabajar() = ["Entre Rios","Santa Fe","Corrientes"]
  method cobrar(unImporte){
    AsociacionProfesionalesDelLitoral.recaudar(unImporte)
  }
}

class Libres{
  const property universidad
  var property puedeTrabajar = []
  var property honorarios=0
  method cobrar(unImporte){
    
  }
}

class Empresa {
  const property profesionales = []
  var property honorariosReferencia
  method agregaProfesion(unProfesional) {
    profesionales.add(unProfesional)
  }

  method cuantos(unaUniversidad) {
    return profesionales.count({p=>p.universidad()==unaUniversidad})
  } 

  method caros() {
    return profesionales.filter({p=>p.honorarios()>honorariosReferencia})
  }

  method formadoras(){
    return profesionales.map({p=>p.universidad()}).asSet()//convierte la lista en un conjunto para evitar repetidos
  }

  method masBarato() {
    return profesionales.min({p=>p.honorarios()})
  }

  method esDeGenteAcotaca() {
    return not profesionales.any({p=>p.puedeTrabajar().size()>3})
  }

  method puedeSatisfacer(unSolicitante) {
    return profesionales.any({p=>unSolicitante.puedeSerAtendido(p)})
  }
}

class SolicitatePersona {
  var property provincia 
  method puedeSerAtendido(unProfesional) {
    return unProfesional.puedeTrabajar().contains(provincia)
  }  
}

class SolicitanteInstitucion{
  var property universidades 
  method puedeSerAtendido(unProfesional) {
    return universidades.contains(unProfesional.universidad())
  }
}

class SolicitanteClub {
  var property provincias
  method puedeSerAtendido(unProfesional) {
    return not provincias.asSet().intersection(
      unProfesional.puedeTrabajar().asSet()
      ).isEmpty()
    // reurn provincias.any({
    //p=>unProfesiona.puedeTrabajar().contains(p)
    //})
  }
}

