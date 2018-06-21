package com.skt.mars.adm.lg;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.web.RedirectStrategy;

public class MyAppendParameterRedirectStrategy implements RedirectStrategy {

    @Override
    public void sendRedirect(final HttpServletRequest request, final HttpServletResponse response, final String url) throws IOException {
        String redirectUrl = calculateRedirectUrl(request.getRequestURL().toString());
        redirectUrl = response.encodeRedirectURL(redirectUrl);
        response.sendRedirect(redirectUrl);
    }

    private String calculateRedirectUrl(final String requestUrl) {
        //Attention this parameter striping is only proof of concept!
        return StringUtils.substringBeforeLast(requestUrl, "?") + "?login_error=1";
    }
}