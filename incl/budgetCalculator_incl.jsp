<link type="text/css" rel="stylesheet" href="/css/printable.css" media="print" />
<link type="text/css" rel="stylesheet" href="/css/layout.css" media="screen,print" />

      <script type="text/javascript">
            
            $(document).ready(function(){
                
                var calc        =   new BridalCalc();
                
                calc.init();
                
                
            });
  
      </script>
      <style>
        .container .row-fluid.calc-body .accordion-group .accordion-heading .tips-controls {display:none;}
      </style>
<div class="pt-info">
    <h1>Budget Calculator</h1>
    <div>
        <span>
            <a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back to Planning Tools</a>
        </span>
    </div>
    <div>
        <p>Our improved Budget Calculator will help determine how much you should be spending and keep you on track as you book services for your wedding! Enter the total amount you want to spend on your wedding and number of guests below, click &ldquo;Go,&rdquo; and we will calculate the average cost of each service in the &ldquo;Estimated Cost&rdquo; column. As you enter what you&rsquo;re spending in the &ldquo;Actual Cost&rdquo; column, you can see in real time how much you have left over. <strong style="color:green;">Green</strong>, you&rsquo;re on or under budget; <strong style="color:red;">Red</strong>, you&rsquo;ve gone over!</p>

        <p>You print out the worksheet, e-mail yourself a copy or download a PDF. If you want to start over, just hit &ldquo;Reset&rdquo; button to wipe all the fields clean. Contact us at <a href="mailto:weddingguide@texasweddings.com">weddingguide@texasweddings.com</a> if you have any questions! </p>
    </div>
</div>
<div class="container">
    <div class="row-fluid calc-header">
        <div class="span4">
            <div class="row-fluid">
                <div class="span7">
                    <label>Your Budget: </label><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Enter the total amount available to spend in this box, along with the number of guests in the box to the right. Then click the &ldquo;Go&rdquo; button to calculate your costs by type of service in the &ldquo;Estimated Costs&rdquo; column in the table below." data-trigger="hover click">?</a>
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
                    <label>Actual Cost: </label><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="This box will calculate the total of all expenses entered into the &ldquo;Actual Cost&rdquo; column in the table below. This box will stay green until you go over Your Budget, at which point it will turn red." data-trigger="hover click">?</a>
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
            <span>Category </span><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="<Indicates the type of service, along with any related services listed below it. When you&rsquo;re done, or if you are not using a category, click the category name to collapse the fields. You can also add a service by clicking &ldquo;+ Add Item&rdquo; at the bottom of each list." data-trigger="hover click">?</a>
            <div class="category-controls">
                <div id="expand-all">Expand All</div>
                <div id="collapse-all">Collapse All</div>
            </div>
        </div>
        <div class="span5"><span>Estimated Cost </span><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="When you enter Your Budget and number of guests and click &ldquo;Go,&rdquo; we will calculate a recommended amount for each category, based on an average percentage of what most brides spend. You may elect to spend more or less on an item or service, depending on what is important to you!" data-trigger="hover click">?</a></div>
        <div class="span3"><span>Actual Cost  </span><a class="question-tooltip" data-toggle="tooltip" data-placement="bottom" title="Enter the actual amounts you&rsquo;ve spent in this column. If you&rsquo;re not using a certain service, leave the field blank. The top box calculates your totals by category, and will stay green until you exceed the Estimated Cost, at which point it will turn red." data-trigger="hover click">?</a></div>
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