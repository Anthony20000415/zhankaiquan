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
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import po.Customer;
import po.Manager;

import com.yourcompany.struts.form.SearchmenuForm;

import dao.ICustomerDao;
import dao.IManagerDao;


public class SearchmenuAction extends Action {
private IManagerDao mdao;
	
	public IManagerDao getMdao() {
		return mdao;
	}

	public void setMdao(IManagerDao mdao) {
		this.mdao = mdao;
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		SearchmenuForm searchmenuForm = (SearchmenuForm) form;
		String account=searchmenuForm.getAccount();
		Customer customer=mdao.searchCustomerByAccount(account);

		ActionMessages errors = new ActionMessages();
		if(customer==null){
			Customer cus1 = new Customer();
			cus1.setAccount(null);
			cus1.setPassword(null);
			cus1.setCname(null);
			cus1.setCbalance(0);
			customer=cus1;
		}
		request.getSession().setAttribute("searchcustomer", customer);
		Manager manager=(Manager)request.getSession().getAttribute("manager");
		if(manager!=null)
			return new ActionForward("/searchmenu.jsp");
		else
			return new ActionForward("/searchresult.jsp");
	}
}