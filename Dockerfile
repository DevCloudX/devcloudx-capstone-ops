# ---- Stage 1: Build the application ----
    FROM eclipse-temurin:17-jdk-alpine as build

    WORKDIR /app
    
    # Copy source and build tools (adjust based on Maven or Gradle)
    COPY . .
    
    # Build the application (choose the right command)
    # For Maven:
    # RUN ./mvnw clean package -DskipTests
    
    # For Gradle:
    RUN ./gradlew clean build -x test
    
    # ---- Stage 2: Create a lightweight runtime image ----
    FROM eclipse-temurin:17-jre-alpine
    
    ENV APP_HOME=/usr/src/app
    WORKDIR $APP_HOME
    
    # Copy only the final JAR (adjust path depending on build tool)
    COPY --from=build /app/build/libs/*.jar app.jar
    
    EXPOSE 8080
    
    CMD ["java", "-jar", "app.jar"]
    