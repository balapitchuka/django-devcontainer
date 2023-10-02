# Use the official Python image as a parent image
FROM python:3.9

# Set environment variables for Django
ENV DJANGO_SETTINGS_MODULE="django_devcontainer.settings"
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    # Add any system dependencies here
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy your project files into the container
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose the Django development server port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
