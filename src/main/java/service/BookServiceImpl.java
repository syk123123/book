package service;

import dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Page;

import java.util.HashMap;
import java.util.Map;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public int login(String account, String password) {
        return bookMapper.login(account, password);
    }
    //分页查询
    public void pageList(Page page, Integer type, String bookName, Integer isborrowed) {
        Map<String, Object> params = new HashMap<>();
        params.put("type", type);
        params.put("bookName", bookName);
        params.put("isborrowed", isborrowed);
        page.setCount(bookMapper.count(params));
        if (page.getPageNo() > page.getPageCount())
            page.setPageNo(page.getPageCount());
        else if (page.getPageNo() < 1)
            page.setPageNo(1);
        params.put("from", (page.getPageNo() - 1) * page.getPageSize());
        System.out.println(params.get("from"));
        System.out.println(params.get("type"));
        System.out.println(params.get("bookName"));
        System.out.println(params.get("isborrowed"));
        params.put("pageSize", page.getPageSize());
        page.setPageList(bookMapper.pageList(params));
    }
}
