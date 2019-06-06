package com.band.dao;

import com.band.pojo.Selection;

import java.util.List;

public interface SelectionDao {
    Selection findSelectionById(Integer id);
    Integer selectSelectionListCount(Selection selection);
    List<Selection> selectSelectionList(Selection selection);
    void addSelection(Selection selection);
    void updateSelection(Selection selection);
    void deleteSelection(Integer id);
    void deleteSelections(Integer[] ids);
    void updateStatus(Selection selection);
    List<Selection> selectMySelection(Selection selection);
}
