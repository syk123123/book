package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Page;
import service.BookService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/dologin")
    public String login(String account, String password, HttpServletResponse response, HttpSession session) throws IOException {
        int i = bookService.login(account, password);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        if (i > 0) {
            out.println("<script>alert('用户登录成功！')</script>");
            session.setAttribute("account", account);
            return "forward:/show";
        } else {
            out.println("<script>alert('用户不存在！')</script>");
            out.flush();
            return "index";
        }
    }

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "0") Integer pageNo, Integer type, String bookName, Integer isborrowed, HttpServletRequest request) {
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setPageSize(3);
        bookService.pageList(page, type, bookName, isborrowed);
        request.getSession().setAttribute("type", type);
        request.getSession().setAttribute("bookName", bookName);
        request.getSession().setAttribute("isborrowed", isborrowed);
        request.setAttribute("page", page);
        request.setAttribute("list", page.getPageList());
        return "show";
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session) {
        session.removeAttribute("account");
        return "index";
    }
}
