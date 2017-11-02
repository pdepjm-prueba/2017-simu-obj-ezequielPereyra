class Biclope inherits Empleado //Limite de estamina 10
{	
	constructor(_rol, _estamina) = super(_rol, _estamina)
	{
		estamina = 10.min(_estamina)
	}
	
}

class Ciclope inherits Empleado//Aciertan mitad de disparos
{
	constructor(_rol, _estamina) = super(_rol, _estamina)
	
}

class Empleado
{
	var rol
	var estamina
	
	constructor(_rol, _estamina)
	{
		rol = _rol
		estamina = _estamina
	}
	
	method arreglarMaquina(maquina)
	{
		if((maquina.noRequiereHerramientas() or rol.puedoRepararMaquinaCompleja(maquina)) and self.estamina() >= maquina.complejidad())
		{
			maquina.arreglarse()
			self.trabajar(maquina.complejidad())
		}
		else
		{
		}
	}
	
	method estamina()
	{
		return estamina
	}
	method trabajar(esfuerzo)
	{
		estamina -= esfuerzo
	}
	method defenderUnSector(sector)
	{
		if(rol.puedoDefenderSector() and (self.fuerza() + rol.fuerzaExtra()) >= sector.gradoDeAmenaza())
		{
			
		}
	}
	
	method fuerza()
	{
		return estamina/2 + 2
	}
	
	method comerFruta(fruta)
	{
		estamina += fruta.energia()
	}
}

class Soldado
{
	var arma
	var danio
	var danioPorPractica
	
	method defenderSector(sector)
	{
		self.ganarPractica()
	}
	
	method ganarPractica()
	{
		danioPorPractica += 2
	}
	method puedoRepararMaquinaCompleja(maquina)
	{
		return false
	}
	method puedoDefenderSector()
	{
		return true
	}
	method fuerzaExtra()
	{
		return danioPorPractica
	}
	
}

class Obrero
{
	var herramientas
	
	method puedoRepararMaquinaCompleja(maquina)
	{
		return maquina.herramientasRequeridas().all{h => herramientas.contains(h)}
	}
	method puedoDefenderSector()
	{
		return true
	}
	method fuerzaExtra()
	{
		return 0
	}
}

class Mucama
{
	method puedeDefenderSector()
	{
		return false
	}
	method puedoRepararMaquinaCompleja(maquina)
	{
		return false
	}
	method fuerzaExtra()
	{
		return 0
	}
}

class Maquina
{
	var complejidad
	var herramientasRequeridas
	var sana
	
	method noRequiereHerramientas()
	{
		return herramientasRequeridas.isEmpty()
	}
	
	method complejidad()
	{
		return complejidad
	}
	method arreglarse()
	{
		sana = true
	}
	method herramientasRequeridas()
	{
		return herramientasRequeridas
	}
}
class Sector
{
	var gradoDeAmenaza
	
	method gradoDeAmenaza()
	{
		return gradoDeAmenaza
	}
}

object banana
{
	method energia()
	{
		return 10
	}
}

object manzana
{
	method energia()
	{
		return 5
	}
}

object uva
{
	method energia()
	{
		return 1
	}
}