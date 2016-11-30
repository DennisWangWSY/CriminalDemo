package police;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import model.Criminals;
import model.Inform;
import model.Users;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

public class OrganizerController extends Controller{
	public boolean checkU(boolean inaddress,String notnull){
		//妫�鏌ュ叕瀹変汉鍛樺彲璇锋眰鐨勯〉闈腑鍙傛暟鏄惁瀹屽叏銆�
		//inaddress涓簎rl涓槸鍚﹀簲璇ユ湁鍙傛暟锛宯otnull涓鸿〃鍗曚腑鏌愪竴涓竴瀹氶潪绌虹殑鍙傛暟椤�
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
			this.render("/index/errorpageU.jsp");
			return check;
		}
	}	
	
	public boolean checkO(boolean inaddress,String notnull){
		//鍚宑heckU()
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
			this.render("/index/errorpageO.jsp");
			return check;
		}
	}
	static String from = "index", editusername="",editcriminalname="";
	static int userpage=1,informpage=1,arrestpage=1;
	//涓�浜涜褰曢〉闈㈢姸鎬佺殑闈欐�佸彉閲�
	public boolean checkorganizer(){
		//妫�鏌ョ敤鎴疯韩浠芥槸鍚︿负绠＄悊浜哄憳
		String loggedin = getSession().getAttribute("loggedin").toString();
		String type = getSession().getAttribute("type").toString();
		if(loggedin.equals("1"))	{this.render("/index/invalid.jsp"); return false;}
		else if (type.equals("u"))	{this.render("/index/notorganizer.jsp"); return false;}
		return true;
	}
	public boolean checkpoliceman(){
		//妫�鏌ョ敤鎴疯韩浠芥槸鍚︿负鍏畨浜哄憳
		String loggedin = getSession().getAttribute("loggedin").toString();
		String type = getSession().getAttribute("type").toString();
		if(loggedin.equals("1"))	{this.render("/index/invalid.jsp"); return false;}
		else if (type.equals("o"))	{this.render("/index/notpolice.jsp"); return false;}
		return true;
	}
	public void index(){
		if(checkpoliceman()){
			render("mainpage.jsp");
		}
	}
	public void userorgan(){
		//鍚庡彴鐢ㄦ埛鐨勭鐞�
		if(checkorganizer()){
			//绠＄悊鍛樻潈闄�
			if(checkO(true,"")){
				from = "user";
				userpage=getParaToInt();
				setAttr("userPage", Users.me.paginate(getParaToInt(), 10,"select * from users order by type"));
				this.render("userpage.jsp");
			}
		}
	}
	public void adduser(){
		//娣诲姞鐢ㄦ埛
		if(checkorganizer()){
			Users user = Users.me.findFirst("select * from users u where u.id=(select max(id) from users)");
			int num = user.getId();
			num++;
			setAttr("id",num);
			this.render("adduser.jsp");
		}
	}
	public void save(){
		//淇濆瓨鏂扮殑鐢ㄦ埛
		if(checkorganizer()){
			if(checkO(false,"user.type")){
				String id = getPara("user.id"),
						name = getPara("user.name"),
						type = getPara("user.type"),
						password = getPara("user.password"),
						password2 = getPara("password2");
				Users userwithname = Users.me.findFirst("select * from users where name='"+name+"'");
				Users userwithid = Users.me.findById(id);
				if(userwithname!=null||userwithid!=null||id.equals("")
						||name.equals("")||password.equals("")
						||!password.equals(password2)){
					String idMsg="", nameMsg="", passwordMsg="", passwordMsg2="";
					if(id.equals(""))	idMsg="璇疯緭鍏ョ敤鎴穒d";
					if(name.equals(""))	nameMsg="璇疯緭鍏ョ敤鎴峰悕";
					if(password.equals("")) passwordMsg="璇疯緭鍏ュ瘑鐮�";
					if(!password.equals(password2))	passwordMsg2="涓ゆ杈撳叆瀵嗙爜涓嶄竴鑷�";
					if(userwithname!=null)	nameMsg="璇ョ敤鎴峰凡瀛樺湪";
					if(userwithid!=null)	idMsg="璇d宸插瓨鍦�";
					setAttr("id",id);setAttr("name",name);setAttr("type",type);
					setAttr("idMsg",idMsg);setAttr("nameMsg",nameMsg);
					setAttr("passwordMsg",passwordMsg);setAttr("passwordMsg2",passwordMsg2);
					render("adduserwrong.jsp");
				}
				else{
					password = MD5.GetMD5Code(password);
					new Users().set("id", id).set("name", name).set("type", type).set("password", password).save();
					redirect("userorgan/1");	
				}
			}
		}
	}
	public void deleteuser(){
		//鍒犻櫎鐢ㄦ埛
		if(checkorganizer()){
			if(checkO(true,"")){
				Users.me.deleteById(getPara());
				this.redirect("/organizer/userorgan/1");				
			}
		}
	}
	public void edituser(){
		//缂栬緫淇敼鐢ㄦ埛淇℃伅
		if(checkorganizer()){
			if(checkO(true,"")){
				Users user = Users.me.findById(getPara());
				setAttr("user",user);
				editusername=user.getStr("name");
				this.render("edituser.jsp");
			}
		}
	}
	public void update(){
		//灏嗙紪杈戣繃鐨勭敤鎴蜂俊鎭繘琛屾洿鏂�
		if(checkorganizer()){
			if(checkO(false,"user.type")){
				String id = getPara("user.id"),
						name = getPara("user.name"),
						type = getPara("user.type"),
						password = getPara("user.password"),
						password2 = getPara("password2");
				Users userwithname = Users.me.findFirst("select * from users where name='"+name+"'");
				if((!name.equals(editusername)&&userwithname!=null)||name.equals("")||!password.equals(password2)){
					String nameMsg=""; String passwordMsg2="";
					if(userwithname!=null)	nameMsg="鐢ㄦ埛鍚嶅凡瀛樺湪";
					if(name.equals(""))	nameMsg="璇峰～鍐欑敤鎴峰悕";	
					if(!password.equals(password2)) passwordMsg2="涓ゆ瀵嗙爜涓嶄竴鑷�";
					Users user = Users.me.findById(id);
					setAttr("user",user);
					setAttr("nameMsg",nameMsg);setAttr("passwordMsg2",passwordMsg2);
					render("edituserwrong.jsp");
				}
				else{
					if(!password.equals("")){
						password = MD5.GetMD5Code(password);
						Users.me.findById(id).set("name", name).set("type", type).set("password", password).update();
					}
					else{
						Users.me.findById(id).set("name", name).set("type", type).update();
					}
					this.redirect("/organizer/userorgan/1");
				}
			}
			
		}
	}
	public void arrestorgan(){
		//閫氱級鐘殑绠＄悊
		if(checkpoliceman()){
			if(checkU(true,"")){
				from = "inform";
				arrestpage=getParaToInt();
				setAttr("criminalPage", Criminals.me.paginate(getParaToInt(), 5,"select * from criminals order by id"));
				this.render("criminalpage.jsp");
			}
		}
	}
	public void addcriminal(){
		//娣诲姞閫氱級鐘�
		if(checkpoliceman()){
			this.render("addcriminal.jsp");
		}
	}
	public void saveCriminal(){
		//妫�鏌ユ柊閫氱級鐘唴瀹癸紝骞舵坊鍔�
		if(checkpoliceman()){
//			if(checkU2(false,"heihgt")){
				UploadFile file = getFile("photo","../img");
				String id = getPara("id"),sex=getPara("sex"),
						name=getPara("name"),height=getPara("height"),
						weight=getPara("weight"),bodytype=getPara("bodytype"),
						phonenumber=getPara("phonenumber");
				Criminals criminalwithid = Criminals.me.findById(id);
				if(criminalwithid!=null||id.equals("")||name.equals("")
						||bodytype.equals("")||phonenumber.equals("")
						||file==null){
					String notcomplete="", alreadexist="";
					setAttr("cid",id);setAttr("csex",sex);setAttr("cname",name);
					setAttr("cheight",height);setAttr("cweight",weight);
					setAttr("cbodytype",bodytype);setAttr("cphonenumber",phonenumber);
					if(!id.equals("")&&criminalwithid!=null){
						alreadexist="id已存在";
					}
					else{
						notcomplete="存在未填写的必要信息";
					}
					setAttr("alreadexistMsg",alreadexist);
					setAttr("notcompleteMsg",notcomplete);
					render("addcriminalwrong.jsp");
				}
				else{
					new Criminals().set("id",id).set("name", name).set("sex",sex).set("height",height)
					.set("weight",weight).set("bodytype",bodytype).set("phonenumber", phonenumber)
					.set("image",file.getFileName()).save();
					this.redirect("/organizer/arrestorgan/1");
				}
//			}	
		}
	}
	public void editcriminal(){
		//缂栬緫閫氱級鐘�
		if(checkpoliceman()){
			if(checkU(true,"")){
				Criminals criminal = Criminals.me.findById(getPara());
				setAttr("criminal",criminal);
				editcriminalname=criminal.getStr("name");
				this.render("editcriminal.jsp");
			}
		}
	}
	public void updateCriminal(){
		//鏇存柊
		if(checkpoliceman()){
//			if(checkU2(false,"heihgt")){
				UploadFile file = getFile("photo","../img");
				String id = getPara("id"),sex=getPara("sex"),
						name=getPara("name"),height=getPara("height"),
						weight=getPara("weight"),bodytype=getPara("bodytype"),
						phonenumber=getPara("phonenumber");
				if(id.equals("")||name.equals("")
						||bodytype.equals("")||phonenumber.equals("")){
					String notcomplete="";
					setAttr("cid",id);setAttr("csex",sex);setAttr("cname",name);
					setAttr("cheight",height);setAttr("cweight",weight);
					setAttr("cbodytype",bodytype);setAttr("cphonenumber",phonenumber);
					setAttr("cphoto",Criminals.me.findById(id).getStr("image"));
						notcomplete="璇峰～鍐欐墍鏈夌殑琛ㄥ崟椤�";
					setAttr("notcompleteMsg",notcomplete);
					render("editcriminalwrong.jsp");
				}
				else{
					if(file==null){
						Criminals.me.findById(id).set("name", name).set("sex",sex).set("height",height)
						.set("weight",weight).set("bodytype",bodytype)
						.set("phonenumber", phonenumber).update();
					}else{
						Criminals.me.findById(id).set("name", name).set("sex",sex).set("height",height)
						.set("weight",weight).set("bodytype",bodytype).set("image",file.getFileName())
						.set("phonenumber", phonenumber).update();
					}
					this.redirect("/organizer/arrestorgan/1");
				}
//			}
		}
	}
	public void deletecriminal(){
		//鍒犻櫎锛実etPara涓竴瀹氭槸涓�涓湁鏁堢殑id
		if(checkpoliceman()){
			if(checkU(true,"")){
				Criminals.me.deleteById(getPara());
				this.redirect("/organizer/arrestorgan/1");
			}
		}
	}
	public void deletecriminalbyid(){
		//鏍规嵁涓�涓寚瀹氱殑id鍒犻櫎閫氱級鐘紝闇�瑕佹鏌d鐨勫悎鐞嗘��
		if(checkpoliceman()){
			if(checkU(false,"cid")){
				String id = getPara("cid");
				if(Criminals.me.findById(id)!=null){
					Criminals.me.deleteById(id);
					this.redirect("/organizer/arrestorgan/1");
				}
				else{
					setAttr("message","鏃犳寚瀹歩d鐨勯�氱級鐘�");
					setAttr("cid",id);
					setAttr("criminalPage", Criminals.me.paginate(arrestpage, 5,"select * from criminals order by id"));
					this.render("deleteerror.jsp");
				}
			}
		}
	}
	public void informorgan(){
		//涓炬姤淇℃伅鐨勬煡鐪�
		if(checkpoliceman()){
			if(checkU(true,"")){
				from = "inform";
				informpage=getParaToInt();
				setAttr("informPage", Inform.me.paginate(getParaToInt(), 10,"select * from inform order by criminal"));
				this.render("informpage.jsp");	
			}
		}
	}
	public void informdetail(){
		//鏌愪竴鏉′妇鎶ヤ俊鎭殑璇︾粏鏄剧ず
		if(checkpoliceman()){
			if(checkU(true,"")){
				String id = getPara();
				Inform inform = Inform.me.findById(id);
				String criminal = inform.getStr("criminal");
				Criminals cri = Criminals.me.findById(criminal);
				System.out.println(cri.getStr("name"));
				setAttr("criminal",cri);
				setAttr("inform",inform);
				this.render("informdetail.jsp");
			}
		}
	}
	public void informbycriminal(){
		//鏌愪汉鐩稿叧鐨勬墍鏈変妇鎶ヤ俊鎭�
		if(checkpoliceman()){
			if(checkU(true,"")){
				from = "inform";
				informpage=getParaToInt(0);
				System.out.println(getPara(1));
				setAttr("criminal",Criminals.me.findById(getPara(1)));
				setAttr("informPage", Inform.me.paginate(getParaToInt(0), 10,"select * from inform where criminal='"+getPara(1)+"'"));
				this.render("informbycriminal.jsp");				
			}
		}
	}
	public void search(){
		//鎼滅储閫氱級鐘�
		if(checkpoliceman()){
			this.render("search.jsp");
		}
	}
	static int searchpage=1;
	static String id,name,sex,
	lheight,hheight,
	lweight,hweight;
	public void dosearch(){
		//鎵ц鎼滅储
		if(checkU(true,"lheight")){
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
		//鐢ㄤ簬鎼滅储缁撴灉鍒嗛〉鐨勮繛缁��
		if(checkU(true,"")){
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
