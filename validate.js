 document.write("<script language=vbs src='warn.vbs'></script>");
 function blockkey(tgt) {
 if(event.keyCode<48||event.keyCode>57)
 return false;
 else return true;
 }

 function trim(field){
 while(''+field.value.charAt(0)==' ') 
 field.value=field.value.substring(1);
 }

 function validate(frm){
 iput=document.all.tags("INPUT");
 for(i=0;i<iput.length;i++) { 
             trim(iput[i]);
             if(iput[i].value=="") {
             vbwarn(iput[i].name.toUpperCase()+" value must be supplied");
             iput[i].focus();
             return false;} 
     } return true;
  }
	
  function checkPass(frm) {
 if(validate(frm)) {
        if(frm.confirm.value!=frm.pass.value) {
        vbwarn("Confirm Password Not matched with Original password");
        frm.confirm.focus();
        return false;}
        else  return true;
    } else return false;
 } 
/* document.oncontextmenu=function() {
 if(event.srcElement.tagName=="BODY") {location='view-source:'+location;return false}
 else return false;}*/
 document.onselectstart=function() {
 if(event.srcElement.tagName=="INPUT") return true;
 else return false;}
 onload=function() {
 var box=document.all.tags("INPUT");
 var butt=document.all.tags("BUTTON");
 for(j=0;j<butt.length;j++) {
 butt[j].onmouseover=function() { this.style.background='maroon'}
 butt[j].onmouseout=function() {this.style.background="steelblue"}
 }
 for(i=0;i<box.length;i++) {
 if(box[i].type=="button") {box[i].onfocus=function() {this.blur();}}
 box[i].onfocus=function() { this.style.background='papayawhip'}
 box[i].onblur=function() {this.style.background="whitesmoke"}
 }
 try {
 tcell=document.all.tags("TABLE")[0];
 for(t=0;t<tcell.rows.length;t++) {
 temp=tcell.rows[t].cells[0];
 temp.innerHTML+="&nbsp;:&nbsp;&nbsp;";
 temp.style.cssText="text-align:right";}
   }catch(e) {return true}
 }

document.writeln("<style>");
document.writeln(".skin0 {color:gray;position:absolute;width:165px;border-style:solid;border-color:steelblue;border-width:1px;background:honeydew;font-family:Verdana;line-height:20px;cursor:default;font-size:11px;z-index:100;visibility:hidden;font-weight:bold}");
document.writeln(".menuitems{padding-left:15px;padding-right:2px;padding-top:2px;padding-bottom:2px;}");
document.writeln("</style>");
document.writeln('<div id="ie5menu" class="skin0" onMouseover="highlightie5(event)" onMouseout="lowlightie5(event)" onClick="jumptoie5(event)" display:none>');
document.writeln('<div class="menuitems" url="about.htm">About APSFC</div>');
document.writeln('<div class="menuitems" url="http://harisearch.tripod.com/compose.htm?ghkishore@hotmail.com">Send Feed Back</div>');
document.write("</div>");

var display_url=0
var ie5=document.all&&document.getElementById
var ns6=document.getElementById&&!document.all
if (ie5||ns6)
var menuobj=document.getElementById("ie5menu")
function getSource() { location='view-source:'+window.location;}
function showmenuie5(e){
var rightedge=ie5? document.body.clientWidth-event.clientX : window.innerWidth-e.clientX
var bottomedge=ie5? document.body.clientHeight-event.clientY : window.innerHeight-e.clientY
if (rightedge<menuobj.offsetWidth)
menuobj.style.left=ie5? document.body.scrollLeft+event.clientX-menuobj.offsetWidth : window.pageXOffset+e.clientX-menuobj.offsetWidth
else menuobj.style.left=ie5? document.body.scrollLeft+event.clientX : window.pageXOffset+e.clientX
if (bottomedge<menuobj.offsetHeight)
menuobj.style.top=ie5? document.body.scrollTop+event.clientY-menuobj.offsetHeight : window.pageYOffset+e.clientY-menuobj.offsetHeight
else menuobj.style.top=ie5? document.body.scrollTop+event.clientY : window.pageYOffset+e.clientY
menuobj.style.visibility="visible"
if(ie5) menuobj.setCapture();
return false
}
function hidemenuie5(e){
menuobj.style.visibility="hidden"
if(ie5) menuobj.releaseCapture();
}

function highlightie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
firingobj.style.backgroundColor="lightslategray"
firingobj.style.color="white"
if (display_url==1)
window.status=event.srcElement.url
}
}
function lowlightie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode //up one node
firingobj.style.backgroundColor=""
firingobj.style.color="gray"
window.status=''
}
}
function jumptoie5(e){
var firingobj=ie5? event.srcElement : e.target
if (firingobj.className=="menuitems"||ns6&&firingobj.parentNode.className=="menuitems"){
if (ns6&&firingobj.parentNode.className=="menuitems") firingobj=firingobj.parentNode
if (firingobj.getAttribute("target"))
window.open(firingobj.getAttribute("url"),firingobj.getAttribute("target"))
else
parent.location=firingobj.getAttribute("url")
}
}
if (ie5||ns6){
menuobj.style.display=''
document.oncontextmenu=showmenuie5
document.onclick=hidemenuie5
document.onkeypress=function() {if(ie5 && event.keyCode==27) hidemenuie5();}
}
