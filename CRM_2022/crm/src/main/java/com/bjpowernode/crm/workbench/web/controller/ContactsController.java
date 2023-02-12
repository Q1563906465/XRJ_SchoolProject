package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.commons.constans.Constants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.commons.utils.UUIDUtils;
import com.bjpowernode.crm.settings.domain.DicValue;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.DicValueService;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.*;
import com.bjpowernode.crm.workbench.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class ContactsController {
    @Autowired
    private UserService userService;

    @Autowired
    private DicValueService dicValueService;

    @Autowired
    private ContactsService contactsService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ContactsRemarkService contactsRemarkService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ContactsActivityRelationService contactsActivityRelationService;

    @RequestMapping("/workbench/contacts/index.do")
    public String index(HttpServletRequest request){
        //查询用户列表
        List<User> userList = userService.queryAllUsers();
        List<DicValue> appellationList = dicValueService.queryDicValueByTypeCode("appellation");
        List<DicValue> sourceList = dicValueService.queryDicValueByTypeCode("source");

        //把数据保存到request
        request.setAttribute("userList",userList);
        request.setAttribute("appellationList",appellationList);
        request.setAttribute("sourceList",sourceList);
        return "workbench/contacts/index";
    }

    @RequestMapping("/workbench/contacts/saveCreateContacts.do")
    public @ResponseBody Object saveCreateContacts(Contacts contacts, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        //封装参数
        contacts.setId(UUIDUtils.getUUID());
        contacts.setCreateTime(DateUtils.formatDateTime(new Date()));
        contacts.setCreateBy(user.getId());

        ReturnObject returnObject = new ReturnObject();
        try{
            int res = contactsService.saveCreateContacts(contacts);
            if(res > 0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试......");
            }
        }catch(Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/contacts/queryAllCustomerByName.do")
    public @ResponseBody Object queryAllCustomerByName(String customerName){
        List<Customer> customerNameList = customerService.queryAllCustomerByName(customerName);

        return customerNameList;
    }

    @RequestMapping("/workbench/contacts/queryContactsByConditionForPage.do")
    public @ResponseBody Object queryClueByConditionForPage(String owner, String fullname, String customer, String source, int pageNo,int pageSize){
        //封装参数
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("owner",owner);
        map.put("fullname",fullname);
        map.put("customer",customer);
        map.put("source",source);
        map.put("beginNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);

        //根据条件查询第一页的线索和总记录数
        List<Contacts> contactsList = contactsService.queryContactsByConditionForPage(map);
        int totalRows = contactsService.queryCountOfContactsByCondition(map);

        //生成查询结果响应map信息
        Map<String,Object> resMap = new HashMap<>();
        resMap.put("contactsList",contactsList);
        resMap.put("totalRows",totalRows);
        return resMap;
    }

    @RequestMapping("/workbench/contacts/deleteContactsByIds.do")
    public @ResponseBody Object deleteContactsByIds(String[] id){
        ReturnObject returnObject = new ReturnObject();
        try{
            int res = contactsService.deleteContactsByIds(id);
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

    @RequestMapping("/workbench/contacts/querycontactsById.do")
    public @ResponseBody Object querycontactsById(String id){
        return contactsService.queryContactsById(id);
    }

    @RequestMapping("/workbench/contacts/saveEditContacts.do")
    public @ResponseBody Object saveEditContacts(Contacts contacts, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);

        contacts.setEditTime(DateUtils.formatDateTime(new Date()));
        contacts.setEditBy((user.getId()));

        ReturnObject returnObject = new ReturnObject();

        try {
            int res = contactsService.saveEditContacts(contacts);
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

    @RequestMapping("/workbench/contacts/detailContacts.do")
    public Object detailContacts(String id, HttpServletRequest request){
        Contacts contacts = contactsService.queryContactsForDetailById(id);
        List<ContactsRemark> contactsRemarkList = contactsRemarkService.queryContactsRemarkForDetailByContactsId(id);
        List<Activity> activityList = activityService.queryActivityForDetailByContactsId(id);
        request.setAttribute("contacts", contacts);
        request.setAttribute("contactsRemarkList",contactsRemarkList);
        request.setAttribute("activityList",activityList);
        return "workbench/contacts/detail";
    }

    @RequestMapping("/workbench/contacts/queryTranForDetailByContactsId.do")
    public @ResponseBody Object queryTranForDetailByContactsId(String contactsId){
        List<Tran> tranList = contactsService.queryTranForDetailByContactsId(contactsId);

        return tranList;

    }

    @RequestMapping("/workbench/contacts/queryActivityForDetailByNameContactsId.do")
    public @ResponseBody Object queryActivityForDetailByNameContactsId(String activityName,String contactsId){
        Map<String,Object> map = new HashMap<>();
        map.put("activityName",activityName);
        map.put("contactsId",contactsId);

        List<Activity> activityList = activityService.queryActivityForDetailByNameContactsId(map);
        return activityList;

    }

    @RequestMapping("/workbench/contacts/saveBund.do")
    public @ResponseBody Object saveBund(String[] activityId,String contactsId){
        ContactsActivityRelation car = null;
        List<ContactsActivityRelation> carList = new ArrayList<>();
        for (String ai:activityId){
            car = new ContactsActivityRelation();
            car.setId(UUIDUtils.getUUID());
            car.setContactsId(contactsId);
            car.setActivityId(ai);
            carList.add(car);
        }

        ReturnObject returnObject = new ReturnObject();
        try{
            int res = contactsActivityRelationService.saveCreateContactsActivityRelationByList(carList);
            if (res>0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);

                List<Activity> activityList = activityService.queryActivityForDetailByIds(activityId);
                returnObject.setRetData(activityList);
            }else {
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试...");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试...");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/contacts/saveUnbund.do")
    public @ResponseBody Object saveUnbund(ContactsActivityRelation relation){
        ReturnObject returnObject = new ReturnObject();
        try{
            int res = contactsActivityRelationService.deleteContactsActivityRelationByContactsIdActivityId(relation);
            if(res>0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试...");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试...");
        }
        return returnObject;
    }


}
