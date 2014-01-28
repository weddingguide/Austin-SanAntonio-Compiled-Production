   <div class="category-form">
      <div id="stylized" class="myform">

        <h1><!-- x:out select="$profile/@name"/ --></h1>

        <form id="form1" name="form1" method="post" action="/contact_response.jsp">
           <input type=hidden name=popup id=popup value=true>

           <%@ include file="contact_form_incl.jsp" %>

           <input type=hidden name=vendor id=businessEntityId value=<!-- x:out select="$profile/@id"/ --> >

           <button type="submit" id="submit"  onClick='return(validateForm(this.form, document.form1.vendor));'>Submit</button>
           <button type="reset" id="cancel">Cancel</button>
        </form>
      </div>
   </div>
