/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Utilitarios;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Programador
 */
public class LoginInterceptador extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {

        String uri = request.getRequestURI();

        // Barra Os Acessos na Area Administrativa Caso o Usuário Não Esteja Logado
        // Não Esquecer que Ao Logar Devemos Setar o Cookie Antes de Cair Nesse Interceptador
        if (uri.endsWith("adm")) {
            // Exemplos de Uso do Manipulador
            Cookie c = ManipuladorCookies.pegaCookiePorNome("loginCookie", request);
            //c = ManipuladorCookies.apagaCookie(c.getName(), request);
            if (c != null) {
                return true;
            } else {
                RequestDispatcher dispacher = request.getRequestDispatcher("login");
                dispacher.forward(request, response);
            }
        }
        return true;
    }

}
