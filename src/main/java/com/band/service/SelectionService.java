package com.band.service;

import com.band.pojo.Selection;
import com.band.utils.Page;

import java.util.List;

public interface SelectionService {
    Selection findSelectionById(Integer id);
    Integer selectSelectionListCount(Selection selection);
    Page<Selection> selectSelectionList(Integer page, Integer rows, String sName, String courseName, Integer selectionStatus);
    void addSelection(Selection selection);
    void updateSelection(Selection selection);
    void deleteSelection(Integer id);
    void deleteSelections(Integer[] ids);
    void updateStatus(Selection selection);
    List<Selection> selectionMySelection(Selection selection);
}
