package com.zrf.zstackserve.pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TempHumi {

    private List<String> temps = new ArrayList<>();
    private List<String> humis = new ArrayList<>();
    private List<String> dates = new ArrayList<>();
    private int normalCount;
    private int reliveCount;
    private int forceCount;
    private int abnormalCount;

}
