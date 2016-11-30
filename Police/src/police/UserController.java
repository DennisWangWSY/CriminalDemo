package police;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import model.Criminals;
import model.Inform;
import model.Users;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

public class UserController extends Controller{
	static String id,name,sex,
	lheight,hheight,
	lweight,hweight;
	static String from="index";
	static int indexpage=1, searchpage=1;
	public boolean check(boolean inaddress,String notnull){
		boolean check = true;
		if(inaddress){
			if(getPara()==null) check = false;
			if(notnull!=""){
				if(getPara(notnull)==null) check=false;
			}
		}
		else{
			if(notnull!=""){
				if(getPara(notnull)==null) check=false;
			}
		}
		if(check){
			return check;
		}else{
			this.render("/index/errorpage.jsp");
			return check;
		}
	}
	public void index(){
		if(check(true,"")){
			from = "index";
			indexpage=getParaToInt();
			setAttr("criminalPage",
					Criminals.me.paginate(getParaToInt(), 5,"select * from criminals order by id"));
			this.render("mainpage.jsp");
		}
	}
	
	public void addinform(){
		if(check(true,"")){
			String criminal = getPara();
			Criminals cri = Criminals.me.findById(criminal);
			setAttr("criminal",cri);
			this.render("addinform.jsp");
		}
	}
	//@Before(InformValidator.class)
	public void save(){
		if(check(false,"inform.criminal")){
			String criminalcheck=getPara("inform.criminal"),titlecheck=getPara("inform.title"),
					contentcheck=getPara("inform.content"),phonecheck=getPara("inform.phone"),
					namecheck=getPara("inform.name");
			String criminalMsg=" ",titleMsg=" ",contentMsg=" ";
			if(titlecheck.equals("")||contentcheck.equals("")){
				if(titlecheck.equals("")){
					titleMsg="请输入举报信息标题";
				}
				if(contentcheck.equals("")){
					contentMsg="请输入举报内容";
				}
				Criminals cri = Criminals.me.findById(criminalcheck);
				setAttr("criminal",cri);
				setAttr("id",criminalcheck);setAttr("title",titlecheck);
				setAttr("content",contentcheck);setAttr("phone",phonecheck);
				setAttr("name",namecheck);
				setAttr("criminalMsg",criminalMsg);setAttr("titleMsg",titleMsg);
				setAttr("contentMsg",contentMsg);
				render("addinformwrong.jsp");
			}
			else{
				System.out.println(from);
				getModel(Inform.class).save();
				if(from.equals("index")){
//					setAttr("criminalPage", Criminals.me.paginate(indexpage, 5,"select * from criminals"));
//					this.render("mainpage.jsp");
					this.redirect("/user/"+indexpage);
				}
				else{
					setAttr("id",id);setAttr("name",name);setAttr("sex",sex);
					setAttr("lheight",lheight);setAttr("hheight",hheight);
					setAttr("lweight",lweight);setAttr("hweight",hweight);
					String sql = "select * from criminals where height>"+lheight+" and height<"+hheight
							+ " and weight>"+lweight+" and weight<"+hweight;
					if(id!="") sql += " and id="+id;
					if(sex!="") sql += " and sex='"+sex+"'";
					if(name!="") sql += " and name like '%"+name+"%'";
					sql+=" order by height, weight";
					System.out.println(sql);
					setAttr("criminalPage",Criminals.me.paginate(searchpage, 5, sql));
					render("result.jsp");
				}
			}
		}
	}
	public void search(){
//		if(check()){
			this.render("search.jsp");
//		}
	}
	public void dosearch(){
		if(check(true,"lheight")){
			from="search";
			searchpage=getParaToInt();
			id=getPara("id");name=getPara("name");sex=getPara("sex");
					lheight=getPara("lheight");hheight=getPara("hheight");
					lweight=getPara("lweight");hweight=getPara("hweight");
			setAttr("id",id);setAttr("name",name);setAttr("sex",sex);
			setAttr("lheight",lheight);setAttr("hheight",hheight);
			setAttr("lweight",lweight);setAttr("hweight",hweight);
			String sql = "select * from criminals where height>"+lheight+" and height<"+hheight
					+ " and weight>"+lweight+" and weight<"+hweight;
			if(id!="") sql += " and id='"+id+"'";
			if(sex!="") sql += " and sex='"+sex+"'";
			if(name!="") sql += " and name like '%"+name+"%'";
			sql+=" order by height, weight";
			System.out.println(sql);
			setAttr("criminalPage",Criminals.me.paginate(getParaToInt(), 5, sql));
			render("result.jsp");
		}
	}
	public void dosearch2() throws UnsupportedEncodingException{
		if(check(true,"")){
			from = "search";
			searchpage=getParaToInt();
			setAttr("id",id);setAttr("name",name);setAttr("sex",sex);
			setAttr("lheight",lheight);setAttr("hheight",hheight);
			setAttr("lweight",lweight);setAttr("hweight",hweight);
			String sql = "select * from criminals where height>"+lheight+" and height<"+hheight
					+ " and weight>"+lweight+" and weight<"+hweight;
			if(id!="") sql += " and id='"+id+"'";	
			if(sex!="") sql += " and sex='"+sex+"'";
			if(name!="") sql += " and name like '%"+name+"%'";
			sql+=" order by height, weight";
			System.out.println(sql);
			setAttr("criminalPage",Criminals.me.paginate(getParaToInt(), 5, sql));
			render("result.jsp");
		}
	}
}
