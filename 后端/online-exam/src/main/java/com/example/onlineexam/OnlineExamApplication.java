package com.example.onlineexam;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@MapperScan(basePackages = "com.example.onlineexam.mapper")
public class OnlineExamApplication {
	public static void main(String[] args) {
		SpringApplication.run(OnlineExamApplication.class, args);
	}

}
