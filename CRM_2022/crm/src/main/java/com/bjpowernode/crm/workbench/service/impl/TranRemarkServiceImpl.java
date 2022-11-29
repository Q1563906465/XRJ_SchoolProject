package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.workbench.domain.TranRemark;
import com.bjpowernode.crm.workbench.mapper.TranRemarkMapper;
import com.bjpowernode.crm.workbench.service.TranRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("TranRemarkService")
public class TranRemarkServiceImpl implements TranRemarkService {
    @Autowired
    private TranRemarkMapper tranRemarkMapper;

    @Override
    public List<TranRemark> queryTranRemarkForDetailByTranId(String tranId) {
        return tranRemarkMapper.selectTranRemarkForDetailByTranId(tranId);
    }

    @Override
    public int saveCreateTranRemark(TranRemark remark) {
        return tranRemarkMapper.insertTranRemark(remark);
    }

    @Override
    public int saveEditTranRemark(TranRemark remark) {
        return tranRemarkMapper.updateTranRemark(remark);
    }

    @Override
    public int deleteTranRemarkById(String id) {
        return tranRemarkMapper.deleteTranRemarkById(id);
    }
}
