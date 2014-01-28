
                 <h3>Contracts:</h3>
                    <table>
                      <tr>
                        <th>&nbsp;</th>
                        <th>Contract<br>Start Date</th>
                        <th>Contract<br>End Date<br>(Renewal)</th>
                        <th>Years<br>of Contract</th>
                        <th>Advertiser<br>Region</th>
                        <th>Initial WG<br>Edition</th>
                        <th>&nbsp;</th>
                      </tr>

                          <%



                             BGContractList bGContractList = new BGContractList( dbData, businessEntity.getPersonId() );
                             for ( int i = 0; i < bGContractList.getRecordList().length; i++ )
                             {
                                 String rowClass = "row1";
                                 if ( i % 2 != 0 ) rowClass="row0";

                                 BGContract aBGContract = (BGContract)bGContractList.getRecordList()[i];

                                 java.util.Date today = new java.util.Date();

                                 Calendar cal = Calendar.getInstance();
                                 cal.setTime( aBGContract.getContractDate() );
                                 cal.add( Calendar.YEAR, aBGContract.getContractTerm() );
                                 SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");

                                 java.util.Date contractEnd = cal.getTime();

                                 String active = "";
                                 if ( ( aBGContract.getContractDate().before( today ) )
                                    && ( contractEnd.after( today ) ) )
                                 {
                                    active = "<font color=red><b>Active</b></font>";
                                 }

                                 EntityGroup adRegionGroup = new EntityGroup( dbData, aBGContract.getRegionGroupId() );
                                 String adRegion = adRegionGroup.getName().substring( adRegionGroup.getName().indexOf( " " ) + 1 );

                          %>
                                 <tr class=<%=rowClass%>>
                                   <td>
                                      <%=active%>
                                   </td>
                                   <td align=center>
                                    <% if ( aBGContract.getContractTerm() == 0 ) out.print( "--" );
                                       else out.print( aBGContract.getContractDate() );
                                    %>
                                   </td>
                                   <td align=center>
                                    <% if ( aBGContract.getContractTerm() == 0 ) out.print( "--" );
                                       else out.print( formatter.format( cal.getTime() ) );
                                    %>
                                   </td>
                                   <td align=center>
                                    <% if ( aBGContract.getContractTerm() == 0 ) out.print( "--" );
                                       else out.print( aBGContract.getContractTerm() );
                                    %>
                                   </td>
                                   <td align=center>
                                    <%=adRegion.trim()%>
                                   </td>
                                   <td align=center>
                                    <%=aBGContract.getInitialWGEdition()%>
                                   </td>
                                   <td>
                                      <a href=/wgbe/jsp/operator/bgcontractentry.jsp?bgcontractid=<%=aBGContract.getId()%>&businessEGId=<%=businessEG.getGroupNum()%>&businessEntityId=<%=businessEntity.getPersonId()%>>Open</a>
                                   </td>
                                 </tr>
                          <% } %>
                    </table>
                    <a href=/wgbe/jsp/operator/bgcontractentry.jsp?bgcontractid=-1&businessEGId=<%=businessEG.getGroupNum()%>&businessEntityId=<%=businessEntity.getPersonId()%>>Create New Contract</a>
