package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.FunnelVO;
import com.bjpowernode.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

public interface TranService {
    void saveCreateTran(Map<String,Object> map);

    Tran queryTranForDetailById(String id);

    List<FunnelVO> queryCountOfTranGroupByStage();

    List<Tran> queryTranByConditionForPage(Map<String,Object> map);

    int queryCountOfTranByCondition(Map<String,Object> map);

    int deleteTranByIds(String[] id);

    Tran queryTranById(String id);

    int saveEditTran(Map<String,Object> map);

    List<FunnelVO> queryCountOfTranByContactsId();


}
