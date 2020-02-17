package dao;

import pojo.Book;

import java.util.List;
import java.util.Map;

public interface BookMapper {
    public int login(String account, String password);

    public List<Book> pageList(Map<String, Object> params);

    public int count(Map<String, Object> params);
}
