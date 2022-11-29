package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.TranRemark;

import java.util.List;

public interface TranRemarkService {
    List<TranRemark> queryTranRemarkForDetailByTranId(String tranId);

    int saveCreateTranRemark(TranRemark remark);

    int saveEditTranRemark(TranRemark remark);

    int deleteTranRemarkById(String id);
}
