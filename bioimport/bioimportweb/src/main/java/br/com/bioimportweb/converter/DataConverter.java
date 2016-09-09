package br.com.bioimportweb.converter;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import br.com.bioimportejb.util.Utilitario;

@FacesConverter(value="dataConverter")
public class DataConverter implements Converter {

	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1, String value) {
		
		try {
			if(value != null) {
				SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
				Calendar dataCalendar = Calendar.getInstance();
				dataCalendar.setTime(fmt.parse(value));
				return dataCalendar;
			}
		
		} catch (ParseException e) {
			return "";
		}  
		return "";
		
	}
	

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object value) {
		if(value != null) {
			Calendar date = (Calendar) value;
			return Utilitario.formatarData(date.getTime(), "dd/MM/yyyy"); 
		} else {
			return "";
		}
	}

}
