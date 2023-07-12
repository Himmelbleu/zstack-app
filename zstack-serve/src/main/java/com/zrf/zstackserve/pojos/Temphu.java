package com.zrf.zstackserve.pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Temphu {

    private int id;
    private String temp;
    private String humi;
    private String date;
    private String state;
    private String ledState;
    private String name;
    private String sno;

}
