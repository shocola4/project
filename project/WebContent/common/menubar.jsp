<%@ page contentType="text/html;charset=euc_kr"  %>
<%  
	String pid = (String) session.getAttribute("pid"); 
%>

<script language="JavaScript">
<!--
function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>

<BODY>
<div align="center" style="height: 80px;">
<table width=1000  border=0 cellspacing=0 cellpadding=0 height=50>
<tbody valign="top" align="left" bgcolor="#eeeeee">
  <tr valign="top" align="right" height="19">
 
    <td width=95 height=24><a href="../main/index.jsp" onMouseOver="document.images[1].src='../img/bar_11.gif';" onMouseOut="document.images[1].src='../img/bar_1.gif';"><img src="../img/bar_1.gif" width=95 height=24></a></td>

	<td width=95 height=24><a href="../service/company_intro.jsp" onMouseOver="document.images[2].src='../img/bar_22.gif';;MM_showHideLayers('shop','','hide','member','','hide','qna','','hide')" onMouseOut="document.images[2].src='../img/bar_2.gif';">
   <img src="../img/bar_2.gif" width=95 height=24></a></td>

    <td width=95 height=24 border=0><a src="../img/bar_3.gif"   onMouseOver="document.images[3].src='../img/bar_33.gif';MM_showHideLayers('shop','','show','member','','hide','qna','','hide')" onMouseOut="document.images[3].src='../img/bar_3.gif';"><img name="Image1" border=2 src="../img/bar_3.gif" width=95 height=24></a></td>

   <td width=95 height=24><a href="../product/basket_view.jsp?user_id=<%=pid %>" onMouseOver="document.images[4].src='../img/bar_44.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','hide')" onMouseOut="document.images[4].src='../img/bar_4.gif';"><img src="../img/bar_4.gif" width=95 height=24></a></td>
   
   <td width=95 height=24><a src="../img/bar_5.gif" onMouseOver="document.images[5].src='../img/bar_55.gif';MM_showHideLayers('shop','','hide','member','','show','qna','','hide')" onMouseOut="document.images[5].src='../img/bar_5.gif';"><img name="Image2"  border=2  src="../img/bar_5.gif" width=95 height=24></a></td>  
 
 	<td width=95 height=24><a href="../member/user.jsp" onMouseOver="document.images[6].src='../img/bar_66.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','hide');" onMouseOut="document.images[6].src='../img/bar_6.gif';">
   <img src="../img/bar_6.gif" width=95 height=24></a></td>

	<td width=95 height=24><a src="../img/bar_7.gif"  onMouseOver="document.images[7].src='../img/bar_77.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','show')" onMouseOut="document.images[7].src='../img/bar_7.gif';"><img name="Image3"  border=2   src="../img/bar_7.gif" width=95 height=24></a></td>

	<td width=30 height=24 border=0></td>




</tbody>
</table>

<div id="shop" style="position:absolute; left:500px; middle:100px; width:201px; height:20px; z-index:100; visibility: hidden" class="layerstyle"> 
  <table width=250 border=0 cellspacing=0 cellpadding=0 height=20>    
	<tr> 
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center> &nbsp;<span class="layerstyle"><a href="../shoppingmall/gongi.jsp">��������</a></span> </div>
      </td>
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center><span class="layerstyle"><a href="../shoppingmall/newproduct.jsp">�Ż�ǰ �ڳ�</a></span> </div>
      </td>
      <td width=100 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center><span class="layerstyle"><a href="../shoppingmall/pc_calculation.jsp">���� PC ����</a></span> </div>
      </td>
    </tr>
  </table>
</div>

<div id="member" style="position:absolute; left:820px; middle:99px; width:160px; height:20px; z-index:100; visibility: hidden"> 
  <table width=180 border=0 cellspacing=1 cellpadding=0 height=20>
    <tr> 
      <td width=100 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../member/modify.jsp?user_id=<%= pid %>">ȸ����������</a></div>
      </td>
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../member/user_delete.jsp?user_id=<%= pid %>">ȸ�� Ż��</a></div>
      </td>
    </tr>
  </table>
</div>

<div id="qna" style="position:absolute; left:1100px; midle:99px; width:100px; height:20px; z-index:100; visibility: hidden"> 
  <table width=170 border=0 cellspacing=1 cellpadding=0 height=20>
    <tr bgcolor="#EAEAEA">        
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
	<div align=center><span class="layerstyle"><a href="../board/board_list.jsp">�����Խ���</a></span> </div>
      </td>
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../service/inform_01.jsp">F A Q</a></div>
      </td>
    </tr>
   
  </table>
</div>



    <td width=1000 height=50 valign=middle bgcolor=#ffffff >
          <tr> 
             <form name="search_form" action="../common/search_view.jsp" method=post>
	         <td height="50" width="500" align="center" style="padding-top: 4px;">  
                  <input type="text" name="srch_word" size="25" style="width:700px;height: 40.98438px;">
                   <input type="image" border=0 src="../img/s.gif"></td>
             </form>

      
 
