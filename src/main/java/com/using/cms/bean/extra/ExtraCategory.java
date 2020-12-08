package com.using.cms.bean.extra;

import com.using.cms.bean.Category;

import java.util.List;

public class ExtraCategory extends Category {
    private List<ExtraContentInfo> extraContentInfos;

    public List<ExtraContentInfo> getExtraContentInfos() {
        return extraContentInfos;
    }

    public void setExtraContentInfos(List<ExtraContentInfo> extraContentInfos) {
        this.extraContentInfos = extraContentInfos;
    }
}
