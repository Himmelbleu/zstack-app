package com.zrf.zstackserve.controls;

import com.zrf.zstackserve.pojos.AbtPage;
import com.zrf.zstackserve.pojos.AbtState;
import com.zrf.zstackserve.pojos.TempHumi;
import com.zrf.zstackserve.pojos.TemphuPage;
import com.zrf.zstackserve.services.BaseService;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class BaseController {

    private final BaseService service;

    public BaseController(BaseService service) {
        this.service = service;
    }

    /**
     * pageNum：页码
     * pageSize：一页数量
     * order：排序，ASC、DESC
     */
    @PostMapping("/temphu/query/all")
    public TemphuPage queryTemphuAll(@RequestBody Map<String, Object> map) {
        return service.queryTemphuAll(map);
    }

    @PostMapping("/temphu/query/all/limit")
    public TempHumi queryTempHumiLimit(@RequestBody Map<String, Object> map) {
        return service.queryTempHumiLimit(map);
    }


    /**
     * pageNum：页码
     * pageSize：一页数量
     * order：排序，ASC、DESC
     */
    @PostMapping("/abt/query/all")
    public AbtPage queryAbtAll(@RequestBody Map<String, Object> map) {
        return service.queryAbtAll(map);
    }

    @PostMapping("/temphu/query/stateCount")
    public TempHumi queryTempHumiStateCount() {
        return service.queryTempHumiStateCount();
    }

    @PostMapping("/abt/query/stateCount")
    public AbtState queryAbtStateCount() {
        return service.queryAbtStateCount();
    }
}
