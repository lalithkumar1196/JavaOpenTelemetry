# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the JAR file into the container
COPY build/libs/hello.jar /app/

# Copy OpenTelemetry Java agent
COPY opentelemetry-javaagent.jar /app/

# Expose the port your app runs on
EXPOSE 8080

EXPOSE 4317

EXPOSE 4318

# Environment variables for OpenTelemetry
ENV JAVA_TOOL_OPTIONS="-javaagent:/app/opentelemetry-javaagent.jar" 
ENV OTEL_TRACES_EXPORTER=otlp 
ENV OTEL_METRICS_EXPORTER=otlp 
ENV OTEL_LOGS_EXPORTER=otlp 
ENV OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf 
ENV OTEL_EXPORTER_OTLP_ENDPOINT=https://otel.kloudmate.dev:4318 
ENV OTEL_EXPORTER_OTLP_HEADERS="Authorization=sk_gIZ4tqZMFO6yh6ca7rCs2Ice"

# Run the application with OpenTelemetry instrumentation
CMD ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar", "hello.jar"]

