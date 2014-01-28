
    <div class="category-form">
       <div id="stylized" class="myform">

         <h1><!-- x:out select="$category/@name"/  --></h1>

         <form id="form1" name="form1" method="post" action="/contact_response.jsp">
            <input type=hidden name=popup id=popup value=true>

            <%@ include file="contact_form_incl.jsp" %>

                 <fieldset class="checks">
                     <legend>Wedding Professionals</legend>
                     <p>
                        Check "all" to have all the professionals in this category respond to
                        your request. You may uncheck those professionals you do not wish to contact.
                     </p>
                     <div>
                        <input type="checkbox" name="all" id="all" value="all" onclick="checkAll(document.form1.vendor);" />
                        <label>
                           All
                        </label>
                     </div>

                     <!-- x:forEach ----loop list of profile tags in the model -->
                         <div>
                            <input type="checkbox" name="vendor" id="vendor" value="<!-- x:out select="$profile/@id"/  -->" />
                            <label>
                               <!-- x:out select="$profile/@name"/  -->
                            </label>
                         </div>
                    <!-- /x:forEach .... -->

                 </fieldset>

              <button type="submit" id="submit"  onClick='return(validateForm(this.form, document.form1.vendor));'>Submit</button>
              <button type="reset" id="cancel">Cancel</button>
         </form>
       </div>
    </div>
