package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.commons.constans.Constants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.commons.utils.HSSFUtils;
import com.bjpowernode.crm.commons.utils.UUIDUtils;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.ActivityRemark;
import com.bjpowernode.crm.workbench.service.ActivityRemarkService;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Controller
public class ActivityController {
    @Autowired
    private UserService userService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ActivityRemarkService activityRemarkService;

    @RequestMapping("/workbench/activity/index.do")
    public String index(HttpServletRequest request){
        //查询所有的用户
        List<User> userList = userService.queryAllUsers();
        //把数据储存到request中
        request.setAttribute("userList",userList);
        return "workbench/activity/index";
    }

    @RequestMapping("/workbench/activity/saveCreateActivity.do")
    public @ResponseBody Object saveCreateActivity(Activity activity, HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        //自动注入参数后，二次封装参数
        activity.setId(UUIDUtils.getUUID());
        activity.setCreateTime(DateUtils.formatDateTime(new Date()));
        activity.setCreateBy(user.getId());

        ReturnObject returnObject = new ReturnObject();
        try{
            //调用service保存创新的市场活动
            int res = activityService.saveCreateActivity(activity);
            if(res > 0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试......");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/activity/queryActivityByConditionForPage.do")
    public @ResponseBody Object queryActivityByConditionForPage(String name,String owner,String startDate,String endDate,
                                                                int pageNo,int pageSize){
        //封装参数
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("name",name);
        map.put("owner",owner);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        map.put("beginNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);

        //根据条件查询第一页的活动和总记录数
        List<Activity> activityList = activityService.queryActivityByConditionForPage(map);
        int totalRows = activityService.queryCountOfActivityByCondition(map);

        //生成查询结果响应map信息
        Map<String,Object> resMap = new HashMap<>();
        resMap.put("activityList",activityList);
        resMap.put("totalRows",totalRows);
        return resMap;
    }

    @RequestMapping("/workbench/activity/deleteActivityByIds.do")
    public @ResponseBody Object deleteActivityByIds(String[] id){
        ReturnObject returnObject = new ReturnObject();
        try{
            int res = activityService.deleteActivityByIds(id);
            if(res > 0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试......");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/activity/queryActivityById.do")
    public @ResponseBody Object queryActivityById(String id){
        return activityService.queryActivityById(id);
    }

    @RequestMapping("/workbench/activity/saveEditActivity.do")
    public @ResponseBody Object saveEditActivity(Activity activity,HttpSession session){
        User user = (User) session.getAttribute(Constants.SESSION_USER);

        activity.setEditTime(DateUtils.formatDateTime(new Date()));
        activity.setEditBy(user.getId());

        ReturnObject returnObject = new ReturnObject();
        try {
            int res = activityService.saveEditActivity(activity);
            if (res > 0){
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试......");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }
        return returnObject;
    }

//    /**
//     * 测试生成excel文件和提供文件下载功能
//     * @param response
//     * @throws IOException
//     */
//    @RequestMapping("/workbench/activity/fileDownload.do")
//    public void fileDownload(HttpServletResponse response) throws IOException {
//        //设置响应类型   返回二进制文件
//        response.setContentType("application/octet-stream;charset=UTF-8");
//        //设置响应头信息，返回响应后直接打开文件下载窗口
//        response.setHeader("Content-Disposition","attachment;filename=activityList.xls");
//        //获取输出流
//        OutputStream out = response.getOutputStream();
//
//        InputStream is = new FileInputStream("C:\\Users\\Amor\\IdeaProjects\\CRM_2022\\crm\\serverDir\\activityList.xls");
//        byte[] buff = new byte[256];
//        int len = 0;
//        while((len=is.read(buff)) != -1){
//            out.write(buff,0,len);
//        }
//        //关闭资源，new的关闭，response获取的outStream让tomcat关闭
//        is.close();
//        out.flush();
//    }

    @RequestMapping("/workbench/activity/exportAllActivities.do")
    public void exportAllActivities(HttpServletResponse response) throws IOException {
        List<Activity> activityList = activityService.queryAllActivities();
        //创建excel文件，把activityList写入excel中
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("activityList");
        HSSFRow row = sheet.createRow(0);

        //给第一行赋属性值
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("ID");
        row.createCell(1).setCellValue("所有者");
        row.createCell(2).setCellValue("名称");
        row.createCell(3).setCellValue("开始日期");
        row.createCell(4).setCellValue("结束日期");
        row.createCell(5).setCellValue("成本");
        row.createCell(6).setCellValue("描述");
        row.createCell(7).setCellValue("创建时间");
        row.createCell(8).setCellValue("创建者");
        row.createCell(9).setCellValue("修改时间");
        row.createCell(10).setCellValue("修改者");

        if(activityList != null && activityList.size() > 0){
            Activity activity = null;
            for (int i = 0; i < activityList.size(); i++){
                activity = activityList.get(i);
                row = sheet.createRow(i+1);

                row.createCell(0).setCellValue(activity.getId());
                row.createCell(1).setCellValue(activity.getOwner());
                row.createCell(2).setCellValue(activity.getName());
                row.createCell(3).setCellValue(activity.getStartDate());
                row.createCell(4).setCellValue(activity.getEndDate());
                row.createCell(5).setCellValue(activity.getCost());
                row.createCell(6).setCellValue(activity.getDescription());
                row.createCell(7).setCellValue(activity.getCreateTime());
                row.createCell(8).setCellValue(activity.getCreateBy());
                row.createCell(9).setCellValue(activity.getEditTime());
                row.createCell(10).setCellValue(activity.getEditBy());
            }
        }
        /* 优化：直接让workbood对象写到response的outputStream中
        //根据workbook对象生成excel文件
        OutputStream os = new FileOutputStream("C:\\Users\\Amor\\IdeaProjects\\CRM_2022\\crm\\serverDir\\activityList.xls");
        workbook.write(os);
        //关闭资源
        os.flush();
        os.close();
        workbook.close();
         */

        //把excel文件传到浏览器下载

        //设置响应类型   返回二进制文件
        response.setContentType("application/octet-stream;charset=UTF-8");
        //设置响应头信息，返回响应后直接打开文件下载窗口
        response.setHeader("Content-Disposition","attachment;filename=activityList.xls");
        //获取输出流
        OutputStream out = response.getOutputStream();

        /*
        InputStream is = new FileInputStream("C:\\Users\\Amor\\IdeaProjects\\CRM_2022\\crm\\serverDir\\activityList.xls");
        byte[] buff = new byte[256];
        int len = 0;
        while((len=is.read(buff)) != -1){
            out.write(buff,0,len);
        }
        is.close();
         */

        //优化详情：直接让workbood对象写到response的outputStream中
        workbook.write(out);
        //关闭资源，new的关闭，response获取的outStream让tomcat关闭
        out.flush();
        workbook.close();
    }

    @RequestMapping("/workbench/activity/exportActivitiesByIds.do")
    public void exportActivitiesByIds(String[] id,HttpServletResponse response) throws IOException {
        List<Activity> activityList = activityService.queryActivitiesByIds(id);

        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("activityList");
        HSSFRow row = sheet.createRow(0);
        row.createCell(0).setCellValue("ID");
        row.createCell(1).setCellValue("所有者");
        row.createCell(2).setCellValue("名称");
        row.createCell(3).setCellValue("开始日期");
        row.createCell(4).setCellValue("结束日期");
        row.createCell(5).setCellValue("成本");
        row.createCell(6).setCellValue("描述");
        row.createCell(7).setCellValue("创建时间");
        row.createCell(8).setCellValue("创建者");
        row.createCell(9).setCellValue("修改时间");
        row.createCell(10).setCellValue("修改者");

        if(activityList != null && activityList.size() > 0){
            Activity activity = null;
            for (int i = 0; i < activityList.size(); i++){
                activity = activityList.get(i);
                row = sheet.createRow(i+1);
                row.createCell(0).setCellValue(activity.getId());
                row.createCell(1).setCellValue(activity.getOwner());
                row.createCell(2).setCellValue(activity.getName());
                row.createCell(3).setCellValue(activity.getStartDate());
                row.createCell(4).setCellValue(activity.getEndDate());
                row.createCell(5).setCellValue(activity.getCost());
                row.createCell(6).setCellValue(activity.getDescription());
                row.createCell(7).setCellValue(activity.getCreateTime());
                row.createCell(8).setCellValue(activity.getCreateBy());
                row.createCell(9).setCellValue(activity.getEditTime());
                row.createCell(10).setCellValue(activity.getEditBy());
            }
        }
        OutputStream out = response.getOutputStream();
        response.setContentType("application/octet-stream;charset=UTF-8");
        response.setHeader("Content-Disposition","attachment;filename=activityList.xls");
        workbook.write(out);
        out.flush();
        workbook.close();
    }

    @RequestMapping("/workbench/activity/importActivitiesByIds.do")
    public @ResponseBody Object importActivitiesByIds(MultipartFile activityFile,HttpSession session) {
        User user = (User)session.getAttribute(Constants.SESSION_USER);
        ReturnObject returnObject = new ReturnObject();
        try {
            /*
            //获取上传的文件名
            String originalFilename = activityFile.getOriginalFilename();
            //把excel文件写入磁盘
            File file = new File("C:\\Users\\Amor\\IdeaProjects\\CRM_2022\\crm\\serverDir\\",originalFilename);
            activityFile.transferTo(file);
            //解析excel文件，取出表格数据，并封装成activity对象
            InputStream is = new FileInputStream("C:\\Users\\Amor\\IdeaProjects\\CRM_2022\\crm\\serverDir\\"+originalFilename);
            */

            //优化：获取文件流，直接输入流写入内存workbook中
            InputStream is = activityFile.getInputStream();
            HSSFWorkbook workbook = new HSSFWorkbook(is);
            HSSFSheet sheet = workbook.getSheetAt(0);
            HSSFRow row = null;
            HSSFCell cell= null;
            Activity activity = null;
            List<Activity> activityList = new ArrayList<>();
            for (int i = 1; i <= sheet.getLastRowNum(); i++){
                row = sheet.getRow(i);
                activity = new Activity();
                activity.setId(UUIDUtils.getUUID());
                activity.setOwner(user.getId());
                activity.setCreateTime(DateUtils.formatDateTime(new Date()));
                activity.setCreateBy(user.getId());

                for (int j = 0; j < row.getLastCellNum(); j++){
                    cell = row.getCell(j);
                    //获取列中数据
                    String cellValue = HSSFUtils.getCellValueForStr(cell);
                    if(0 == j){
                        activity.setName(cellValue);
                    }else if(1 == j){
                        activity.setStartDate(cellValue);
                    }else if(2 == j){
                        activity.setEndDate(cellValue);
                    }else if(3 == j){
                        activity.setCost(cellValue);
                    }else if(4 == j){
                        activity.setDescription(cellValue);
                    }
                }
                //每行的活动创建好后添加到list中
                activityList.add(activity);
            }
            //保存导入的市场活动
            int res = activityService.saveActivitiesByList(activityList);
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_SUCCESS);
            returnObject.setMessage(res + "");
        } catch (IOException e) {
            e.printStackTrace();
            returnObject.setCode(Constants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统繁忙，请稍后重试......");
        }

        return returnObject;
    }

    @RequestMapping("/workbench/activity/downloadActivityModeFile.do")
    public void downloadActivityModeFile(HttpServletResponse response) throws IOException {
        //加载文件模板
        InputStream is = new FileInputStream("C:\\Users\\Amor\\IdeaProjects\\CRM_2022\\crm\\serverDir\\fileModel.xls");
        HSSFWorkbook workbook = new HSSFWorkbook(is);
        OutputStream out = response.getOutputStream();
        response.setContentType("application/octet-stream;charset=UTF-8");
        response.setHeader("Content-Disposition","attachment;filename=activityList.xls");
        //响应模板文件
        workbook.write(out);
        out.flush();
        workbook.close();
    }

    /**
     * 根据活动id查询活动详情和活动评论
     * @param id
     * @return
     */
    @RequestMapping("/workbench/activity/detailActivity.do")
    public String detailActivity(String id,HttpServletRequest request){
        Activity activity = activityService.queryActivityForDetailById(id);
        List<ActivityRemark> remarkList = activityRemarkService.queryActivityRemarkForDetailByActivityId(id);

        //保存活动详情和活动评论
        request.setAttribute("activity",activity);
        request.setAttribute("remarkList",remarkList);

        return "workbench/activity/detail";
    }
}
