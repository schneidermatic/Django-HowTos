from django.core.management.base import BaseCommand
from django.contrib.auth.models import User

class Command(BaseCommand):
    help = 'Create a superuser automatically if none exists'

    def handle(self, *args, **kwargs):
        # Check if a superuser already exists
        if not User.objects.filter(is_superuser=True).exists():
            # If no superuser exists, create one
            User.objects.create_superuser(
                username='admin',
                email='admin@example.com',
                password='changeme'  # Replace with a secure password
            )
            self.stdout.write(self.style.SUCCESS('Superuser created successfully!'))
        else:
            self.stdout.write(self.style.SUCCESS('Superuser already exists.'))