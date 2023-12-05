plugins {
  id("java")
  id("org.springframework.boot") version "3.0.6"
  id("io.spring.dependency-management") version "1.1.0"
}

sourceSets {
  main {
    java.setSrcDirs(setOf("."))
  }
}

repositories {
  mavenCentral()
}

dependencies {
  implementation(platform("io.opentelemetry:opentelemetry-bom:1.32.0"))
  implementation("io.opentelemetry:opentelemetry-api")
}
