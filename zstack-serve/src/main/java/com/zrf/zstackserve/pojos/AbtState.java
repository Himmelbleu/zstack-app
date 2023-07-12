package com.zrf.zstackserve.pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AbtState {

    private int normalCount;
    private int reliveCount;
    private int forceCount;
    private int abnormalCount;

}
