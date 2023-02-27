"""ChatProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from knox import views as knox_views
from django.urls import path, include
from chat.views import RegisterAPI, LoginAPI, GroupViewSet, ListGroupViewSet, ListMessageViewSet, MessageViewSet
from rest_framework.routers import DefaultRouter
from rest_framework import routers
from rest_framework.authtoken.views import obtain_auth_token


# Routers provide an easy way of automatically determining the URL conf.

router = DefaultRouter()
router.register(r'api/list-group', ListGroupViewSet, basename='group-list')
router.register(r'api/crud-group', GroupViewSet, basename='group-crud')
router.register(r'api/list-message', ListMessageViewSet, basename='message-list')
router.register(r'api/crud-message', MessageViewSet, basename='message-crud')

urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'', include(router.urls)),
    path("api-auth/", include("rest_framework.urls")),
    path('api/register/', RegisterAPI.as_view(), name='register'),
    path('api/login/', LoginAPI.as_view(), name='login'),
    path('api/logout/', knox_views.LogoutView.as_view(), name='logout'),
    path('api/logoutall/', knox_views.LogoutAllView.as_view(), name='logoutall'),
]
