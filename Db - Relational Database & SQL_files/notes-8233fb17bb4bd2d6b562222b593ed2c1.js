var RevealNotes=function(){function e(){function e(){var e,t,d,i=Reveal.getCurrentSlide(),a=Reveal.getIndices(),o=i.querySelector("aside.notes");i.nextElementSibling&&"SECTION"==i.parentNode.nodeName?(t=a.h,d=a.v+1):(t=a.h+1,d=0),e={notes:o?o.innerHTML:"",indexh:a.h,indexv:a.v,indexf:a.f,nextindexh:t,nextindexv:d,markdown:o?"string"==typeof o.getAttribute("data-markdown"):!1},n.postMessage(JSON.stringify(e),"*")}var n=window.open("/notes","reveal.js - Notes","width=1120,height=850");Reveal.addEventListener("slidechanged",e),Reveal.addEventListener("fragmentshown",e),Reveal.addEventListener("fragmenthidden",e),n.addEventListener("load",function(){e()},!1)}return null!==window.location.search.match(/(\?|\&)notes/gi)&&e(),document.addEventListener("keydown",function(n){null!==document.querySelector(":focus")||n.shiftKey||n.altKey||n.ctrlKey||n.metaKey||83===n.keyCode&&(n.preventDefault(),e())},!1),{open:e}}();