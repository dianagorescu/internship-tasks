# Use an official Python image as base
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /ttask2

# Copy application files
COPY calculator.py requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["python", "calculator.py"]