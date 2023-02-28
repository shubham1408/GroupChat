from rest_framework import generics, permissions, serializers, viewsets, status
from rest_framework.response import Response
from knox.models import AuthToken
from .serializers import UserSerializer, ListMessageSerializer, MessageSerializer, RegisterSerializer, ChatGroupSerializer, ListGroupSerializer, MessageSerializer
from django.contrib.auth import login
from rest_framework.authtoken.serializers import AuthTokenSerializer
from knox.views import LoginView as KnoxLoginView
from .models import *


# Register API
class RegisterAPI(generics.GenericAPIView):
    serializer_class = RegisterSerializer
    permission_classes = [permissions.IsAdminUser]

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({
        "user": UserSerializer(user, context=self.get_serializer_context()).data,
        "token": AuthToken.objects.create(user)[1]
        })


class LoginAPI(KnoxLoginView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request, format=None):
        serializer = AuthTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        login(request, user)
        return super(LoginAPI, self).post(request, format=None)


class ListGroupViewSet(viewsets.ModelViewSet):
    queryset = ChatGroup.objects.all()
    serializer_class = ListGroupSerializer
    permission_classes = [permissions.IsAuthenticated]
    http_method_names = ['get', 'post', 'put', 'patch', 'delete']


class GroupViewSet(viewsets.ModelViewSet):
    queryset = ChatGroup.objects.all()
    serializer_class = ChatGroupSerializer
    permission_classes = [permissions.IsAuthenticated]
    http_method_names = ['get', 'post', 'put', 'patch', 'delete']


class ListMessageViewSet(viewsets.ModelViewSet):
    queryset = Message.objects.all()
    serializer_class = ListMessageSerializer
    permission_classes = [permissions.IsAuthenticated]
    http_method_names = ['get', 'post', 'put', 'patch', 'delete']


class MessageViewSet(viewsets.ModelViewSet):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
    permission_classes = [permissions.IsAuthenticated]
    http_method_names = ['get', 'post', 'put', 'patch', 'delete']



