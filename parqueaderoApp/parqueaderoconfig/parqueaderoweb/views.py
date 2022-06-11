from django.forms import modelform_factory
from django.shortcuts import render

from parqueaderoweb.models import Tarifas

# Create your views here.
def Home(request):
    return render(request,'index.html')

def tarifas(request):
    TarifasFormulario=modelform_factory(Tarifas,exclude=[])
    formulario=TarifasFormulario()
    #Usando el modelo para traer datos de bd
    tarifas = Tarifas.objects.all()
    
    #crear un diccionario con los datos a enviar
    diccionario={
        'tarifas':tarifas,
        'formulario':formulario
    }
    if(request.method=="POST"):
        datosTarifa=TarifasFormulario(request.POST)
        datosTarifa.save()
    return render(request,'tarifas.html',diccionario)

def conductorView(request):
    return render(request,'conductor.html')

def registroView(request):
    return render(request,'registro.html')

def celdasView(request):
    return render(request,'celdas.html')

def ticketsView(request):
    return render(request,'tickets.html')