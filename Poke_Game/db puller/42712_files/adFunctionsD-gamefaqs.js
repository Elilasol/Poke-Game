
function CbsiMantaRay(){var AD=this;var E="$Id: MantaRayNew.js 148932 2011-07-19 15:12:34Z harpere $";var y="4.5.4";var u;var Y;var AG=2000;var C="&";var AL=false;var AU=new Array();var V=new Object();var d=[];var f;var AF=2000;var AA=1;var S=1;var O=1;switch(parseInt("19")){case 175:case 177:case 178:case 189:S=0;break}var AB={};var X;var N;var t={CAT:"NCAT"};var W=0*1000;switch(parseInt("19")){case 175:W=5*1000;break}var c=W;var r=[];var D=null;var F="";var H=function(){var AV=document.getElementsByTagName("script");var AW=AV[AV.length-1].src;if(AW.match("^http(s)?://[^:]+:(\\d+)")){return RegExp.$2}return""};var AN=H();this.registerAdGlobals=function(AV){if(AV){AB=AV;o(AV)}};var AJ=function(){return(AL==true)};var o=function(AV){if("NO".toLowerCase()=="yes"){AL=true}else{for(var AW in AV){if(!AV.hasOwnProperty(AW)){continue}if(AW.toLowerCase()=="partner"&&AV[AW]){AL=true}}}};var AM=function(){if(AJ()){return"com.com"}var AV=document.domain.split(".").reverse();var AW=AV[1]+"."+AV[0];return AW};var AT=AM();var m=function(){var AV="unk";if(navigator.userLanguage){AV=navigator.userLanguage}else{if(navigator.language){AV=navigator.language}}return AV};var K=function(AV){var AX=n;var AY=k;var AW=parseInt(AV.SITE);if("live"=="qa1"){switch(AW){case 23:AC(AV,AX(AW));AC(AV,AY());break;default:}}else{switch(AW){case 90:AC(AV,AX(AW));break;case 103:AC(AV,AX(AW));break;case 162:AC(AV,AX(AW));break;case 189:AC(AV,AY());break;case 190:AC(AV,AY());break;default:}}switch(AW){case 175:break;default:AC(AV,L())}};var n=function(AW){if(X){return X}var AX=AO("MAD_SESSION");if(!AX){var AV=["a","b","c","d","e","f"];if("live"=="qa1"){switch(AW){case 23:AV=["a","b"];break}}AX=AV[Math.floor(Math.random()*AV.length)];document.cookie=("MAD_SESSION="+AX+";domain="+AT+";path=/")}X={DVAR_SESSION:AX};return X};var L=function(){if(window.cbsiMadsCookiesOn){return window.cbsiMadsCookiesOn}var AW=AO("MADTEST");if(AW=="1"){window.cbsiMadsCookiesOn={cookiesOn:"1"}}else{var AV=86400000;AH("MADTEST","1",AV);var AW=AO("MADTEST");if(AW=="1"){window.cbsiMadsCookiesOn={cookiesOn:"1"}}else{window.cbsiMadsCookiesOn={cookiesOn:"0"}}}if(AI()){alert("cookiesOn="+window.cbsiMadsCookiesOn.cookiesOn)}return window.cbsiMadsCookiesOn};function k(){if(N){return N}var AV=AO("MAD_FIRSTPAGE");if(AV==null){AV=1;document.cookie=("MAD_FIRSTPAGE="+AV+";domain="+AT+";path=/")}else{if(AV==1){AV=0;document.cookie=("MAD_FIRSTPAGE="+AV+";domain="+AT+";path=/")}}N={DVAR_FIRSTPAGE:AV};return N}this.setWaitTime=function(AV){c=AV*1000};this.storePageState=function(){V.STATICPAGESTATE=window.CBSI_PAGESTATE;V.USE_STATICPAGESTATE=1};this.setMacProxy=function(AV){};function AI(){return location.hash=="#mad_debug"}function A(){return location.hash=="#mad_stage"}var a=window.console;var M=function(AV){if(AI()){if(!a||typeof a.log!="function"){a=new U()}a.log(AV)}};var U=function(){var AV=document.getElementsByTagName("body")[0];if(!AV){return null}var AW=document.createElement("div");AW.setAttribute("id","mad_console");if(AW.style.setAttribute){AW.style.setAttribute("cssText","border:solid 2px #ff0000; background:#FFFFFF; color:#000000; padding:4px; width:600px; height:300px; overflow:auto;")}else{AW.setAttribute("style","border:solid 2px #ff0000; background:#FFFFFF; color:#000000; padding:4px; width:600px; height:300px; overflow:auto;")}AV.appendChild(AW);this.log=function(AX){AW.innerHTML=AW.innerHTML+"<hr>"+AX}};var AO=function(AX){var AY=null;var AW=document.cookie;var Aa=AW.indexOf(AX);if(Aa!=-1){var AZ=Aa+AX.length+1;var AV=AW.indexOf(";",AZ);if(AV==-1){AV=AW.length}AY=AW.substring(AZ,AV)}return AY?AY:null};function AH(Aj,AY,AZ,Aa,Ai){if(Aa){Aa=Aa.replace(/^\./,"");var Ah=Aa.split(".").reverse();var AX=document.domain.split(".").reverse();var Ae=true;for(var Ac=0;Ac<Ah.length;Ac++){if(Ah[Ac].toLowerCase()!=AX[Ac].toLowerCase()){Ae=false;break}}if(!Ae){var AW="http://mads."+Aa;if(AN){AW+=":"+AN}if(AY===""){AY="|";AZ=-300000}AW+="/sc?c="+Aj+":"+AY+":."+Aa;if(Ai=="/"){Ai=""}if(AZ||Ai||parseInt(AZ)===0){var Ag="";if(AZ||parseInt(AZ)===0){Ag=AZ/60000}AW+=":"+Ag;if(Ai){AW+=":"+Ai}}var Ab=document.createElement("img");Ab.setAttribute("src",AW);return }}else{var Ad=document.domain.split(".");Aa=Ad[Ad.length-2]+"."+Ad[Ad.length-1]}var AV=new Array(Aj+"="+AY,"domain=."+Aa);if(AZ||parseInt(AZ)===0){var Af=new Date(new Date().getTime()+AZ);AV.push("expires="+Af.toGMTString())}if(!Ai){Ai="/"}AV.push("path="+Ai);document.cookie=AV.join(";");if(AI()){alert("Final Cookie string: '"+AV.join(";")+"'")}}var AC=function(AX,AV){if(AX&&AV){for(var AW in AV){if(AV.hasOwnProperty(AW)){AX[AW]=AV[AW]}}}};function g(AW){var AX=(AW.getMonth()+1)+"";if(1==AX.length){AX="0"+AX}var AV=AW.getDate()+"";if(1==AV.length){AV="0"+AV}return AX+AV}function b(AV,AY){M("jsAppend: appending file: "+AV+(AY?(", id: "+AY):""));var AW=document.getElementsByTagName("head")[0];var AX=document.createElement("script");AX.setAttribute("language","javascript");AX.setAttribute("type","text/javascript");AX.setAttribute("src",AV);AX.setAttribute("async","async");if(AY){AX.setAttribute("id",AY)}AW.appendChild(AX);return AX}function z(AW){var AV=document.getElementById(AW);if(AV){M("removeElementById: removing "+AW);AV.parentNode.removeChild(AV)}else{M("removeElementById: no element "+AW)}}function J(AX){if(AI()){alert("Appending image: "+AX)}var AW=document.getElementsByTagName("body")[0];var AV=document.createElement("img");AV.setAttribute("src",AX);AV.setAttribute("width","1");AV.setAttribute("height","1");AV.setAttribute("border","0");return AV}this.setupAdDiv=function(AV,AW){var AX=document.getElementById(AV);if(!AX){document.write("<div id='"+AV+"'></div>");AX=document.getElementById(AV)}AX.metaAdObj=new Object();if(AW){AX.localAdObj=AW;if(AW.WIDTH){AX.style.width=parseInt(AW.WIDTH)+"px"}if(AW.HEIGHT){AX.style.height=parseInt(AW.HEIGHT)+"px"}if(AW.REFRESH){AX.metaAdObj.refreshable=parseInt(AW.REFRESH)}else{AX.metaAdObj.refreshable=0}}AX.ClearAd=w;AX.metaAdObj.isLoaded=0;AU[AV]=AX};this.getDeferredAds=function(AV,AW){M("getDeferredAds: queueing up deferred ad request");if(!F){M("getDeferredAds: ERROR: Local file for friendly iframe not yet defined.  Set file location via setDeferredLocalPage(file_loc)")}else{d.push([AV,AW]);Z()}};var Z=function(){M("makeDeferredAdRequest: getting deferred ads ");if(d.length==0){M("makeDeferredAdRequest: no request args in the queue");return }if(!f){f=new p()}if(f.readyState!=f.READY){if(f.getAge()<AF){M("makeDeferredAdRequest: request "+f.requestId+" is running, waiting 200 milliseconds");setTimeout(Z,200);return }if(f.readyState==f.PROCESSING&&f.getProcessingTime()<50){M("makeDeferredAdRequest: request "+f.requestId+" is processing, waiting 50 milliseconds");setTimeout(Z,50);return }M("makeDeferredAdRequest: request has taken too long ("+f.getAge()+" millis), aborting request");f.abort()}f.reserve();var AX=d.shift();var AV=AX[0];var AY=AX[1];if(AY){f.setCallbacks(AY)}if(AV&&AV.constructor.toString().indexOf("Array")==-1){M("ERROR: first argument to cbsiGetDeferredAds() must be null or an Array");return }var AW=AD.getAdCallURL("jph",null,null,null,AV);if(!AW){M("makeDeferredAdRequest: no adCall, aborting request");f.abort();return }f.makeRequest(AW)};var p=function(){var Af=this;this.READY=0;this.RESERVED=1;this.SENT=2;this.PROCESSING=3;this.readyState=Af.READY;this.requestId=1;var AZ;var Ab;var Ad=[];var Aa={};var AW=null;var AX={};var AV=[];var Ac={};this.getAge=function(){if(!AZ){return 0}return new Date().getTime()-AZ};this.getProcessingTime=function(){if(!Ab){return 0}return new Date().getTime()-Ab};this.reserve=function(){M("reserve: reserving: "+Af.requestId);if(Af.readyState!=Af.READY){M('ERROR: cannot reserve unless JSONPRequest is "READY"');return }Af.readyState=Af.RESERVED;AZ=new Date().getTime();Aa[Af.requestId]=[];AX[Af.requestId]=[];Ac[Af.requestId]=[]};this.setProcessing=function(){M("setProcessing: setting to processing");if(Af.readyState!=Af.SENT){M('ERROR: cannot set to "PROCESSING" unless JSONPRequest is "SENT"');return }Af.readyState=Af.PROCESSING;Ab=new Date().getTime()};this.setCallbacks=function(Ag){M("setCallbacks: setting callbacks for req "+Af.requestId);if(Af.readyState!=Af.RESERVED){M('ERROR: cannot set callbacks unless JSONPRequest is "RESERVED"');return }if(typeof Ag=="object"){AW=Ag.onembed;AX[Af.requestId]=Ag.onload}};this.trackDiv=function(Ag){M("trackDiv: div: "+Ag);if(Af.readyState!=Af.RESERVED){M('ERROR: cannot add divIds unless JSONPRequest is "RESERVED"');return }Aa[Af.requestId].push(Ag);Ad.push(Ag)};this.trackDivProcessed=function(Ag,Ai){M("trackDivProcessed: processed "+Ag);if(!Ag){M("trackDivProcessed: no divId found");return }if(Af.readyState!=Af.PROCESSING){M('ERROR: cannot track processed divs unless JSONPRequest is "PROCESSING"');return }if(Ai){AV.push(Ai)}for(var Ah=0;Ah<Ad.length;Ah++){if(Ad[Ah]===Ag){Ad.splice(Ah,1);break}}if(Ad.length==0){if(typeof AW=="function"){M("trackDivProcessed: calling request 'onembed' callback");AW(AV)}Ae()}};this.trackDivLoaded=function(Aj,Ag,Ai){M("trackDivLoaded: loaded: reqId: "+Aj+", divId: "+Ag);if(!Ag){M("trackDivLoaded: no divId found");return }if(Ai){Ac[Aj].push(Ai)}for(var Ah=0;Ah<Aa[Aj].length;Ah++){if(Aa[Aj][Ah]===Ag){Aa[Aj].splice(Ah,1);break}}if(Aa[Aj].length==0){if(typeof AX[Aj]=="function"){M("trackDivLoaded: calling request 'onload' callback");AX[Aj](Ac[Aj])}delete Aa[Aj];delete AX[Aj];delete Ac[Aj]}};this.makeRequest=function(Ag){M("makeRequest: making request to "+Ag);if(Af.readyState!=Af.RESERVED){M('ERROR: cannot make requests unless JSONPRequest is "RESERVED"');return }Af.readyState=Af.SENT;Ag=Ag.replace("GLOBAL","GLOBAL&REQID="+Af.requestId);b(Ag,"madJSONPReq"+Af.requestId)};this.abort=function(){if(Af.readyState==Af.READY){M('abort: request is "READY", nothing to abort');return }M("abort: aborting request "+Af.requestId);AY()};var Ae=function(){if(Af.readyState==Af.READY){M('close: request is "READY", nothing to close');return }M("close: closing request "+Af.requestId);AY()};var AY=function(){var Ag=Af.requestId++;AZ=null;Ab=null;Ad=[];AW=null;AV=[];Af.readyState=Af.READY;z("madJSONPReq"+Ag)}};this.parseAdResponse=function(AW){if(!AW||parseInt(AW.requestId)!==f.requestId){M("parseAdResponse: not current request. "+(AW?AW.requestId:"no jsonAdResponse")+" vs "+f.requestId);return }M("parseAdResponse: requestId = "+AW.requestId+", divId = "+AW.divId);if(f.readyState==f.SENT){f.setProcessing()}var AV=G(AW);f.trackDivProcessed(AW.divId,AV)};function G(AY){if(!AY||AY.divId==null){M("parseSingleAd: ERROR: no div: "+AY.divId);return }var AZ=document.getElementById(AY.divId);if(!AZ){M("parseSingleAd: ERROR: no div matching '"+AY.divId+"'");return }var AX={};if(AZ.localAdObj&&AZ.localAdObj.CALLBACK){AX=AZ.localAdObj.CALLBACK}var AV;var AW=document.createElement("div");AW.className="adHolder";if(AY.adHTML){AW.adHTML=AY.adHTML}else{AW.adHTML=""}AW.innerHTML="<iframe src='"+F+"' class='adFrame' marginwidth='0' marginheight='0' hspace='0' vspace='0' frameborder='0' scrolling='no' allowtransparency='true' background-color='transparent' height='0' width='0'></iframe>";AV={divId:AY.divId,segmentId:AY.segmentId,rotatorId:AY.rotatorId,creativeSizeId:AY.creativeSizeId,isBlank:AY.isBlank};AW.callbackObj=AV;if(typeof AX.onload=="function"){AW.callback=AX.onload}AW.reqId=f.requestId;AW.RMIFOnLoad=RMIFOnLoad;AZ.ClearAd();AZ.appendChild(AW);if(!AZ.metaAdObj){AZ.metaAdObj=new Object()}AZ.metaAdObj.reloadTimestamp=new Date();if(AY.seg_pageState!=null){AD.setSegPageState(AZ.id,AY.seg_pageState)}AZ.metaAdObj.isLoaded=1;AZ.metaAdObj.jsonAdObj=AY;if(typeof AX.onembed=="function"){M("parseSingleAd: calling single ad 'onembed' callback");AX.onembed(AV)}return AV}this.RMIFOnLoad=function(Aa,Ad){var AX=Aa.frameElement;var AV=AX.parentNode;var AW=AX.parentNode.parentNode;var AY=Ad.getElementById("adSpan");var Ab=Ad.getElementById("adDiv");var AZ;var Ac;if(AY){Ac=AY.offsetWidth;if(navigator.appName=="Microsoft Internet Explorer"){AZ=AY.offsetHeight}else{AZ=Ab.offsetHeight}AV.style.width="auto";AV.style.height="auto";AV.overrideAdObj=new Object()}else{AZ=Ab.offsetHeight;Ac=Ab.offsetWidth;AW.style.width="auto";AW.style.height="auto";AW.overrideAdObj=new Object()}if(AV.childNodes.length==1){AX.style.width=Ac+"px";AX.style.height=AZ+"px"}else{AX.style.width="0px";AX.style.height="0px"}if(typeof AV.callback=="function"){M("RMIFOnLoad: calling single ad 'onload' callback");AV.callback(AV.callbackObj)}f.trackDivLoaded(AV.reqId,AW.getAttribute("id"),AV.callbackObj)};function w(){this.style.width=this.offsetWidth+"px";this.style.height=this.offsetHeight+"px";x(this)}function x(AW){var AV=null;while(AW.childNodes.length>0){var AY=AW.childNodes[0];var AX=AY.id;if(AX=="adFrame"){AV=AY;AV.src="about:blank"}if(AX){AY.id=""}if(AY.childNodes.length>0){x(AY)}AW.removeChild(AY)}}this.prepareRefresh=function(AW,AV){var AX=document.getElementById(AW);if(!AX){M('prepareRefresh: could not find div with id "'+AW+'"');return }AX.overrideAdObj=AV};this.setDeferredLocalPage=function(AV){M("setDeferredLocalPage: file set to "+AV);if(AV){F=AV}};var AS=1;var T=function(){AS=1};this.getAsyncAd=function(AW,AV){document.write("<div id='"+AW+"' class='madison_async_ad'></div>");var AX=document.getElementById(AW);AX.localAdObj=AV;AX.overrideAdObj=new Object;AX.RMIFOnLoad=RMIFOnLoad;AX.ClearAd=w;AX.LoadAd=Q;AX.GetAdURL=R;if(F==""){if(AV.WIDTH){AX.style.width=AV.WIDTH+"px"}if(AV.HEIGHT){AX.style.height=AV.HEIGHT+"px"}}AX.LoadAd();AU[AU.length]=AX;return AX};function Q(){if(!this.localAdObj){return }var AV=new Object;AC(AV,AB);AC(AV,this.localAdObj);AC(AV,this.overrideAdObj);this.ClearAd();var AW=document.createElement("iframe");AW.id="adFrame";AW.style.width=0+"px";AW.style.height=0+"px";AW.allowTransparency="true";AW.width=0+"px";AW.height=0+"px";AW.marginWidth=0+"px";AW.marginHeight=0+"px";AW.frameBorder=0;AW.scrolling="no";if(F==""){if(!AV.WIDTH){AW.style.width="100px";AW.width="100px";this.style.width="100px"}else{AW.style.width=AV.WIDTH+"px";AW.width=AV.WIDTH+"px";this.style.width=AV.WIDTH+"px"}if(!AV.HEIGHT){AW.style.height="100px";AW.height="100px";this.style.height="100px"}else{AW.style.height=AV.HEIGHT+"px";AW.height=AV.HEIGHT+"px";this.style.height=AV.HEIGHT+"px"}}this.appendChild(AW);if(F==""){AW.src=this.GetAdURL()}else{AW.src=F}}function R(){var AV;if(F==""){AV=AD.getAdCallURL("ifc",this.localAdObj,this.overrideAdObj)}else{AV=AD.getAdCallURL("js",this.localAdObj,this.overrideAdObj)}return AV}this.LoadAds=function(){if(AS==1){e();q();setTimeout(AQ,100);AS=0;tmp=setTimeout(T,c)}};function q(){for(i=0;i<AU.length;i++){AU[i].ClearAd()}}var AQ=function(){for(i=0;i<AU.length;i++){AU[i].LoadAd()}};this.DivGetAdURL=function(AW){var AV=AW.frameElement;var AX=AV.parentNode;return AX.GetAdURL()};var e=function(){window.CBSI_PAGESTATE=""};this.storePageStateCookie=function(AW,AX,AV){if(!AW){AW="cbs.com"}if(!AX){AX="/pacific"}if(!AV){AV=300000}var AY=window.CBSI_PAGESTATE;if(!AY){AY=""}AH("MAD_PAGESTATE",encodeURIComponent(AY),AV,AW,AX)};this.getAdCallURL=function(Ac,AV,Aa,AZ,AX){var AW="";var Ae=new Object();var AY="";if(!AZ){AZ=AB}AC(Ae,AZ);if(AV!=null){AC(Ae,AV)}if(Aa!=null){AC(Ae,Aa)}AW+=s(Ac,Ae);if(Ac.toLowerCase()!="jph"){AW+=B(Ac,AZ);Ae=new Object();AC(Ae,AV);AC(Ae,Aa);AW+=AP(Ae)}else{AX=j(AX);AW+=B(Ac,AZ,"%3B",AX);if(!AX){for(var Ad in AU){if(AU.hasOwnProperty(Ad)){AY+=v(AU[Ad])}}}else{for(var Ab=0;Ab<AX.length;Ab++){if(AU[AX[Ab]]){AY+=v(AU[AX[Ab]])}}}if(AY==""){AW=null}else{AW+=AY}}if(AW&&AW.length>2000){AW=AW.match(/.{0,2000}\&/)}return AW};this.getAd=function(AW,AX){var AV=AD.getAdCallURL("js",AW,new Object(),AX);document.write("<script type='text/javascript' src='"+AV+"'><\/script>\n")};this.cnetGetAd=function(AV){AD.getAd(AV,new Object())};var s=function(AZ,Ad){if(!Ad){Ad=new Object();AC(Ad,AB)}o(Ad);var AX="";var Ab="mads.";var AV=AT;var AY="";if(AN.length>0){AY=":"+AN}if(A()||(Ad.STAGING=="1")){Ab="madstage.";AY=":8000"}else{if(Ad.AD_HOST){Ab=Ad.AD_HOST;AV="";AY=""}}var AW=AJ()?"cnet-ad":"mac-ad";var Aa=AO("MADMACHOST");var Ac=AO("MADMACPORT");if(Aa){if(Ac){AY=":"+Ac}else{AY=""}AX+="http://"+Aa+AY+"/"+AW+"?"}else{AX+="http://"+Ab+AV+AY+"/"+AW+"?"}return AX};this.setSegPageState=function(AV,AW){if(AU[AV]){if(!AU[AV].metaAdObj){AU[AV].metaAdObj=new Object()}AU[AV].metaAdObj.seg_pageState=AW}};this.getFullPageState=function(AW){var AX="&PAGESTATE=";if(V.USE_STATICPAGESTATE==1){if(V.STATICPAGESTATE){AX+=encodeURIComponent(V.STATICPAGESTATE)}}else{if(window.CBSI_PAGESTATE){AX+=encodeURIComponent(window.CBSI_PAGESTATE)}}if(!AW){}else{var Aa="";for(var AV in AU){if(!AU.hasOwnProperty(AV)){continue}var AZ=false;for(var AY=0;AY<AW.length;AY++){if(AW[AY]==AV){AZ=true;break}}if(!AZ&&AU[AV].metaAdObj.seg_pageState){Aa+=AU[AV].metaAdObj.seg_pageState+","}}if(Aa!=""){AX+="&COMB_PAGESTATE="+Aa}}return AX};var B=function(Am,Ag,AY,Aj){var AV="";if(!Ag){Ag=new Object();AC(Ag,AB)}K(Ag);Ag.DVAR_INSTLANG=m();var AW=AO("MADMACHOST");if(AW){var Al=AW.split(".").reverse();var Ab=Al[1]+"."+Al[0];if(Ab!=AT){var Ak=AO("MADHOST");if(Ak){Ag.MADHOST=Ak}var Ah=AO("MADPORT");if(Ah){Ag.MADPORT=Ah}var Ad=AO("MAD_STAGED_EXCLUSIVE");if(Ad){Ag.MAD_STAGED_EXCLUSIVE=Ad}}}if(AY){AV+="META&ADSEPARATOR="+AY+"&"}AV+="GLOBAL";AV+="&CLIENT:ID=SJS";AV+="&CELT="+Am;AV+=AD.getFullPageState(Aj);var AX=AO("XCLGFbrowser");if(AX){Ag["COOKIE:ANON_ID"]=AX}for(var AZ in Ag){if(!Ag.hasOwnProperty(AZ)){continue}var Ac=Ag[AZ];if(t[AZ]){AZ=t[AZ]}if(AZ!="STAGING"&&AZ!="AD_HOST"){AV+="&"+encodeURIComponent(AZ)+"="+encodeURIComponent(Ac)}}var Ae="";if(window.location.protocol.match(/https:/i)){Ae="&referer="+encodeURIComponent(window.location.href)}var Af="";if(document.referrer&&document.referrer.length>0){var An=document.referrer.replace(/^[^\/]+:\/\//,"");var Ao=An.replace(/[^\w\-\.].*$/,"");var Ai=Ao.match(/[^\.]+\.\w{2,4}$/);if(Ai){Af="&IREFER_HOST="+encodeURIComponent(Ai)}}var Aa=Math.floor(Math.random()*100000000);AV+="&x-cb="+Aa+Ae+Af;return AV};var AP=function(AX,AW){var Aa="&ADREQ";var AV=new Object;AC(AV,AX);AC(AV,AW);K(AV);for(var AZ in AV){if(!AV.hasOwnProperty(AZ)){continue}var AY=AV[AZ];if(t[AZ]){AZ=t[AZ]}if(AZ!="STAGING"&&AZ!="AD_HOST"&&AZ!="REFRESH"&&AZ!="CALLBACK"){Aa+="&"+encodeURIComponent(AZ)+"="+encodeURIComponent(AY)}}if(Aa=="&ADREQ"){Aa=""}return Aa};var v=function(AW){if(AE(AW)){f.trackDiv(AW.getAttribute("id"));var AV=AP(AW.localAdObj,AW.overrideAdObj);AV+="&divId="+AW.getAttribute("id");return AV}return""};var AE=function(AW){var AV=AW.metaAdObj;if(!AV){return false}return(!AV.reloadTimestamp||(AV.refreshable==1&&(new Date().getTime()-AV.reloadTimestamp.getTime()>=c))||(AV.refreshable==0&&AV.isLoaded==0))};var j=function(AW){var AV=new Array();if(!AW){for(var AX in AU){if(AU.hasOwnProperty(AX)&&AE(AU[AX])){AV.push(AX)}}}else{for(var AY=0;AY<AW.length;AY++){var AX=AW[AY];if(AU.hasOwnProperty(AX)&&AE(AU[AX])){AV.push(AX)}}}return AV};function h(){if(AI()){alert("In loadASI() function")}if(typeof rsinetsegs=="undefined"){var AV=b("http://js.revsci.net/gateway/gw.js?csid=K05540");AV.onload=AK;AV.onreadystatechange=function(){if(this.readyState==="loaded"||this.readyState==="complete"){AK()}}}}function AK(){var AV=AB;var AW;for(var AY in AV){if(!AV.hasOwnProperty(AY)){continue}var AX=AV[AY];AW=AY.toLowerCase();if(AW=="ncat"||AW=="site"||AW=="ptype"||AW=="context"||AW=="os"){K05540.DM_addEncToLoc(AW,AX)}}K05540.DM_tag()}function P(){if(AI()){alert("In loadBK() function")}var AV=b("http://www.bkrtx.com/js/bk-static.js");AV.onload=l;AV.onreadystatechange=function(){if(this.readyState==="loaded"||this.readyState==="complete"){l()}}}function l(){var AV=AB;var AZ;var Aa=0;var AW={23:3316,252:3317,11:3318,2:3319,139:3320,1:3321,7:3322,102:3323,9:3324,3:3325,105:3326,109:3327,4:3328,53:3329,162:3330,8:3331,164:3332,45:3334,103:3335,90:3336,101:3337,6:3338,19:3339,21:3340,50:3341,175:3344,177:3345,185:3346,189:3348};Aa=AW[AV.SITE]||2834;M("callBK: bkSiteId is: "+Aa);for(var Ac in AV){if(!AV.hasOwnProperty(Ac)){continue}var Ab=AV[Ac];AZ=Ac.toLowerCase();if(AZ in {ncat:1,site:1,ptype:1,gameid:1,mfg:1,cid:1,attr:1,carrier:1,os:1,dvar_tag:1,dvar_user_group:1}){if(AZ=="dvar_tag"||AZ=="dvar_user_group"){var AX=Ab.split(";");for(var AY=0;AY<AX.length;AY++){bk_addPageCtx(AZ,AX[AY].toLowerCase());M("callBK(): Adding hint: "+AZ+" value:"+AX[AY].toLowerCase())}}else{bk_addPageCtx(AZ,Ab);M("callBK(): Adding hint: "+AZ+" value:"+Ab)}}}bk_doCallbackTag(Aa,"cbsiPrepBK",false,true)}this.prepBK=function(AV){for(i=0;i<AV.campaigns.length;i++){var AW=parseInt(AV.campaigns[i].campaign);r.push(AW)}AR()};this.adBehavioralSetup=function(){if(AI()){alert("adBehavioralSetup() called.  LOAD_BEACON set to "+AA)}if(AA==1){I()}};function I(){if(AI()){alert("getAdBeacon() called")}if(!Y){Y=1;var Ab=1;var Ac=Math.floor(Math.random()*100+1);var AV=new Object();AC(AV,AB);var AZ=new Object();AZ.beacon="1";if(AI()){alert("RandomNum: "+Ac)}if(Ac<=Ab){var Aa="";Aa+="http://adlog.com.com";Aa+="/adlog/i/r=7807&sg=355140&h=cn&p=2&l=en_US";Aa+="&t=-1&x-rnd="+Math.floor(Math.random()*100000+1);Aa+="&o="+((AV.NCAT==null)?"1:":AV.NCAT);Aa+="&b="+((AV.BRAND==null)?"":AV.BRAND);Aa+="&site="+((AV.SITE==null)?"":AV.SITE);Aa+="&ptype="+((AV.PTYPE==null)?"":AV.PTYPE);Aa+="&pid="+((AV.PID==null)?"":AV.PID);Aa+="&cid="+((AV.CID==null)?"":AV.CID);if(AV.DVAR_MFG||AV.DVAR_SELECTTAG){var AW;if(AV.DVAR_MFG){AW="dvar_mfg="+AV.DVAR_MFG;if(AV.DVAR_SELECTTAG){AW+="#"}}if(AV.DVAR_SELECTTAG){AW+="dvar_selecttag="+AV.DVAR_SELECTTAG}Aa+="&dvar="+encodeURIComponent(encodeURIComponent(AW))}Aa+="/http://i.i.com.com/cnwk.1d/Ads/common/dotclear.gif";var AY=J(Aa)}var AX=AD.getAdCallURL("js",AZ);D=b(AX)}}this.getAdBehavioral=function(){if(AI()){alert("getAdBehavioral() called.  LOAD_ASI="+S+" and LOAD_BK="+O)}if(S==1){h()}if(O==1){P()}};function AR(){if(AI()){alert("In updateMADUCATCookie() function")}if(!u){u=1;if(typeof r!="undefined"&&r.length>0){var AV=1;var AY=C;var AX=2592000000;var AW=new Date();var Aa=AV;Aa+=AY;Aa+=g(AW);for(var AZ=0;AZ<r.length;AZ++){Aa=Aa+C+"BK"+r[AZ]}if(AI()){alert("new cookie calculated: "+Aa)}AH("MADUCAT",Aa,AX)}else{if(AI()){alert("Results are empty.  Cookie unchanged.")}}}}this.clearAdState=function(){M("clearAdState: clearing ad state");if(f){f.abort()}d=[];window.CBSI_PAGESTATE="";STATIC_PAGSTATE_OBJ={};AB={};N=null;AU=[];c=W}}if(!window.cbsiMantaRay){window.cbsiMantaRay=new CbsiMantaRay();var cbsiGetAd=cbsiMantaRay.getAd;var cbsiRegisterAdGlobals=cbsiMantaRay.registerAdGlobals;var cbsiSetWaitTime=cbsiMantaRay.setWaitTime;var cbsiStorePageStateCookie=cbsiMantaRay.storePageStateCookie;var cbsiClearAdState=cbsiMantaRay.clearAdState;var cbsiGetDeferredAds=cbsiMantaRay.getDeferredAds;var cbsiSetupAdDiv=cbsiMantaRay.setupAdDiv;var cbsiPrepareRefresh=cbsiMantaRay.prepareRefresh;var RMIFOnLoad=cbsiMantaRay.RMIFOnLoad;var cbsiParseAdResponse=cbsiMantaRay.parseAdResponse;var cbsiSetDeferredLocalPage=cbsiMantaRay.setDeferredLocalPage;var cbsiAdBehavioral=cbsiMantaRay.getAdBehavioral;var cbsiAdBehavioralSetup=cbsiMantaRay.adBehavioralSetup;var cbsiPrepBK=cbsiMantaRay.prepBK;var cnetGetAd=cbsiMantaRay.cnetGetAd;var cbsiSetMacProxy=cbsiMantaRay.setMacProxy;var cbsiStorePageState=cbsiMantaRay.storePageState;var cbsiSetAdvancedAsync=cbsiMantaRay.setDeferredLocalPage;var cbsiGetAsyncAd=cbsiMantaRay.getAsyncAd;var cbsiRefreshAds=cbsiMantaRay.LoadAds;var cbsiDivGetAdURL=cbsiMantaRay.DivGetAdURL};