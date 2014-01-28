<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='WGBETV'">
  <x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
    <x:if select="$planningTools/@name='WGBETV'">
      <x:set var="slider" select="string($planningTools/content)"/>
      <c:out value="${slider}" escapeXml="false"/>
    </x:if>
  </x:forEach>
</x:if>