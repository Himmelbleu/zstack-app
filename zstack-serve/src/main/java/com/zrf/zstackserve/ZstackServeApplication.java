package com.zrf.zstackserve;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.zrf.zstackserve.mappers")
public class ZstackServeApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZstackServeApplication.class, args);
    }

}
