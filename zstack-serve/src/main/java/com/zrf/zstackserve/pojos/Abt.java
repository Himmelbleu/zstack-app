package com.zrf.zstackserve.pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Abt {

    private int id;
    private String state;
    private String date;
    private String msg;
    private String ledState;
    private String name;
    private String sno;

}
