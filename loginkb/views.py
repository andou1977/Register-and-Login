import datetime
import re
from queue import Empty

from django.contrib import messages
from django.shortcuts import render

from loginkb.models import Client


def index(request):
    return render(request, 'index.html')


def insertion(request):
    return render(request, 'insertion.html')


def login(request):
    return render(request, 'login.html')



def logged(request):
    username = request.POST.get('username')
    pass1 = request.POST.get('Password')

    # verifier si username and password exist
    if not Client.objects.filter(username=username):
        messages.error(request, 'username doesn_t exist')
        return render(request, '../templates/login.html')
    if not Client.objects.filter(Password=pass1):
        messages.error(request, 'password doesn_t exist')
        return render(request, '../templates/login.html')
    else:
        return render(request, '../templates/youraccount.html')


def Inserer(request):
    mydate = datetime.datetime.now()
    nom = request.POST.get('nom')
    prenom = request.POST.get('prenom')
    username = request.POST.get('username')
    email = request.POST.get('email')
    genre = request.POST.get('genre')
    telephone = request.POST.get('telephone')
    password2 = request.POST.get('Password')
    confirmpassword = request.POST.get('password23')
    regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'
    regexphone = '^[4|2|3][0-9/-]{7}$'

    # verifier les champs sont vides
    if nom == '' and prenom == '' and username == '' and email == '' and telephone == '' and password2 == '' and confirmpassword == '':
        messages.error(request, 'They must not be empty')
        return render(request, 'insertion.html')

    if nom == '':
        messages.error(request, 'Nom ne doit pas etre vide')
        return render(request, 'insertion.html')
    if prenom == '':
        messages.error(request, 'prenom ne doit pas etre vide')
        return render(request, 'insertion.html')
    if username == '':
        messages.error(request, 'username ne doit pas etre vide')
        return render(request, 'insertion.html')
    if email == '':
        messages.error(request, 'email ne doit pas etre vide')
        return render(request, 'insertion.html')

    if telephone == '':
        messages.error(request, 'Numero ne doit pas etre vide ')
        return render(request, 'insertion.html')

    if password2 == '':
        messages.error(request, 'Password ne doit pas etre vide ')
        return render(request, 'insertion.html')
    if confirmpassword == '':
        messages.error(request, 'tu dois confirmer le password ')
        return render(request, 'insertion.html')

    # verifier la confirmation du password
    if password2 != confirmpassword:
        messages.error(request, 'la confirmation du password est incorrect')
        return render(request, 'insertion.html')

    # verifier si password username et telephone existe deja
    if Client.objects.filter(username=username):
        messages.error(request, 'ce Username existe deja')
        return render(request, 'insertion.html')
    if Client.objects.filter(Password=password2):
        messages.error(request, 'Ce password existe deja')
        return render(request, 'insertion.html')
    if Client.objects.filter(telephone=telephone):
        messages.error(request, 'Ce telephone existe deja')
        return render(request, 'insertion.html')

        # verifier si l'email est correct
    if not re.search(regex, email):
        messages.error(request, 'emaill Incorrect')
        return render(request, 'insertion.html')

    # verifier si le numero est pour haiti
    if not re.search(regexphone, telephone):
        messages.error(request, 'Telephone Incorrect pour haiti')
        return render(request, 'insertion.html')

    # verifier si l'email existe deja
    if Client.objects.filter(email=email):
        messages.error(request, 'Cet email existe deja')
        return render(request, 'insertion.html')

    else:
        helo = Client(nom=nom, prenom=prenom, username=username, email=email, gender=genre, telephone=telephone,
                      Password=password2, date=mydate)
    helo.save()
    messages.error(request, 'Insertion Reussi', extra_tags='success')
    return render(request, 'insertion.html')
