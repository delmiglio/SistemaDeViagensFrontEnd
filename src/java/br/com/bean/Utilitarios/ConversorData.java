/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.bean.Utilitarios;

import br.com.bean.Classes_Mapeamentos.Viagem;
import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

/**
 * @author Programador O objetivo desta classe é ensinar o spring como converter
 * um string no tipo java.util.date e vice-versa
 *
 */
//public class ConversorData extends PropertyEditorSupportz {
//
//    public void setAsText(String value) {
//        try {
//            Date data = new SimpleDateFormat("dd/MM/yyyy").parse(value);
//            setValue(data);
//        } catch (ParseException e) {
//            setValue(null);
//        }
//    }
//
//    public String getAsText() {
//        return new SimpleDateFormat("dd/MM/yyyy").format((Date) getValue());
//    }
//
//}
