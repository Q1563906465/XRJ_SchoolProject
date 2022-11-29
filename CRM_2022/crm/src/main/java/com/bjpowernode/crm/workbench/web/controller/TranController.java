package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.commons.constans.Constants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.settings.domain.DicValue;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.DicValueService;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.*;
import com.bjpowernode.crm.workbench.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class TranController {
    @Autowired
    private DicValueService dicValueService;

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TranService tranService;

    @Autowired
    private TranRemarkService tranRemarkService;

    @Autowired
    private TranHistoryService tranHistoryService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ContactsService contactsService;

    @RequestMapping("/workbench/transaction/index.do")
    public String index(HttpServletRequest request){
        List<DicValue> stageList = dicValueService.queryDicValueByTypeCode("stage");
        List<DicValue> transactionTypeList = dicValueService.queryDicValueByTypeCode("transactionType");
        List<DicValue> sourceList = dicValueService.queryDicValueByTypeCode("source");
        request.setAttribute("stageList",stageList);
        request.setAttribute("transactionTypeList",transactionTypeList);
        request.setAttribute("sourceList",sourceList);
        return "workbench/transaction/index";
    }

    @RequestMapping("/workbench/transaction/toSave.do")
    public String toSave(HttpServletRequest request){
        List<User> userList = userService.queryAllUsers();
        List<DicValue> stageList = dicValueService.queryDicValueByTypeCode("stage");
        List<DicValue> transactionTypeList = dicValueService.queryDicValueByTypeCode("transactionType");
        List<DicValue> sourceList = dicValueService.queryDicValueByTypeCode("source");
        request.setAttribute("userList",userList);
        request.setAttribute("stageList",stageList);
        request.setAttribute("transactionTypeList",transactionTypeList);
        request.setAttribute("sourceList",sourceList);
        return "workbench/transaction/save";
    }

    @RequestMapping("/workbench/transaction/getPossibilityByStage.do")
    public @ResponseBody Object getPossibilityByStage(String stageValue){
        ResourceBundle bundle = ResourceBundle.getBundle("possibility");
        String possibility = bundle.getString(stageValue);
        return possibility;
    }

    @RequestMapping("/workbench/transaction/queryAllCustomerNameByName.do")
    public @ResponseBody Object queryAllCustomerNameByName(String customerName){
        List<String> customerNameList = customerService.queryAllCustomerNameByName(customerName);

        return customerNameList;
    }

    @RequestMapping("/workbench/transaction/saveCreateTran.do")
    public @ResponseBody Object saveCreateTran(@RequestParam Map<String,Object> map, HttpSession session){
        //设置用户属性
        map.put(Constants.SESSION_USER,session.getAttribute(Constants.SESSION_USER));
        ReturnObject returnObject = new ReturnObject();
        try{
            tranService.saveCreateTran((map));
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试...");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/transaction/detailTran.do")
    public String detailTran(String id,HttpServletRequest request){
        //调用service查询数据
        Tran tran = tranService.queryTranForDetailById(id);
        List<TranRemark> remarkList = tranRemarkService.queryTranRemarkForDetailByTranId(id);
        List<TranHistory> historyList = tranHistoryService.queryTranHistoryForDetailByTranId(id);

        //在配置文件中查询可能性
        ResourceBundle bundle = ResourceBundle.getBundle("possibility");
        String possibility = bundle.getString(tran.getStage());
        tran.setPossibility(possibility);

        request.setAttribute("tran",tran);
        request.setAttribute("remarkList",remarkList);
        request.setAttribute("historyList",historyList);
//        request.setAttribute("possibility",possibility);

        //调用service查询所有的交易阶段
        List<DicValue> stageList = dicValueService.queryDicValueByTypeCode("stage");
        request.setAttribute("stageList",stageList);

        return "workbench/transaction/detail";
    }

    @RequestMapping("/workbench/transaction/queryActivityForDetailByActivityName.do")
    public @ResponseBody Object queryActivityForDetailByActivityName(String activityName){
        List<Activity> activityList = activityService.queryActivityForDetailByActivityName(activityName);

        return activityList;
    }

    @RequestMapping("/workbench/transaction/queryContactsForDetailByContactsName.do")
    public @ResponseBody Object queryContactsForDetailByContactsName(String contactsName){
        List<Contacts> contactsList = contactsService.queryContactsForDetailByContactsName(contactsName);

        return contactsList;
    }

    @RequestMapping("/workbench/transaction/queryTranByConditionForPage.do")
    public @ResponseBody Object queryTranByConditionForPage(String owner,String name,String customerName,String stage,String type,String source,String contactsName,int pageNo,int pageSize){
        //封装参数
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("owner",owner);
        map.put("name",name);
        map.put("customerName",customerName);
        map.put("stage",stage);
        map.put("type",type);
        map.put("source",source);
        map.put("contactsName",contactsName);


        map.put("beginNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        //根据条件查询第一页的线索和总记录数
        List<Tran> tranList = tranService.queryTranByConditionForPage(map);
        int totalRows = tranService.queryCountOfTranByCondition(map);

        //生成查询结果响应map信息
        Map<String,Object> resMap = new HashMap<>();
        resMap.put("tranList",tranList);
        resMap.put("totalRows",totalRows);

        return resMap;
    }

    @RequestMapping("/workbench/tran/deleteTranByIds.do")
    public @ResponseBody Object deleteTranByIds(String[] id){
        ReturnObject returnObject = new ReturnObject();
        try{
            int res = tranService.deleteTranByIds(id);
            if(res > 0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试......");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/tran/queryTranById.do")
    public Object queryTranById(String id,HttpServletRequest request){
        Tran tran = tranService.queryTranById(id);
        List<User> userList = userService.queryAllUsers();
        List<DicValue> stageList = dicValueService.queryDicValueByTypeCode("stage");
        List<DicValue> transactionTypeList = dicValueService.queryDicValueByTypeCode("transactionType");
        List<DicValue> sourceList = dicValueService.queryDicValueByTypeCode("source");
        request.setAttribute("userList",userList);
        request.setAttribute("stageList",stageList);
        request.setAttribute("transactionTypeList",transactionTypeList);
        request.setAttribute("sourceList",sourceList);
        request.setAttribute("tran", tran);
        return "workbench/transaction/edit";
    }

    @RequestMapping("/workbench/tran/saveEditTran.do")
    public @ResponseBody Object saveEditTran(@RequestParam Map<String,Object> map, HttpSession session){
//        User user = (User) session.getAttribute(Constants.SESSION_USER);
//
//        tran.setEditTime(DateUtils.formatDateTime(new Date()));
//        tran.setEditBy(user.getId());
        //设置用户属性
        map.put(Constants.SESSION_USER,session.getAttribute(Constants.SESSION_USER));
        ReturnObject returnObject = new ReturnObject();
        try {
            int res = tranService.saveEditTran(map);
            if (res > 0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试......");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }
        return returnObject;
    }



}
