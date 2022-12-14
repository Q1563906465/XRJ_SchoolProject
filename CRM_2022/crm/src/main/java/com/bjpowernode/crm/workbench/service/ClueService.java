package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.FunnelVO;

import java.util.List;
import java.util.Map;

public interface ClueService {
    int saveCreateClue(Clue clue);

    List<Clue> queryClueByConditionForPage(Map<String,Object> map);

    int queryCountOfClueByCondition(Map<String, Object> map);

    Clue queryClueById(String id);

    int deleteClueByIds(String[] ids);

    int saveEditClue(Clue clue);

    Clue queryClueForDetailById(String id);

    void saveConvertClue(Map<String,Object> map);

    List<FunnelVO> queryCountOfCompanyByCompany();
}
