/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.yourcompany.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yourcompany.struts.form.CxmxForm;

import dao.ICustomerDao;

public class CxmxAction extends Action {
private ICustomerDao cdao;
	
	public ICustomerDao getCdao() {
		return cdao;
	}

	public void setCdao(ICustomerDao cdao) {
		this.cdao = cdao;
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CxmxForm cxmxForm = (CxmxForm) form;// TODO Auto-generated method stub
		return null;
	}
}