package com.zrf.zstackserve.services;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zrf.zstackserve.mappers.BaseMapper;
import com.zrf.zstackserve.pojos.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BaseService {

    private final BaseMapper mapper;

    public BaseService(BaseMapper mapper) {
        this.mapper = mapper;
    }

    private Map<String, Object> collate(Map<String, Object> map) {
        String order = (String) map.get("order");
        String orderFiled = (String) map.get("orderFiled");
        if (order == null || order.isEmpty()) {
            map.put("order", "ASC");
        }
        if (orderFiled == null || orderFiled.isEmpty()) {
            map.put("orderFiled", "id");
        }
        return map;
    }

    public TemphuPage queryTemphuAll(Map<String, Object> map) {
        Map<String, Object> collatedMap = collate(map);
        Page<?> page = PageHelper.startPage((Integer) collatedMap.get("pageNum"), (Integer) collatedMap.get("pageSize"));
        List<Temphu> temphus = mapper.queryTemphuAll(collatedMap);
        return new TemphuPage(page.getPageSize(), page.getTotal(), temphus);
    }

    public AbtPage queryAbtAll(Map<String, Object> map) {
        Map<String, Object> collatedMap = collate(map);
        Page<?> page = PageHelper.startPage((Integer) collatedMap.get("pageNum"), (Integer) collatedMap.get("pageSize"));
        List<Abt> abts = mapper.queryAbtAll(collatedMap);
        return new AbtPage(page.getPageSize(), page.getTotal(), abts);
    }

    public TempHumi queryTempHumiLimit(Map<String, Object> map) {
        List<Temphu> list = mapper.queryTempHumiLimit(map);
        TempHumi result = new TempHumi();
        for (Temphu temphu : list) {
            result.getTemps().add(temphu.getTemp());
            result.getHumis().add(temphu.getHumi());
            result.getDates().add(temphu.getDate());
        }
        return result;
    }

    public TempHumi queryTempHumiStateCount() {
        int normalCount = mapper.queryTempHumiNormalCount();
        int reliveCount = mapper.queryTempHumiReliveCount();
        int forceCount = mapper.queryTempHumiForceCount();
        int abnormalCount = mapper.queryTempHumiAbnormalCount();
        TempHumi tempHumi = new TempHumi();
        tempHumi.setAbnormalCount(abnormalCount);
        tempHumi.setNormalCount(normalCount);
        tempHumi.setReliveCount(reliveCount);
        tempHumi.setForceCount(forceCount);
        return tempHumi;
    }

    public AbtState queryAbtStateCount() {
        int normalCount = mapper.queryAbtNormalCount();
        int reliveCount = mapper.queryAbtReliveCount();
        int forceCount = mapper.queryAbtForceCount();
        int abnormalCount = mapper.queryAbtAbnormalCount();
        AbtState abtState = new AbtState();
        abtState.setAbnormalCount(abnormalCount);
        abtState.setNormalCount(normalCount);
        abtState.setReliveCount(reliveCount);
        abtState.setForceCount(forceCount);
        return abtState;
    }
}
