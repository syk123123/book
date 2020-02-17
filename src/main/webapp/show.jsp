<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书</title>
</head>
<body>
<h1>图书借阅系统</h1>
<form action="show" method="post">
    <table border="1">
        <tr>
            <td>
                图书分类:<select name="type">
                <option value="0">
                    ---请选择---
                </option>
                <option value="1" <c:if test="${type==1}">selected</c:if>>
                    小说
                </option>
                <option value="2" <c:if test="${type==2}">selected</c:if>>
                    文学
                </option>
                <option value="3">
                    传记
                </option>
                <option value="4">
                    艺术
                </option>
                <option value="5">
                    少儿
                </option>
                <option value="6">
                    经济
                </option>
                <option value="7">
                    管理
                </option>
                <option value="8">
                    科技
                </option>
            </select>
            </td>
            <td>
                图书名称:<input type="text" name="bookName" value="${bookName}">
            </td>
            <td>
                是否借阅:<select name="isborrowed">
                <option value="-1">
                    ---请选择---
                </option>
                <option value="0" <c:if test="${isborrowed==0}">selected</c:if>>
                    未借阅
                </option>
                <option value="1" <c:if test="${isborrowed==1}">selected</c:if>>
                    已借阅
                </option>
            </select>

            </td>
            <td>
                <input type="submit" value="查询">
            </td>
        </tr>
        <tr>
            <td>当前用户:${account} <a href="javascript:exit();">退出</a></td>
        </tr>
        <tr>
            <td>图书编号</td>
            <td>图书分类</td>
            <td>图书名称</td>
            <td>作者</td>
            <td>出版社</td>
            <td>操作</td>
        </tr>
        <tr>
            <td>
                <c:if test="${empty list}">
                    <h4>对不起,没有符合查询条件的结果!</h4>
                </c:if>
            </td>
        </tr>
        <c:forEach items="${list}" var="i">
            <tr>
                <td>
                        ${i.bookCode}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${i.bookType==1}">
                            小说
                        </c:when>
                        <c:when test="${i.bookType==1}">
                            文学
                        </c:when>
                        <c:otherwise>
                            其他
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                        ${i.bookName}
                </td>
                <td>
                        ${i.bookAuthor}
                </td>
                <td>
                        ${i.publishPress}
                </td>
                <td>

                    <c:if test="${i.borrowed==0}">
                        <a href="">申请借阅</a>
                    </c:if>
                    <c:if test="${i.borrowed==1}">
                        已借阅
                    </c:if>

                </td>

            </tr>
        </c:forEach>
    </table>
    <a href="javascript:doPage(${page.pageNo-1});">上一页</a>
    <c:forEach begin="1" end="${page.pageCount}" var="i">
        ${i}
    </c:forEach>
    <a href="javascript:doPage(${page.pageNo+1});">下一页</a>
    共${page.pageCount}页 到第<input type="text" name="pageNo">页 <input type="submit" value="确定">
</form>
<script src="js/jquery-1.12.4.js"></script>
<script>
    function doPage(i) {
        $("[name=pageNo]").val(i);
        $("form").submit();
    }

    function exit() {
        var result = confirm("是否退出系统？");
        if (result)
            location.href = "exit";
    }
</script>
</body>
</html>
