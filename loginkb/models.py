from django.db import models


# Create your models here.
class Client(models.Model):
    nom = models.CharField(max_length=20)
    prenom = models.CharField(max_length=20)
    username = models.CharField(max_length=20)
    email = models.EmailField(max_length=50)
    gender = models.CharField(max_length=15)
    telephone = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)
    date = models.DateField()

    class Meta:
        ordering = ('nom', 'prenom')


