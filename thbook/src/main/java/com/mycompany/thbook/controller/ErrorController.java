package com.mycompany.thbook.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

    @RequestMapping(value = "errors", method = RequestMethod.GET)
    public String renderErrorPage(Model model, HttpServletRequest httpRequest) {

        List<String> errorMsg = new ArrayList();
        int httpErrorCode = getErrorCode(httpRequest);

        switch (httpErrorCode) {
            case 400: {
                errorMsg.add("Http Error Code: 400. Bad Request");
                break;
            }
            case 401: {
                errorMsg.add("Http Error Code: 401. Unauthorized");
                break;
            }
            case 404: {
                errorMsg.add("Http Error Code: 404. Resource not found");
                break;
            }
            case 500: {
                errorMsg.add("Http Error Code: 500. Internal Server Error");
                break;
            }
        }
        model.addAttribute("errorMsg", errorMsg);
        return "errorPage";
    }

    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
                .getAttribute("javax.servlet.error.status_code");
    }
}
