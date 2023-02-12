package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.ContactsRemark;

import java.util.List;

public interface ContactsRemarkService {
    int saveCreateContactsRemark(ContactsRemark remark);

    int saveEditContactsRemark(ContactsRemark remark);

    int deleteContactsRemarkById(String id);

    List<ContactsRemark> queryContactsRemarkForDetailByContactsId(String id);
}
