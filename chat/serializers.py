from rest_framework import serializers
from django.contrib.auth.models import User
from .models import *

# User Serializer
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email')


# Register Serializer
class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'], validated_data['email'], validated_data['password'])

        return user

# Group Creation serializer
class ListGroupSerializer(serializers.ModelSerializer):
    members = UserSerializer(many=True, read_only=True)
    class Meta:
        model = ChatGroup
        fields = ('id', 'name', 'members', 'created_at', 'updated_at')

# Group Creation serializer
class ChatGroupSerializer(serializers.ModelSerializer):
    # members = UserSerializer(many=True, read_only=True)
    class Meta:
        model = ChatGroup
        fields = ('id', 'name', 'members')


# List of message
class ListMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ('id','group', 'sender', 'message', 'liked_by_users', 'created_at', 'updated_at') 

# Create message
class MessageSerializer(serializers.ModelSerializer):
    # group = ListGroupSerializer(many=True, read_only=True)
    # sender = UserSerializer(many=True, read_only=True)
    liked_by_users = UserSerializer(many=True, read_only=True)

    class Meta:
        model = Message
        fields = ('id','group', 'sender', 'message', 'liked_by_users', 'created_at', 'updated_at')    
