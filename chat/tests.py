import datetime
from django.test import TestCase
from django.contrib.auth.models import User
from rest_framework.test import APIClient
from rest_framework.reverse import reverse
from rest_framework import status
from .models import *


class ApiTestCases(TestCase):
    
    def setUp(self):
        self.client = APIClient()
        self.user_data = {'password': 'shubham', 'username': 'shubham',
            'is_staff': True, 'is_active': True}
        self.user = User.objects.create_superuser(**self.user_data)

        self.chat_group_data = {
            'name': 'Tarzan', 
            'created_at': datetime.datetime(2020, 4, 1, 0, 0)
        }
        self.chat_group = ChatGroup.objects.create(**self.chat_group_data)
        self.chat_group.members.add(self.user)
        self.message_data = {
            'group': self.chat_group, 'sender': self.user,
            'message': 'Hi',
            'created_at': datetime.datetime.now()
        }
        self.message = Message.objects.create(**self.message_data)

    def test_to_see_register_user_api_working(self):
        """
        Test for seraching all shows by show_time 
        """
        self.client.force_authenticate(user=self.user)
        session = self.client.session
        session.save()

        payload = {
            "username": "test1","email": "sd@gmail.com","password": "test1"
        }

        response = self.client.post(
            reverse('register'), payload)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_to_see_login_api_working(self):
        """
        Test for login api
        """
        self.client.force_authenticate(user=self.user)
        session = self.client.session
        session.save()

        payload = {
            "username": "shubham","password": "shubham"
        }
        response = self.client.post(
            reverse('login'), payload)
        self.assertEqual(response.status_code, status.HTTP_200_OK)


    def test_to_see_list_of_groups_details(self):
        """
        Test for login api
        """
        self.client.force_authenticate(user=self.user)
        session = self.client.session
        session.save()

        response = self.client.get('/api/list-group/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_to_see_crud_group_details(self):
        """
        Test for login api
        """
        self.client.force_authenticate(user=self.user)
        session = self.client.session
        session.save()

        response = self.client.get('/api/crud-group/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_to_see_list_of_messages(self):
        """
        Test for login api
        """
        self.client.force_authenticate(user=self.user)
        session = self.client.session
        session.save()

        response = self.client.get('/api/list-message/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_to_see_crud_of_messages(self):
        """
        Test for login api
        """
        self.client.force_authenticate(user=self.user)
        session = self.client.session
        session.save()

        response = self.client.get('/api/crud-message/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)