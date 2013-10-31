
(function($,Edge,compId){var Composition=Edge.Composition,Symbol=Edge.Symbol;
//Edge symbol: 'stage'
(function(symbolName){Symbol.bindElementAction(compId,symbolName,"${_Stage}","click",function(sym,e){var mug=sym.getSymbol("Mug");if(sym.getVariable('playing'))
return;if(sym.getVariable("empty")){sym.setVariable("empty",false);mug.play('Full');sym.play('Serve');sym.setVariable('playing',true);sym.getSymbol("Call").stop();sym.getSymbol("Call").play('Stop');var amount=sym.getVariable("Amount");if(amount>=5){sym.getSymbol("Call").$("Okawari").html('O WA KA RI!!!');}
else{sym.getSymbol("Call").$("Okawari").html('O KA WA RI!!!');}}
else{sym.setVariable("empty",true);mug.play('Drink');sym.play('Return');sym.setVariable('playing',true);}});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",1000,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTimelineAction(compId,symbolName,"Default Timeline","stop",function(sym,e){sym.setVariable('playing',false);});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"document","compositionReady",function(sym,e){var width=$('body').width();console.log(width);if(width<550){$('body').css({zoom:width/550.0*100+'%'});}
sym.setVariable("Amount",0);sym.play();sym.setVariable("playing",true);});
//Edge binding end
Symbol.bindTimelineAction(compId,symbolName,"Default Timeline","complete",function(sym,e){var amountText=sym.$("Amount");var amount=sym.getVariable("Amount")+1;sym.setVariable("Amount",amount);amountText.html(amount);sym.getSymbol("Call").play('Start');function setBlur(elem,px){var blur="blur("+px+"px)";elem.css({'-webkit-filter':blur});elem.css({'-moz-filter':blur});elem.css({'-o-filter':blur});elem.css({'-ms-filter':blur});elem.css({'filter':blur});}
setBlur(sym.$("Stage"),amount/10.0);setBlur(sym.$("Okawari"),amount/2.0);});
//Edge binding end
Symbol.bindSymbolAction(compId,symbolName,"creationComplete",function(sym,e){});
//Edge binding end
})("stage");
//Edge symbol end:'stage'

//=========================================================

//Edge symbol: 'Hiball'
(function(symbolName){Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",985,function(sym,e){sym.stop();});
//Edge binding end
})("MugAndHiball");
//Edge symbol end:'MugAndHiball'

//=========================================================

//Edge symbol: 'Hiball'
(function(symbolName){Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",0,function(sym,e){var hiball=sym.$("elem");function createBubble(){var mySymbolObject=sym.createChildSymbol("Bubble",hiball);var bubble=mySymbolObject.getSymbolElement();$(bubble).css({top:80-Math.random()*20,left:Math.random()*$(hiball).width()*0.8});var complete=function complete(){mySymbolObject.deleteSymbol();createBubble();}
mySymbolObject._getTimeline('Default Timeline').addObserver({complete:complete});}
for(var i=0;i<10;i++){setTimeout(createBubble,i*100);}});
//Edge binding end
})("Hiball");
//Edge symbol end:'Hiball'

//=========================================================

//Edge symbol: 'Bubble'
(function(symbolName){})("Bubble");
//Edge symbol end:'Bubble'

//=========================================================

//Edge symbol: 'Okawari'
(function(symbolName){Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",750,function(sym,e){sym.stop();});
//Edge binding end
})("Okawari");
//Edge symbol end:'Okawari'
})(jQuery,AdobeEdge,"hiball");