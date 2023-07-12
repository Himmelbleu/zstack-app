package com.zrf.zstackserve.pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AbtPage {

    private int pageSize;
    private long total;
    private List<Abt> list;

}
