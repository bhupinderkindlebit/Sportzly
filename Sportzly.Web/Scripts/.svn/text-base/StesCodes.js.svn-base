/*
StesCodes Signature Creator
Copyright (c) 2013  www.stescodes.com
You can use the script on you website for free but this comment part should not be removed.
version 6.0 (Feb 17,2013)
Authors: StesCodes(Navin leon)
*/
function stes(){var f={},j="http%3A%2F%2Fstescodes.com%2Fcheckupdate.aspx",j=decodeURIComponent(j),k=function(a,c,d){var b;a:{var e,g,h=document.cookie.split(";");for(b=0;b<h.length;b++)if(e=h[b].substr(0,h[b].indexOf("=")),g=h[b].substr(h[b].indexOf("=")+1),e=e.replace(/^\s+|\s+$/g,""),e==a){b=unescape(g);break a}b=void 0}g=e="";c&&(e="&userCallback="+c);"last"==d&&(g="&last=true");null==b||""==b||void 0==b?(a=j+"?parameter="+a+e+g+"&formaturl="+window.location+"&signature="+a+"&callback=StesCodes.load",
c=document.createElement("script"),c.setAttribute("src",a),document.getElementsByTagName("head")[0].appendChild(c)):f[a]=b};return{getSignatureKey:function(a){a=a?f[a]:f;return a},init:function(a,c){if("string"==typeof a)k(a,c,"last");else if("object"==typeof a){var d=a.length;if(d)for(var b=0;b<d;b++)k(a[b],c,b+1==d?"last":"no");else return"Invalid parameter"}else return"Invalid parameter"},load:function(a){if(null==a.error){f[a.params]=a.signature;var c=a.params,d=f[a.params],b=new Date;b.setTime(b.getTime()+
864E5);b="; expires="+b.toGMTString();document.cookie=c+"="+d+b+"; path=/";"true"==a.last&&window.setTimeout(a.callback+"("+JSON.stringify(f)+")",1)}},removeCred:function(a){document.cookie=a+"=; expires=Thu, 01-Jan-70 00:00:01 GMT;"}}}var StesCodes=new stes;
