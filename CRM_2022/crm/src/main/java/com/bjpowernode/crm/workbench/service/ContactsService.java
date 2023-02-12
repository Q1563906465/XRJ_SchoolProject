package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.Contacts;
import com.bjpowernode.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

public interface ContactsService {
    int saveCreateContacts(Contacts contacts);

    List<Contacts> queryContactsByConditionForPage(Map<String, Object> map);

    int queryCountOfContactsByCondition(Map<String, Object> map);

    int deleteContactsByIds(String[] ids);

    Contacts queryContactsById(String id);

    int saveEditContacts(Contacts contacts);

    Contacts queryContactsForDetailById(String id);

    List<Contacts> queryContactsForDetailByContactsName(String contactsName);

    List<Tran> queryTranForDetailByContactsId(String contactsId);
}
