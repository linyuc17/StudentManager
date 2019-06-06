package com.band.service.impl;

import com.band.dao.SelectionDao;
import com.band.pojo.Selection;
import com.band.service.SelectionService;
import com.band.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SelectionServiceImpl implements SelectionService {
    @Autowired
    private SelectionDao selectionDao;
    public Selection findSelectionById(Integer id){
        return this.selectionDao.findSelectionById(id);
    }

    @Override
    public Integer selectSelectionListCount(Selection selection) {
        return null;
    }

    @Override
    public Page<Selection> selectSelectionList(Integer page, Integer rows,String sName, String courseName, Integer selectionStatus){
        Selection selection = new Selection();

        if(StringUtils.isNotBlank(sName)){
            selection.setsName(sName);
        }
        if(StringUtils.isNotBlank(courseName)){
            selection.setCourse_name(courseName);
        }
        selection.setSelection_status(selectionStatus);

        Integer start = (page-1) * rows;//当前页
        selection.setRn(start);
        selection.setRowNum(start+rows+1);
        System.out.println("显示第"+selection.getRn()+"条和第"+selection.getRowNum()+"之间的数据");
        System.out.println("implselectionId="+sName);
        List<Selection> selections = selectionDao.selectSelectionList(selection);
        Integer count = selectionDao.selectSelectionListCount(selection);
        Page<Selection> result = new Page<>();
        result.setPage(page);
        result.setRows(selections);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public void addSelection(Selection selection) {
         this.selectionDao.addSelection(selection);
    }

    @Override
    public void updateSelection(Selection selection) {
        this.selectionDao.updateSelection(selection);
    }

    @Override
    public void deleteSelection(Integer id) {
        this.selectionDao.deleteSelection(id);
    }

    @Override
    public void deleteSelections(Integer[] ids) {
        this.selectionDao.deleteSelections(ids);
    }
    public void updateStatus(Selection selection){
        this.selectionDao.updateStatus(selection);
    }
    public List<Selection> selectionMySelection(Selection selection){
        return this.selectionDao.selectMySelection(selection);
    }
}
