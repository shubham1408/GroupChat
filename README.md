# GroupChat
==================================

This is an asignment codebase which includes apis with unit test cases Of GroupChat.

All post APIs are token authenticated and browsable apis and GET apis
are also autheticated APIs

# URLS FOR APIS (APIS ARE BROWSABLE)

  1. Register user(Only Admin can do it)

      ----localhost:port_number(8000)/api/register/

  2. Login and Logout apis(Any autheticated user can do it)
      
      ----localhost:port_number(8000)/api/login/----
      ----localhost:port_number(8000)/api/logout/----
      ----localhost:port_number(8000)/api/logoutall/----
  
  3. Groups Can be added (By Authenticated user)
  	  ----localhost:port_number(8000)/api/api/list-group/ To list all groups
  	  ----localhost:port_number(8000)/api/api/crus-group/ To Create retrieve update and delete all groups

  4. Group Messages can be sent (By Any User) and liked by user also

  	  ----localhost:port_number(8000)/api/list-message/----To list all messages
  	  ----localhost:port_number(8000)/api/crud-message----To create retreive update and add messages


# Technology Stack

  Python == 3.8.10
  
  Django == 4.1.7   

  Djangorestframework == 3.14.0
  
  MySql == 8.0.32

# Installation

## Install OS (Ubuntu) Requirements

    sudo apt-get update
    sudo apt-get upgrade

## Clone Project

    git clone https://github.com/shubham1408/GroupChat.git

## Setup your virtual environment and install requirements.
    

## MySQL (database) setup

    sudo apt-get install mysql-server
    mysql -u root -p (for Ubuntu, you might need to run it as sudo mysql -u root -p)
    create database chat;
    grant usage on *.* to myuser@localhost identified by 'mypasswd';
    grant all privileges on convodb.* to myuser@localhost;

## Running Development Server

   python manage.py runserver


## Runninng ALL Test CASES

   python manage.py test


**Note:** Never forget to enable virtual environment before running the above commands and use settings accordingly.

