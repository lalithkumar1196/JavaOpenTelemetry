package otel;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class HelloWorldApplication {

    @Value("${HOSTNAME}")
    private String podName; // This will automatically be populated with the pod name

    @Value("${MY_NODE_NAME:unknown}")
    private String nodeName; // This will automatically be populated with the node name or default to "unknown"

    public static void main(String[] args) {
        SpringApplication.run(HelloWorldApplication.class, args);
    }

    @GetMapping("/hello")
    public String helloWorld() {
        return "Hello, World! This is pod: " + podName + " on node: " + nodeName;
    }
}

