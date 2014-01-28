<link type="text/css" rel="stylesheet" href="/css/printable.css" media="print" />
      <script type="text/javascript">
            
            $(document).ready(function(){
                
                var calc        =   new BridalCalc();
                
                calc.init();
                
                
            });
  
      </script>
<div style="display:none;">
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='Idea/Photo Gallery'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='Idea/Photo Gallery'">
			<x:set var="ideaGallery" select="string($planningTools/content)"/>
			<c:out value="${ideaGallery}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>
</div>
<div class="pt-info">
    <h1>Budget Calculator</h1>
    <div>
        <span>
            <a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back to Planning Tools</a>
        </span>
    </div>
</div>
<div class="container">
    <div class="row-fluid calc-header">
        <div class="span4">
            <div class="row-fluid">
                <div class="span7">
                    <label>Your Budget: </label><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Some helpful text will go here." data-trigger="hover click">?</a>
                </div>
                <div class="span5">
                    <label># of guests:</label>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span7">
                    <div class="input-prepend">
                        <span class="add-on pull-left">$</span>
                        <input id="budget" class="input-small pull-left" type="text" value="0.00">
                    </div>
                    <button class="go" id="go">Go</button>
                </div>
                <div class="span5">
                    <input id="guests" class="input-mini" type="number" value="0">
                </div>
            </div>
            

        </div>
        <div class="span5">
            <div class="row-fluid">
                <div class="span12"></div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                     <button id="print" class="print pull-left">Print</button>
                    <button id="reset" class="reset pull-left">Reset</button>   
                    <button id="pdf" class="pdf pull-left">PDF</button>
                    <button id="email" class="email pull-left">E-mail</button>     
                </div>
            </div>
            
        </div>
        <div class="span3">
            <div class="row-fluid">
                <div class="span12">
                    <label>Actual Cost: </label><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Some helpful text will go here." data-trigger="hover click">?</a>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="input-prepend">
                        <span class="add-on pull-left">$</span>
                        <input id="total-cost" class="input-small pull-left" type="text" disabled="disabled" value="0.00">  
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="row-fluid calc-category-header">
        <div class="span4">
            <span>Category </span><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Some helpful text will go here." data-trigger="hover click">?</a>
            <div class="category-controls">
                <div id="expand-all">Expand All</div>
                <div id="collapse-all">Collapse All</div>
            </div>
        </div>
        <div class="span5"><span>Estimated Cost </span><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Some helpful text will go here." data-trigger="hover click">?</a></div>
        <div class="span3"><span>Actual Cost  </span><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Some helpful text will go here." data-trigger="hover click">?</a></div>
    </div>
    
    <div class="row-fluid calc-body">
        <div class="span12" id="category-list">
            
        </div>
    </div>
    
</div>
<div id="emailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="emailModalLabel">Send Email</h3>
    </div>
    <div class="modal-body">
         <div id="email-alert" class="alert alert-error" style="display:none"></div>
         <form>

            <label>Email Address:</label>
            <input class="input-xlarge" id="email-address" type="text" placeholder="Enter email address">
            
        </form>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button id="send-email" class="btn btn-primary">Send Email</button>
    </div>
</div>
<form id="pdf-form" method="post" action="ajax/pdf.php">
    <input type="hidden" name="json" id="pdf-json">
</form>