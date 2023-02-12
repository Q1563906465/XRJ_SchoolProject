package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.commons.constans.Constants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.commons.utils.UUIDUtils;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.Customer;
import com.bjpowernode.crm.workbench.domain.CustomerRemark;
import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.service.CustomerRemarkService;
import com.bjpowernode.crm.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {
    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerRemarkService customerRemarkService;

    @RequestMapping("/workbench/customer/index.do")
    public String index(HttpServletRequest request){
        //查询用户列表
        List<User> userList = userService.queryAllUsers();

        //把数据保存到request
        request.setAttribute("userList",userList);
        return "workbench/customer/index";
    }

    @RequestMapping("/workbench/customer/saveCreateCustomer.do")
    public @ResponseBody Object saveCreateCustomer(Customer customer, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        //封装参数
        customer.setId(UUIDUtils.getUUID());
        customer.setCreateTime(DateUtils.formatDateTime(new Date()));
        customer.setCreateBy(user.getId());

        ReturnObject returnObject = new ReturnObject();
        try{
            int res = customerService.saveCreateCustomer(customer);
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

    @RequestMapping("/workbench/customer/queryCustomerByConditionForPage.do")
    public @ResponseBody Object queryClueByConditionForPage(String name, String owner, String phone, String website, int pageNo,int pageSize){
        //封装参数
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("name",name);
        map.put("owner",owner);
        map.put("phone",phone);
        map.put("website",website);
        map.put("beginNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);

        //根据条件查询第一页的线索和总记录数
        List<Customer> customerList = customerService.queryCustomerByConditionForPage(map);
        int totalRows = customerService.queryCountOfCustomerByCondition(map);

        //生成查询结果响应map信息
        Map<String,Object> resMap = new HashMap<>();
        resMap.put("customerList",customerList);
        resMap.put("totalRows",totalRows);
        return resMap;
    }

    @RequestMapping("/workbench/customer/queryCustomerById.do")
    public @ResponseBody Object queryCustomerById(String id){
        return customerService.queryCustomerById(id);
    }

    @RequestMapping("/workbench/customer/saveEditCustomer.do")
    public @ResponseBody Object saveEditCustomer(Customer customer, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);

        customer.setEditTime(DateUtils.formatDateTime(new Date()));
        customer.setEditBy((user.getId()));

        ReturnObject returnObject = new ReturnObject();

        try {
            int res = customerService.saveEditCustomer(customer);
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

    @RequestMapping("/workbench/customer/deleteCustomerByIds.do")
    public @ResponseBody Object deleteCustomerByIds(String[] id){
        ReturnObject returnObject = new ReturnObject();
        try{
            int res = customerService.deleteCustomerByIds(id);
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

    @RequestMapping("/workbench/customer/detailCustomer.do")
    public Object detailCustomer(String id, HttpServletRequest request){
        Customer customer = customerService.queryCustomerForDetailById(id);
        List<CustomerRemark> customerRemarkList = customerRemarkService.queryCustomerRemarkForDetailByCustomerId(id);

        request.setAttribute("customer", customer);
        request.setAttribute("customerRemarkList",customerRemarkList);
        return "workbench/customer/detail";
    }


    @RequestMapping("/workbench/customer/queryTranForDetailByCustomerId.do")
    public @ResponseBody Object queryTranForDetailByCustomerId(String customerId){
        List<Tran> tranList = customerService.queryTranForDetailByCustomerId(customerId);

        return tranList;

    }
}
