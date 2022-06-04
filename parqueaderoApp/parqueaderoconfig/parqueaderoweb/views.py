from django.shortcuts import render

from parqueaderoweb.models import Tarifas

# Create your views here.
def Home(request):
    #Usando el modelo para traer datos de bd
    tarifas = Tarifas.objects.all()
    
    #crear un diccionario con los datos a enviar
    diccionario={
        'tarifas':tarifas
    }
    return render(request,'index.html',diccionario)

def tarifas(request):
    return render(request,'tarifas.html')