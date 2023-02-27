from django.contrib.auth.models import User
from django.db import models


class ChatGroup(models.Model):
    name = models.CharField(max_length=50)
    members = models.ManyToManyField(User)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)

class Message(models.Model):
    group = models.ForeignKey(ChatGroup, on_delete=models.CASCADE, related_name='group')
    sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name='sender')                
    message = models.CharField(max_length=1200)
    liked_by_users = models.ManyToManyField(User)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)


    def __str__(self):
        return self.message
    
    class Meta:
        ordering = ('created_at',)


