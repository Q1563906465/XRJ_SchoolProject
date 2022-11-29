package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.Customer;
import com.bjpowernode.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<String> queryAllCustomerNameByName(String name);

    int saveCreateCustomer(Customer customer);

    List<Customer> queryCustomerByConditionForPage(Map<String,Object> map);

    int queryCountOfCustomerByCondition(Map<String, Object> map);

    Customer queryCustomerById(String id);

    int saveEditCustomer(Customer customer);

    int deleteCustomerByIds(String[] ids);

    Customer queryCustomerForDetailById(String id);

    List<Customer> queryAllCustomerByName(String name);

    List<Tran> queryTranForDetailByCustomerId(String customerId);
}
