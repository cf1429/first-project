package com.using.cms.controller;

import com.github.pagehelper.PageInfo;
import com.using.cms.bean.*;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.bean.extra.ExtraContentInfo;
import com.using.cms.config.FileConfig;
import com.using.cms.service.ContentInfoService;
import com.using.cms.service.FileUploadService;
import com.using.cms.service.UserService;
import com.using.cms.util.*;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.util.StringUtils;

import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping(value = { "/cms/contentInfo", "/api/cms/contentInfo" })
public class ContentInfoController {
    public static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
    @Autowired
    private UserService usersService;
    @Autowired
    private ContentInfoService contentInfoService;
    @Autowired
    private FileUploadService fileUploadService;
    @Autowired
    private FileConfig fileConfig;

    /**
     * 活动，新闻列表
     * @throws
     * @throws IOException
     */
    @PostMapping(value = "list")
    public JsonResult<PageResult<List<ExtraContentInfo>>> list(
            @RequestParam(name = "keyWord", required = false) String keyWord,
            @RequestParam(name = "categoryId", required = false) Integer categoryId,
            @RequestParam(name = "type") Integer type,
            @RequestParam(name = "pageNum") Integer pageNum,
            @RequestParam(name = "pageSize") Integer pageSize,
            @RequestParam(name = "sort",required = false) String sort,
            @RequestParam(name = "state") Integer state
    ) throws BusinessException, IOException {
        JsonResult<PageResult<List<ExtraContentInfo>>> jsonResult = new JsonResult<>();
//        ExtUser curUser = usersService.findCurrentUser();
//        if (curUser == null) {
//            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
//        }

        Map<String,Object> param = new HashMap<>();
        if(!StringUtils.isEmpty(keyWord)){
            param.put("keyWord",keyWord);
        }
        if(null != categoryId){
            param.put("categoryId",categoryId);
        }
        if(null != sort){
            param.put("sort",sort);
        }

        param.put("type",type);
        param.put("state",state);
        param.put("pageNum",pageNum);
        param.put("pageSize",pageSize);

        List<ExtraContentInfo> contentInfos = contentInfoService.selectByMap(param);
        PageInfo<List<ExtraContentInfo>> pageInfo = new PageInfo(contentInfos);
        jsonResult.setSuccessData(PageInfoUtils.convert(pageInfo));
        return jsonResult;
    }


    /**
     * 活动，新闻列表
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "recruitList")
    public JsonResult<Map<String,List<ExtraContentInfo>>> recruitList(
            @RequestParam(name = "keyWord", required = false) String keyWord,
            @RequestParam(name = "categoryId", required = false) Integer categoryId,
            @RequestParam(name = "type") Integer type,
            @RequestParam(name = "pageNum") Integer pageNum,
            @RequestParam(name = "pageSize") Integer pageSize,
            @RequestParam(name = "sort",required = false) String sort,
            @RequestParam(name = "state") Integer state
    ) throws BusinessException, IOException {
        JsonResult<Map<String,List<ExtraContentInfo>>> jsonResult = new JsonResult<>();
//        ExtUser curUser = usersService.findCurrentUser();
//        if (curUser == null) {
//            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
//        }

        Map<String,Object> param = new HashMap<>();
        if(!StringUtils.isEmpty(keyWord)){
            param.put("keyWord",keyWord);
        }
        if(null != categoryId){
            param.put("categoryId",categoryId);
        }
        if(null != sort){
            param.put("sort",sort);
        }

        param.put("type",type);
        param.put("state",state);
        param.put("pageNum",pageNum);
        param.put("pageSize",pageSize);

        List<ExtraContentInfo> contentInfos = contentInfoService.selectByMap(param);
        Map<String,List<ExtraContentInfo>> map = new HashMap<>();
        if(!CollectionUtils.isEmpty(contentInfos)){
            for(ExtraContentInfo extraContentInfo : contentInfos){
                if(map.size() < 1 ){
                    List<ExtraContentInfo> list = new ArrayList<>();
                    list.add(extraContentInfo);
                    map.put(extraContentInfo.getCategoryName(),list);
                }else{
                    if(map.containsKey(extraContentInfo.getCategoryName())){
                        List<ExtraContentInfo> extraContentInfos = map.get(extraContentInfo.getCategoryName());
                        extraContentInfos.add(extraContentInfo);
                        map.put(extraContentInfo.getCategoryName(),extraContentInfos);
                    }else{
                        List<ExtraContentInfo> list = new ArrayList<>();
                        list.add(extraContentInfo);
                        map.put(extraContentInfo.getCategoryName(),list);
                    }
                }
            }
        }
        jsonResult.setSuccessData(map);
        return jsonResult;
    }

    /**
     * 活动，新闻详情
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "detail")
    public JsonResult<ExtraContentInfo> detailPost(
            @RequestParam(name = "id") Integer id
    ) throws BusinessException, IOException {
        JsonResult<ExtraContentInfo> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }

        Map<String,Object> param = new HashMap<>();
        param.put("id",id);

        List<ExtraContentInfo> contentInfos = contentInfoService.selectByMap(param);
        if(contentInfos.isEmpty()){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "没有该数据！");
        }
        jsonResult.setSuccessData(contentInfos.get(0));
        return jsonResult;
    }

    /**
     * 活动，新闻详情
     * @throws BusinessException
     * @throws IOException
     */
    @GetMapping(value = "detail/{id}")
    public JsonResult<ExtraContentInfo> detailGet(
            @PathVariable(name = "id") Integer id
    ) throws BusinessException, IOException {
        JsonResult<ExtraContentInfo> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
//        if (curUser == null) {
//            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
//        }

        Map<String,Object> param = new HashMap<>();
        param.put("id",id);

        List<ExtraContentInfo> contentInfos = contentInfoService.selectByMap(param);
        if(contentInfos.isEmpty()){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "没有该数据！");
        }
        jsonResult.setSuccessData(contentInfos.get(0));
        return jsonResult;
    }


    /**
     * 新增活动，新闻，通过上传word文件的方式
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "add/{utype}")
    public JsonResult<ContentInfo> add(
            ContentInfo contentInfo,
            @PathVariable(name = "utype") Integer utype,
            MultipartFile file,
            @RequestParam(name = "preview",required = false) String preview //null不预览
    ) throws BusinessException, IOException {
        JsonResult<ContentInfo> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        switch (utype){
            case 1:
                if(contentInfo.getType() == 0){
                    throw new BusinessException(ErrorEnum.ERROR_PARAM, "内容类型不能为空！");
                }
                if(null == contentInfo.getCategoryId()){
                    throw new BusinessException(ErrorEnum.ERROR_PARAM, "类别不能为空！");
                }
                //活动，新闻，招聘
                if(contentInfo.getType() == 1 || contentInfo.getType() == 2 || contentInfo.getType() == 3){
                    if(StringUtils.isEmpty(contentInfo.getTitle())){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "标题不能为空！");
                    }
                    if(null == file && StringUtils.isEmpty(contentInfo.getContent())){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "内容不能为空！");
                    }else{
                        if(null != file && !file.isEmpty()){
                            FileUpload fileUpload = fileUploadService.upLoad(file);
                            contentInfo.setFileId(fileUpload.getId());
                            String filePath =  FilenameUtils.concat(UtilsFile.getUrl(), file.getOriginalFilename());
                            // 转存文件
                            file.transferTo(new File(filePath));
                            String htmlStr = UtilsWord.toHtml(filePath);
                            if(htmlStr.contains("./word/media")){
                                htmlStr = htmlStr.replaceAll("./word/media",fileConfig.getServerUrl()+"/tempFanyu/word/media");
                            }
                            contentInfo.setContent(htmlStr);
                        }
                    }
                }
                //活动，新闻，banner
                if(contentInfo.getType() == 1 || contentInfo.getType() == 2 || contentInfo.getType() == 4){
                    if(null == contentInfo.getCoverFileId()){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "封面图片不能为空！");
                    }
                    if(null == contentInfo.getSort()){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "顺序值不能为空！");
                    }
                }
                //活动，新闻
                if(contentInfo.getType() == 1 || contentInfo.getType() == 2){
                    if(StringUtils.isEmpty(contentInfo.getEditorCharge())){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "责任编辑不能为空！");
                    }
                    if(null == contentInfo.getBrowseNumber()){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "浏览次数不能为空！");
                    }
                    if(StringUtils.isEmpty(contentInfo.getSumInfo())){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "摘要信息不能为空！");
                    }
                    if(StringUtils.isEmpty(contentInfo.getDataSource())){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "信息来源不能为空！");
                    }
                    if(contentInfo.getContentSource() == 0){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "内容来源不能为空！");
                    }
                }
                //banner
                if(contentInfo.getType() == 4){
                    if(StringUtils.isEmpty(contentInfo.getBannerLink())){
                        throw new BusinessException(ErrorEnum.ERROR_PARAM, "banner链接不能为空！");
                    }
                }

                //是否预览
                if(StringUtils.isEmpty(preview)){
                    contentInfo.setCreateTime(new Date());
                    contentInfo.setState((byte) 1);
                    contentInfoService.insert(contentInfo);
                }
                jsonResult.setSuccessData(contentInfo);
                break;
            case 2:
                Map<String,Object> param = new HashMap<>();
                param.put("id",contentInfo.getId());
                List<ExtraContentInfo> ExtraContentInfo = contentInfoService.selectByMap(param);
                if(ExtraContentInfo.isEmpty()){
                    throw new BusinessException(ErrorEnum.ERROR_PARAM, "没有该数据！");
                }
                if(null != file &&!file.isEmpty()){
                    FileUpload fileUpload = fileUploadService.upLoad(file);
                    contentInfo.setFileId(fileUpload.getId());
                    String filePath =  FilenameUtils.concat(UtilsFile.getUrl(), file.getOriginalFilename());
                    // 转存文件
                    file.transferTo(new File(filePath));
                    String htmlStr = UtilsWord.toHtml(filePath);
                    if(htmlStr.contains("./word/media")){
                        htmlStr = htmlStr.replaceAll("./word/media",fileConfig.getServerUrl()+"/tempFanyu/word/media");
                    }
                    contentInfo.setContent(htmlStr);
                }
                //是否预览
                if(StringUtils.isEmpty(preview)){
                    contentInfo.setUpdateTime(new Date());
                    contentInfoService.update(contentInfo);
                }
                jsonResult.setSuccessData(contentInfo);
                break;
            default:
                throw new BusinessException(ErrorEnum.ERROR_PARAM, "type值有误");
        }

        return jsonResult;
    }

    /**
     * 批量删除活动，新闻
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "delete")
    public JsonResult<Object> delete(
            @RequestParam(name = "ids") String ids
    ) throws BusinessException, IOException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        int delete = contentInfoService.delete(ids);
        jsonResult.setSuccessData(delete);
        return jsonResult;
    }



    /**
     * 发布,增加浏览次数
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "release/{type}")
    public JsonResult<Object> release(
            @RequestParam(name = "id") Integer id,
            @PathVariable(name = "type") Integer type //1:发布 2:增加浏览次数
    ) throws BusinessException, IOException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }

        Map<String,Object> param = new HashMap<>();
        param.put("id",id);
        List<ExtraContentInfo> contentInfos = contentInfoService.selectByMap(param);
        if(contentInfos.isEmpty()){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "没有该数据！");
        }
        int rc = 0;
        ContentInfo contentInfo = new ContentInfo();
        contentInfo.setId(id);
        switch (type){
            case 1:
                contentInfo.setState((byte) 2);
                contentInfo.setReleaseTime(new Date());
                contentInfo.setTopTime(new Date());
                rc = contentInfoService.update(contentInfo);
                jsonResult.setSuccessData(rc);
                break;
            case 2:
                ContentInfo ct = contentInfos.get(0);
                Integer browseNumber = ct.getBrowseNumber();
                contentInfo.setBrowseNumber(browseNumber + 1);
                contentInfo.setUpdateTime(new Date());
                rc = contentInfoService.update(contentInfo);
                jsonResult.setSuccessData(rc);
                break;
            case 3:

            default:
                throw new BusinessException(ErrorEnum.ERROR_PARAM, "type值有误");
        }
        return jsonResult;
    }


    /**
     * 置顶和取消置顶
     * @param id
     * @param type
     * @return
     * @throws BusinessException
     */
    @PostMapping(value = "/topOperate")
    public JsonResult<Object> topOperate(@RequestParam(name = "id") Integer id,
                                         @RequestParam(name = "type") Integer type,
                                         @RequestParam(name = "contentInfoType") Integer contentInfoType) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        Map<String,Object> param = new HashMap<>();
        param.put("id",id);
        List<ExtraContentInfo> contentInfos = contentInfoService.selectByMap(param);
        if(contentInfos.isEmpty()){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "没有该数据！");
        }
        ContentInfo contentInfo = new ContentInfo();
        contentInfo.setId(id);
        int rc = 0;
        switch (type){
            // 置顶操作：
            case 1:
                // 现将其他置顶的数据取消置顶
                Map<String,Object> params = new HashMap<>();
                params.put("topFlag",1);
                params.put("contentInfoType",contentInfoType);
                List<Map<String, Object>> list = contentInfoService.selectContentInfo(params);
                if(!CollectionUtils.isEmpty(list)){
                    for (Map<String,Object> objectMap : list){
                        ContentInfo sub = new ContentInfo();
                        sub.setId(Integer.valueOf(objectMap.get("id").toString()));
                        sub.setTopFlag(0);
                        contentInfoService.update(sub);
                    }
                }
                contentInfo.setTopTime(new Date());
                contentInfo.setTopFlag(1);
                contentInfo.setUpdateTime(new Date());
                rc = contentInfoService.update(contentInfo);
                jsonResult.setSuccessData(rc);
                break;
            // 取消置顶操作
            case 2:
                contentInfo.setTopFlag(0);
                contentInfo.setUpdateTime(new Date());
                rc = contentInfoService.update2(contentInfo);
                jsonResult.setSuccessData(rc);
                break;
            case 3:
            default:
                throw new BusinessException(ErrorEnum.ERROR_PARAM, "type值有误");
        }
        return jsonResult;

    }


}
