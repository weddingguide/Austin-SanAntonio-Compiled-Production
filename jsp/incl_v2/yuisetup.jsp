
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/cookie/cookie-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/swf/swf-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/swfstore/swfstore-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/storage/storage-min.js"></script>
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/editor/simpleeditor-min.js"></script>
<script>

( function()
  {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event
        bodyEditor = null;
        footerEditor = null;

    var myConfig = {
        height: '300px',
        width: '700px',
        dompath: true,
        focusAtStart: true,
        handleSubmit: true,
        toolbar:  {
                      collapse: true,
                      titlebar: '',
                      draggable: false,
                      buttons: [
                          { group: 'fontstyle', label: 'Font Name and Size',
                              buttons: [
                                  { type: 'select', label: 'Arial', value: 'fontname', disabled: true,
                                      menu: [
                                          { text: 'Arial', checked: true },
                                          { text: 'Arial Black' },
                                          { text: 'Comic Sans MS' },
                                          { text: 'Courier New' },
                                          { text: 'Lucida Console' },
                                          { text: 'Tahoma' },
                                          { text: 'Times New Roman' },
                                          { text: 'Trebuchet MS' },
                                          { text: 'Verdana' }
                                      ]
                                  },
                                  { type: 'spin', label: '13', value: 'fontsize', range: [ 9, 75 ], disabled: true }
                              ]
                          },
                          { type: 'separator' },
                          { group: 'textstyle', label: 'Font Style',
                              buttons: [
                                  { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
                                  { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
                                  { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
                                  { type: 'separator' },
                                  { type: 'color', label: 'Font Color', value: 'forecolor', disabled: true },
                                  { type: 'color', label: 'Background Color', value: 'backcolor', disabled: true }
                              ]
                          },
                          { type: 'separator' },
                          { group: 'indentlist', label: 'Lists',
                              buttons: [
                                  { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' },
                                  { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' }
                              ]
                          },
                          { type: 'separator' },
                          { group: 'insertitem', label: 'Insert Item',
                              buttons: [
                                  { type: 'push', label: 'HTML Link CTRL + SHIFT + L', value: 'createlink', disabled: true },
                                  { type: 'push', label: 'Insert Image', value: 'insertimage' }
                              ]
                          }
                      ]
                 }
    };


    Event.onDOMReady(
                      function()
                      {
                         bodyEditor = new YAHOO.widget.SimpleEditor('bodyEntry', myConfig);
                         bodyEditor.render();

                         footerEditor = new YAHOO.widget.SimpleEditor('footerEntry', myConfig);
                         footerEditor.render();

                         var ctr = 0,
                             storageEngine;

                         YAHOO.util.StorageEngineSWF.SWFURL = '/swfstore.swf';

                         try
                         {
                           storageEngine = YAHOO.util.StorageManager.get(
                             YAHOO.util.StorageEngineGears.ENGINE_NAME,
                             YAHOO.util.StorageManager.LOCATION_LOCAL,
                             {
                               order: [
                                 YAHOO.util.StorageEngineGears,
                                 YAHOO.util.StorageEngineSWF,
                                 YAHOO.util.StorageEngineHTML5
                                 ],
                               force: false
                             }
                            );
                         } catch(e)
                         {
                             YAHOO.log("No supported storage mechanism present.");
                             storageEngine = false;
                         }

                         if(storageEngine)
                         {
                           storageEngine.subscribe(storageEngine.CE_READY, function(e)
                           {
                              if(storageEngine.hasKey("<%=bodyTextId%>"))
                              {
                                Dom.get("bodyEntry").value = storageEngine.getItem("<%=bodyTextId%>");
                              }

                               bodyEditor.on("editorKeyPress", function(e)
                               {
                                  ctr++;

                                  if(!(ctr%5))
                                  { //on every fifth keystroke, autosave the contents
                                    bodyEditor.saveHTML();
                                    storageEngine.setItem("<%=bodyTextId%>", Dom.get("bodyEntry").value);
                                    document.getElementById("autosave1").innerHTML = "last saved at " + (new Date).toString();
                                  }
                                }
                             );

                              if(storageEngine.hasKey("<%=footerTextId%>"))
                              {
                                Dom.get("footerEntry").value = storageEngine.getItem("<%=footerTextId%>");
                              }

                               footerEditor.on("editorKeyPress", function(e)
                               {
                                  ctr++;

                                  if(!(ctr%5))
                                  { //on every fifth keystroke, autosave the contents
                                    footerEditor.saveHTML();
                                    storageEngine.setItem("<%=footerTextId%>", Dom.get("footerEntry").value);
                                    document.getElementById("autosave2").innerHTML = "last saved at " + (new Date).toString();
                                  }
                               }
                             );
                             Event.addListener( "cancel", "click", function( e )
                                                                 {
                                                                    storageEngine.clear();
                                                                 }
                                              );
                             Event.addListener( "cleardraft", "click", function( e )
                                                                 {
                                                                    storageEngine.clear();
                                                                 }
                                              );
                             Event.addListener( "save", "click", function( e )
                                                                 {
                                                                    storageEngine.clear();
                                                                 }
                                              );

                           });
                         }
                     }
                   ); //end onDomReady
   } // end function()
)
();
</script>

