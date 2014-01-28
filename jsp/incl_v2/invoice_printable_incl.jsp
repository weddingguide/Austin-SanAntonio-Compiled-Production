

        <% boolean managerRole = false; %>
        <% boolean showPropertiesDetails = false; %>


        <%@ include file="../invoiceincl/invoiceproperties.jsp" %>


    <% if ( invoice.isRecordFound() ) { %>

             <%@ include file="../invoiceincl/invoicecontents.jsp" %>

    <% } %>


