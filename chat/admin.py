from django.contrib import admin
from chat.models import ChatGroup, Message

class GroupAdmin(admin.ModelAdmin):
    model = ChatGroup
    fields = ['name', 'members', 'created_at', 'updated_at']
    list_display = ['id', 'name', 'created_at', 'updated_at']
    readonly_fields = ['created_at', 'updated_at']

class MessageAdmin(admin.ModelAdmin):
    model = Message
    fields = ['group', 'sender', 'message', 'liked_by_users', 'created_at', 'updated_at']
    list_display = ['group', 'sender', 'message', 'created_at', 'updated_at']
    readonly_fields = ['created_at', 'updated_at']

admin.site.register(ChatGroup, GroupAdmin)
admin.site.register(Message, MessageAdmin)
