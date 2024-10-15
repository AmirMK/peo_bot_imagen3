# Use the official Python image as a base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements and application files
COPY * /app/

# Install the required Python libraries
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Set the environment variable for the service account key
ENV GOOGLE_APPLICATION_CREDENTIALS="/app/quora-438213-7d3f5b03e504.json"

# Set the environment variable for port
ENV PORT=8080

# Run the application using Uvicorn (ASGI server for FastAPI)
CMD ["uvicorn", "imagne3_peo_test:app", "--host", "0.0.0.0", "--port", "$PORT"]
