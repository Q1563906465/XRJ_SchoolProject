package com.bjpowernode.crm.workbench.mapper;

import com.bjpowernode.crm.workbench.domain.ContactsRemark;

import java.util.List;

public interface ContactsRemarkMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_contacts_remark
     *
     * @mbggenerated Sun Jun 12 14:58:13 CST 2022
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_contacts_remark
     *
     * @mbggenerated Sun Jun 12 14:58:13 CST 2022
     */
    int insert(ContactsRemark record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_contacts_remark
     *
     * @mbggenerated Sun Jun 12 14:58:13 CST 2022
     */
    int insertSelective(ContactsRemark record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_contacts_remark
     *
     * @mbggenerated Sun Jun 12 14:58:13 CST 2022
     */
    ContactsRemark selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_contacts_remark
     *
     * @mbggenerated Sun Jun 12 14:58:13 CST 2022
     */
    int updateByPrimaryKeySelective(ContactsRemark record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_contacts_remark
     *
     * @mbggenerated Sun Jun 12 14:58:13 CST 2022
     */
    int updateByPrimaryKey(ContactsRemark record);

    /**
     * 批量导入联系人备注信息
     * @param list
     * @return
     */
    int insertContactsRemarkByList(List<ContactsRemark> list);

    List<ContactsRemark> selectContactsRemarkForDetailByContactsId(String contactsId);

    /**
     * 插入联系人备注
     * @param remark
     * @return
     */
    int insertContactsRemark(ContactsRemark remark);

    /**
     * 保存修改的联系人备注
     * @param remark
     * @return
     */
    int updateContactsRemark(ContactsRemark remark);

    /**
     * 根据id删除联系人备注
     * @param id
     * @return
     */
    int deleteContactsRemarkById(String id);

}