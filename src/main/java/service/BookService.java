package service;

import pojo.Page;

public interface BookService {
    public int login(String account, String password);

    public void pageList(Page page, Integer type, String bookName, Integer isborrowed);
}
