package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.workbench.domain.FunnelVO;
import com.bjpowernode.crm.workbench.service.ActivityService;
import com.bjpowernode.crm.workbench.service.ClueService;
import com.bjpowernode.crm.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


@Controller
public class ChartController {
    @Autowired
    private TranService tranService;

    @Autowired
    private ClueService clueService;

    @Autowired
    private ActivityService activityService;

    @RequestMapping("/workbench/chart/transaction/index.do")
    public String index(){
        return "workbench/chart/transaction/index";
    }

    @RequestMapping("/workbench/chart/transaction/queryCountOfTranGroupByStage.do")
    public @ResponseBody Object queryCountOfTranGroupByStage(){
        List<FunnelVO> funnelVOList = tranService.queryCountOfTranGroupByStage();
        return funnelVOList;
    }

    @RequestMapping("/workbench/chart/customerAndContacts/index.do")
    public String customerAndContactsIndex(){
        return "workbench/chart/customerAndContacts/index";
    }

    @RequestMapping("/workbench/chart/transaction/queryCountOfTranByContactsId.do")
    public @ResponseBody Object queryCountOfTranByContactsId(){
        List<FunnelVO> funnelVOListContacts = tranService.queryCountOfTranByContactsId();
        List<FunnelVO> funnelVOListCustomer = tranService.queryCountOfTranByCustomerId();
        List<List<FunnelVO>> list = new ArrayList<>();
        list.add(funnelVOListContacts);
        list.add(funnelVOListCustomer);
//        Iterator<FunnelVO> iterator = funnelVOList.iterator();
//        List<String> nameList = new ArrayList<>();
//        List<Integer> valueList = new ArrayList<>();
//
//        FunnelVO funnelVO = new FunnelVO();
//        while(iterator.hasNext()){
//            funnelVO = iterator.next();
//            nameList.add(funnelVO.getName());
//            valueList.add(funnelVO.getValue());
//        }
//        List<Object> list = new ArrayList<>();
//        list.add(nameList);
//        list.add(valueList);

        return list;
    }

    @RequestMapping("/workbench/chart/clue/index.do")
    public String clueIndex(){
        return "workbench/chart/clue/index";
    }

    @RequestMapping("/workbench/chart/clue/queryCountOfCompanyByCompany.do")
    public @ResponseBody Object queryCountOfCompanyByCompany(){
        List<FunnelVO> funnelVOList = clueService.queryCountOfCompanyByCompany();
        return funnelVOList;
    }

    @RequestMapping("/workbench/chart/activity/index.do")
    public String activityIndex(){
        return "workbench/chart/activity/index";
    }

    @RequestMapping("/workbench/chart/activity/queryCountOfBundByActivity.do")
    public @ResponseBody Object queryCountOfBundByActivity(){
        List<FunnelVO> funnelVOClueList = activityService.queryCountOfClueByActivityId();
        List<FunnelVO> funnelVOContactsList = activityService.queryCountOfContactsByActivityId();
        Map<String,List<FunnelVO>> map = new HashMap<>();

        map.put("funnelVOClueList", funnelVOClueList);
        map.put("funnelVOContactsList", funnelVOContactsList);
        return map;
    }


}
