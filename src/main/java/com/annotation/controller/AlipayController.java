package com.annotation.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradePayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;

@Controller
@RequestMapping("/alipay")
public class AlipayController {

    String app_id = "2016092600598712";
    String private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCemdzKKXJ2Z8HGLoowasMjTlQvz4t9MOcUWvYZGpwWG6gi1A+PYzSI4YU7BBu+6ERedKmrSRaUp5w1KB9c9yQr2TT6pDhqPeaTzk2RwryUYKxfNE8xGpyzYklisW+CMaTR+zrjiNlCiQxh9T2aQrXNUQNtwEfUafxKdMeUqYU/LZP4WCvUfiz5+xUsFhgdVPxttnqdSiDJ1cDmkyXH5cNcljml88VJbRKViWgouBj2TlOSnzBMkMHVw8KP6Ecsd9lwsmiHu80WrnuHqpdWlg3vkVyEFOHUYrcCDrPZlBGEaS3RVC45FZCdbFu/GO+RFYCirtFdetR0yq5Nnea4YbaZAgMBAAECggEAZHSEGjAiZcjWPVahBIW6z5P/UsEcUtE0q/npQoFON9qQpm625FUroz9kibrScBrhowo1pV4HxWRcVnbxVorbCELtgYueh/xpHVlgXGCB3WFWDH8vYaS/eAda//3u6QHUqYN9Cz1UjwYLJ8iTmi+Cw2b6yvstA+eVevt4pjqxQQ/2VDwCwLbzMLURcI2+U5fqp0bcTSWxv1LE0diwFWZz4we7MlqMMgL0IdMkpEiMX0uZdshs5YGMWWyZHavPHx2awgIxGxz/ah0UtRH/fH3jNJyOcMV0xor5ERDdjMJCi6Etj27aHKOmSfUewL/plqxljiwPZ7gE9F0rWuieOYmBAQKBgQDijsCKPb+Lr6wSGTxhR3CGcqcaJgIZ0/cigYRquqq30LzyGsl0+cz2EF3WiKk78r5i0tSxWjqI1B184wfMTID+Ev0FzrlQe3LgiikoG6NVjJV6eiQx4gGr9d6E/78pANwmHqNnCZ+W+Jb0jrdMrz2zqe5wQcefo8PEc+dMbQtlKQKBgQCzNkqiSZUmbf2K48mZnpVlXwuniV0Tkn0EE1hngqm2qg7YpQtdBjqS7OgiSU2UYLMG7I2aYPLh63RAwJG1L6PPcOttkaNDGL6RGN8JYd3wTsHLPJkdsrXn9MDZYEC9W0fmoDLiRlrbxb7QgC5C8RnGnbBr1ylUGBjP+PGwkbgD8QKBgQDE4TkA6Vgjk638rGGESAjJTalZV95Lg6AoJFVmSoFA6+zGl/Cp7srmqqJhZLFsny5DwuOCm95yOaLGfKSyLWmLYgTvnw37msvhxS6u5BW0qk7b+HirwLOjNC8DdRwyDcVCey2UxRAiqjTEoaE4yrDcCLhkZUWMvUvK1M4T5E8awQKBgDFh9YDwu8vCJUp/aE8PduVfImwBGwfIpvBXkFW9mJyAEeU63X29uKhB5dmEz37igpKW3pI6wtLkOb2aEsyVmxMPb6BasF1N1T1QWC1SrYCJgzdItHyNgTiwpe+AaXaET7TKUhst/d1viRwVJipGG68yRqoAuR+2ICg21gqsrMNRAoGAK2ASr+rfR6YVyF1Nf/JsGyK/pqhNxaEI5Uyn6fWZInELlERHuR+V77Ktj47j2Dtta829w51Oa7yYq+/LaSvrzDJA11uxeu06JYJK6oE/u2n0x/OrL3aVgUeEupEQN9+jw/N7F8lcSFxID8xUVS65dWdgmihL79FS4u33i0i80Os=";
    String public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtPGRfb68TAAGCZ0rcUYWEIjGOUJU1+JRuZCkFJoggqftdcrSpkXpmhcfLx+6lS39w0+MeIvpH4R3cNtJsSj10/yOuWDVzoSGIiVxZ51I8+dcetrBwYAasmIOKiKzfr4C3SMx9EP6BqVRDpq9FcP1APPFpoXUpSw/Sgg5xyMviTVoCjYWD2w2IOan1B6WkpqqlNVGw0M5Zm1Ki/ctQ9B8EfB144UPNjGr3F41ww4mPOc988NYy34Nx2Gekn++UJAOto7kBLWVS6WHhvEp3UAMACf42JUfDGQPj4VSlmRglfJnNC0JRzLvfeo1WwFdX9NGiRHi4x3OVPXL6PJLu6ptbwIDAQAB";
   String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";
     String return_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
    String signtype = "RSA2";
     String charset = "utf-8";
     String format = "json";
    String url = "https://openapi.alipaydev.com/gateway.do";

//    String app_id = AlipayConfig.app_id;
//    String private_key = AlipayConfig.private_key;
//    String notify_url = AlipayConfig.notify_url;
//    String return_url = AlipayConfig.return_url;
//    String url = AlipayConfig.url;
//    String charset = AlipayConfig.charset;
//    String format = AlipayConfig.format;
//    String public_key = AlipayConfig.public_key;
//    String signtype = AlipayConfig.signtype;

    /**
     * 支付请求
     *
     * @param
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/pay")
    public void pay(HttpServletRequest request, HttpServletResponse response, String money) throws Exception {
        String orderNo = "102929333";
        String totalAmount = money;
        String subject = "ITAEMBook";
        String body = "reading";
        AlipayClient client = new DefaultAlipayClient(url, app_id, private_key, format, charset, public_key, signtype);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(return_url);
        alipayRequest.setNotifyUrl(notify_url);
        AlipayTradePayModel model = new AlipayTradePayModel();
        model.setProductCode("FAST_INSTANT_TRADE_PAY");
        model.setOutTradeNo(orderNo);
        model.setSubject(subject);
        model.setTotalAmount(totalAmount);
        model.setBody(body);
        alipayRequest.setBizModel(model);
        String form = client.pageExecute(alipayRequest).getBody();
        response.setContentType("text/html;charset=" + charset);
        response.getWriter().write(form);
        response.getWriter().flush();
        response.getWriter().close();
    }
    @RequestMapping("/returnUrl")
    public ModelAndView returnUrl(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        boolean signVerified = AlipaySignature.rsaCheckV1(params, public_key, charset, signtype);
         if (signVerified) {
             System.out.println("前往支付成功页面");
             mav.setViewName("successReturn");
         } else {
             System.out.println("前往支付失败页面");
             mav.setViewName("failReturn");
         }
         return mav;
    }

    @RequestMapping("/notifyUrl")
    public void notifyUrl(HttpServletRequest request) throws Exception {
         Map<String, String> params = new HashMap<String, String>();
         Map<String, String[]> requestParams = request.getParameterMap();
         for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
             String name = (String) iter.next();

         String[] values = (String[]) requestParams.get(name);
         String valueStr = "";
         for (int i = 0; i < values.length; i++) {
             valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
         }
             params.put(name, valueStr);
    }
    boolean signVerified = AlipaySignature.rsaCheckV1(params, public_key, charset, signtype);
    if (signVerified) {
        System.out.println("异步通知成功");
         String out_trade_no = request.getParameter("out_trade_no");
         String trade_status = request.getParameter("trade_status");
         } else {
        System.out.println("异步通知失败");
    }
}



}


