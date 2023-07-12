package com.zrf.zstackserve.mappers;

import com.zrf.zstackserve.pojos.Abt;
import com.zrf.zstackserve.pojos.TempHumi;
import com.zrf.zstackserve.pojos.Temphu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BaseMapper {

    List<Temphu> queryTemphuAll(Map<String, Object> map);

    List<Temphu> queryTempHumiLimit(Map<String, Object> map);

    List<Abt> queryAbtAll(Map<String, Object> map);

    Integer queryTempHumiAbnormalCount();
    Integer queryTempHumiReliveCount();
    Integer queryTempHumiForceCount();
    Integer queryTempHumiNormalCount();

    Integer queryAbtAbnormalCount();
    Integer queryAbtReliveCount();
    Integer queryAbtForceCount();
    Integer queryAbtNormalCount();
}
