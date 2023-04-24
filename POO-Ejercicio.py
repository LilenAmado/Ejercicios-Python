#POO
#Declarar una clase
class Persona: 
  #Metodo contructor
  def __init__(self, nombre, edad):
    #Atributos
    self.nombre = nombre
    self.edad = edad
    print("Se ha creado a", self.nombre, "de", self.edad, "años")
#FOR Y DICCIONARIO
  def hablar(self, ** palabras):
    for frases in palabras:
      print(self.nombre, ":", palabras[frases])
      #Para ver que es diccionario
      #print(self.nombre, ":", palabras)
      
Juan = Persona("Juan", 18)
Juan.hablar(texto1 = "Creando una tupla", texto2 = "A ver otro texto", texto3 = ":)")
Luis = Persona("Luis", 35)
Luis.hablar(texto1 = "Hola soy Luis", texto2 = ":D")