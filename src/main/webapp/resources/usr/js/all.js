//lesson tab
function AddEvent(element, name, func)
{
	if (element.addEventListener) {
		element.addEventListener(name, func, false);
	}
	else if (element.attachEvent) {
		element.attachEvent('on' + name, func);
	}
}
var doc = document;
var UI = {};
UI.$=function(s) { return doc.getElementById(s) };


UI.Event = function(t) {
	this.id = t.id;
	this.className = t.className;
	
	if(this.id) {
		this.id.onclick = this.open(this);
	}
}
UI.Event.prototype = {
	open: function(e) {
		var wrap = document.getElementById("dummyWrap"),
		resourceId = this.id,
		resource = document.getElementById(resourceId),
		ul = resource.parentNode.parentNode,
		a = ul.getElementsByTagName("a"),
		len = a.length;
		for (var i = len; i--;) {
			(resourceId !== a[i].id)
			? a[i].className = ""
			: a[i].className = "fontBold";
		}

		wrap.innerHTML = document.getElementById(resourceId + "_cont").innerHTML;
	}
};

Tab = function(idSet,eType,onCss,defIdx,addLinkUrl) {
	this.cnt = idSet.length;
	this.eType = eType;
	this.onCss = onCss;
	this.tab = [];
	this.tabbody = [];
	for(var i=0;i<this.cnt;++i)
	{
		var tab = document.getElementById(idSet[i][0]);
		var tabbody = document.getElementById(idSet[i][1]);
		tab.oldCss = tab.className;
		tabbody.oldCss = tabbody.className;
		this.tab.push(tab);
		this.tabbody.push(tabbody);
		if(addLinkUrl && addLinkUrl[i])tab.onclick = this.addLink.bind(this,i,addLinkUrl[i]); //ie에서는 대입법으로 한게 가장 먼저 실행됨, ff에서는 순서대로 실행됨.
		AddEvent(tab,eType,this.on.bind(this,i));
	}
	(defIdx) ? this.on(defIdx-1) : this.on(0);
}
Tab.prototype = {
	on:function(n) {
		if(this.curIdx == n) return;
		for (var i = 0; i < this.cnt; ++i) {
			if (i == n) {
				this.tab[i].className = (this.tab[i].oldCss) ? this.tab[i].oldCss + " " + this.onCss : this.onCss;
				this.tabbody[i].className = (this.tabbody[i].oldCss) ? this.tabbody[i].oldCss + " " + this.onCss : this.onCss
			}
			else {
				this.tab[i].className = this.tab[i].oldCss;
				this.tabbody[i].className = this.tabbody[i].oldCss;
			}
		}
		this.curIdx = n;
	},
	addLink:function(n,url) {
		if(this.curIdx == n) GoPage(url);
	}
}
//showHide layer
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}