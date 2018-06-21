<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<script src="<c:url value='/resources/inc/tab.js' />"></script>
   
  <script>
  
  $("document").ready(function() {
      $('textarea[maxlength]').live('keyup change', function() {  
       var str = $(this).val();
       var mx = parseInt($(this).attr('maxlength')); 
       if (str.length > mx) {  
        $(this).val(str.substr(0, mx));
         return false;  
        }  
      });
  });

  
  $(function() {
      
      function divChange(val){
          
            $('#pc,#tablet,#vod,#eBook,#etc,#vodLanguage,#outside,#eBookLanguage').hide();
            
            if(val == '00601'){
                $('#pc').show();
                nameLength('pc');
            }else if(val == '00602'){
                $('#tablet').show();
                nameLength('tablet');
            }else if(val == '00603'){
                 $('#vod').show();
                 $('#vodLanguage').show();
                 nameLength('vodEng');
                 nameLength('vodMal');
            }else if(val == '00604'){
                $('#eBook').show();
                $('#eBookLanguage').show();
                nameLength('eBook');
                nameLength('eBookEng');
                nameLength('eBookMal');      
            }else if(val == '00605'){
                $('#etc').show();
                nameLength('etc');
            }else if(val == '00606'){
                $('#outside').show();
                nameLength('outside');
            }
     
      }
   
        $(".selectDiv").change(function(){ 
            divChange(this.value);
            return false;
        });
      
      <c:if test="${requestMap.flag=='w'}">
        $('#tablet,#vod,#eBook,#etc,#vodLanguage,#outside,#eBookLanguage').hide();
      </c:if>
      <c:if test="${requestMap.flag=='e'}">
        divChange('${command.assetTypeCD}');
      </c:if>  
      
      
  });

  </script>
  
<script type="text/javascript">
function nameLength(type){
    var  length;
    if("pc"==type){
        length = $('input[name=pcName]').val().length;
        $('#pcNameLength').text(length);
    }else if("tablet"==type){
        length = $('input[name=tabletName]').val().length;
        $('#tabletNameLength').text(length);
    }else if("vodEng"==type){
        length = $('input[name=vodNameEng]').val().length;
        $('#vodEngNameLength').text(length);
    }else if("vodMal"==type){
        length = $('input[name=vodNameMal]').val().length;
        $('#vodMalNameLength').text(length);
    }else if("etc"==type){
        length = $('input[name=etcName]').val().length;
        $('#etcNameLength').text(length);
    }else if("outside"==type){
        length = $('input[name=outName]').val().length;
        $('#outsideNameLength').text(length);
    }else if("ebook"==type){
        length = $('input[name=outName]').val().length;
        $('#eBookNameLength').text(length);
    }else if("eBookEng"==type){
        length = $('input[name=eBookTitleEng]').val().length;
        $('#eBookEngNameLength').text(length);
    }else if("eBookMal"==type){
        length = $('input[name=eBookTitleMal]').val().length;
        $('#eBookMalNameLength').text(length);
    }
    
}
</script>

  <form id="command" enctype="multipart/form-data">
    <c:if test="${requestMap.flag=='w'}">
        <input type="hidden" name="flag" value="w">
    </c:if>
    <c:if test="${requestMap.flag=='e'}">
        <input type="hidden" name="flag" value="e">
        <input type="hidden" name="assetID" value="${command.assetID}">
        <input type="hidden" name="del" value="">
        <input type="hidden" name="del" value="${command.assetID}">
    </c:if>
    <!-- <input type="hidden" name="frstRgstUserID" value="sampleTester" />
    <input type="hidden" name="latCrctUserID" value="sampleTester" /> -->
    <input type="hidden" name="strAssetTypeCD" value="${requestMap.strAssetTypeCD }" />
    <input type="hidden" name="strItemNM" value="<c:out value='${requestMap.strItemNM}'/>" />
    <input type="hidden" name="kindOfWork" value="learning" />
  <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
        <c:if test="${requestMap.flag=='w'}">
          <h2>Asset Management</h2>
        </c:if>
        <c:if test="${requestMap.flag=='e'}">
          <h2>Asset Management</h2>
        </c:if>
          <h3>Manage all assets (PCs, tablets, VODs and e-Books) managed by SKT CBC here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <section class="itemSection Product">
        <table class="boardView write asset" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
            <col width="22%" />
            <col width="25%" />
          </colgroup>
          <thead>
          <tr>
            <th>Asset Type<em>*</em></th>
            <td>
              <select class="selectDiv" style="height:24px;" name="type" id="type"></select>
            </td>
            <th>Select Base Price<em>*</em></th>
            <td class="assetCost">
                <input type="text" name="setCostpric" readonly="readonly" class="require" value="<c:if test="${requestMap.flag=='e'}">${cost.costpric}</c:if>">
                <a href="#"  id="button" class="ui-state-default ui-corner-all basePrice"><img src="<c:url value='/resources/images/btn_basePrice.png' />" alt="Base Price" /></a>
                
                <input type="hidden" name="setCostpricID" class="require" value="<c:if test="${requestMap.flag=='e'}">${cost.costpricID}</c:if>">
                <!-- 
                <a href="#" id="button" class="ui-state-default ui-corner-all">
                    <img src="<c:url value='/resources/images/btn_costSelect.png' />" />
                </a>
                 -->
            </td>
          </tr>
          </thead>
        <!-- pc -->  
        <tbody id="pc">
          <tr>
            <th>PC Name<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="pcName" title="PC Name" class="require" maxlength="65" onkeyup="javascript:nameLength('pc');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${command.itemNM}"</c:when><c:otherwise></c:otherwise></c:choose>  /><span><em id="pcNameLength">0</em>/65</span></td>
          </tr>
          <tr>
            <th>Mac-Address<em>*</em></th>
            <td colspan="3" class="macAdd">
              <input type="text" name="pcMacOne" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${fn:substring(command.item01,0,2)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcMacTwo" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${fn:substring(command.item01,3,5)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcMacThree" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${fn:substring(command.item01,6,8)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcMacFour" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${fn:substring(command.item01,9,11)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcMacFive" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${fn:substring(command.item01,12,14)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcMacSix" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${fn:substring(command.item01,15,17)}"</c:when><c:otherwise></c:otherwise></c:choose> />
            </td>
          </tr>
          <tr>
            <th>IP Address<em>*</em></th>
            <td colspan="3" class="macAdd">
              <input type="text" name="pcIpOne" maxlength="3" title="IP Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${ipOne}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcIpTwo" maxlength="3" title="IP Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${ipTwo}"</c:when><c:otherwise></c:otherwise></c:choose>/>
              <span>-</span>
              <input type="text" name="pcIpThree" maxlength="3" title="IP Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${ipThree}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="pcIpFour" maxlength="3" title="IP Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${ipFour}"</c:when><c:otherwise></c:otherwise></c:choose> />
            </td>
          </tr>
          <tr>
            <th>Specifications</th>
            <td colspan="3" class="pcname"><input type="text" name="pcSpec" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${command.item04}"</c:when><c:otherwise></c:otherwise></c:choose> /></td>
          </tr>
          <tr>
            <th>Serial Number<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="pcSerial" class="require" readonly <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">value="${command.item05}"</c:when><c:otherwise>value="${requestMap.creatSerial}"</c:otherwise></c:choose> /></td>
          </tr>
          <tr class="bottomLine">
            <th>etc</th>
            <td colspan="3" class="pcname textArea"><textarea name="pcEtc" maxlength="400" wrap="hard"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00601'}">${command.item07}</c:when><c:otherwise></c:otherwise></c:choose></textarea></td>
          </tr>
        </tbody>
      <!-- tablet -->  
        <tbody id="tablet">
         <tr>
            <th>Tablet Name<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="tabletName" title="Tablet Name" class="require" maxlength="65" onkeyup="javascript:nameLength('tablet');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${command.itemNM}"</c:when><c:otherwise></c:otherwise></c:choose> /><span><em id="tabletNameLength">0</em>/65</span></td>
          </tr>
          <tr>
            <th>Mac-Address<em>*</em></th>
            <td colspan="3" class="macAdd">
              <input type="text" name="tabletMacOne" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${fn:substring(command.item01,0,2)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="tabletMacTwo" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${fn:substring(command.item01,3,5)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="tabletMacThree" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${fn:substring(command.item01,6,8)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="tabletMacFour" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${fn:substring(command.item01,9,11)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="tabletMacFive" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${fn:substring(command.item01,12,14)}"</c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="tabletMacSix" maxlength="2" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${fn:substring(command.item01,15,17)}"</c:when><c:otherwise></c:otherwise></c:choose> />
            </td>
          </tr>
          <tr>
            <th>Specifications</th>
            <td colspan="3" class="pcname"><input type="text" name="tabletSpec" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${command.item04}"</c:when><c:otherwise></c:otherwise></c:choose> /></td>
          </tr>
          <tr>
            <th>Serial Number<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="tabletSerial" readonly class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">value="${command.item05}"</c:when><c:otherwise>value="${requestMap.creatSerial}"</c:otherwise></c:choose> /></td>
          </tr>
          <tr class="bottomLine">
            <th>etc</th>
            <td colspan="3" class="pcname textArea">
                <textarea name="tabletEtc" maxlength="400" wrap="hard"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00602'}">${command.item07}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
       </tbody>
       
       
      <!-- vod/dvd --> 
      <tbody id="vod">
          <tr class="typeFile">
            <th>VOD File<em>*</em></th>
            <td colspan="3" class="filesch dvdfile">
              <input type="text" id="fakeFileTxt" name="vodFile" title="VOD File" maxlength="100" class="fakeFileTxt require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${command.item01}"</c:when><c:otherwise></c:otherwise></c:choose>>
              <span class="vodtext">Before registering asset, please upload File to<br />"Storage root path/learning/video/" path.</span>
            </td>
          </tr>
          <tr>
            <th>Thumbnail</th>
            <td colspan="3" class="thumbnail">
              <table summary="Thumbnail">
                <tr>
                  <th>List(Small)<em>(66*46px)</em></th>
                  <td class="btnFile">
                    <input type="text" id="fakeFileTxt2" class="fakeFileTxt2" readonly="readonly" <c:forEach var="file" items="${fileList }"><c:if test="${file.FILE_TYPE eq 'small' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${file.LOGICAL_FILE_NAME}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>>
                    <div class="fileDiv2">
                    <input type="button" class="buttonImg2" />
                    <input type="file" id="small" name="small" class="realFile2" onchange="javascript:document.getElementById('fakeFileTxt2').value = this.value" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>Main<em>(223*138px)</em></th>
                  <td class="btnFile">
                    <input type="text" id="fakeFileTxt3" class="fakeFileTxt3" readonly="readonly" <c:forEach var="file" items="${fileList }"><c:if test="${file.FILE_TYPE eq 'main' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${file.LOGICAL_FILE_NAME}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>>
                    <div class="fileDiv3">
                    <input type="button" class="buttonImg3" />
                    <input type="file" id="main" name="main" class="realFile3" onchange="javascript:document.getElementById('fakeFileTxt3').value = this.value" />
                    </div>
                  </td>
                </tr>
                <tr class="capture">
                  <th>Cover<em>(144*177px)</em></th>
                  <td class="btnFile">
                    <input type="text" id="fakeFileTxt4" class="fakeFileTxt4" readonly="readonly" <c:forEach var="file" items="${fileList }"><c:if test="${file.FILE_TYPE eq 'cover' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${file.LOGICAL_FILE_NAME}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>>
                    <div class="fileDiv4">
                    <input type="button" class="buttonImg4" />
                    <input type="file" id="cover" name="cover" class="realFile4" onchange="javascript:document.getElementById('fakeFileTxt4').value = this.value" />
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <th>Teacher’s Photo<br /><span class="imgupSize">(129*129px)</span></th>
            <td colspan="3" class="filesch teacher">
              <input type="text" id="fakeFileTxt6" class="fakeFileTxt6" readonly <c:forEach var="file" items="${fileList }"><c:if test="${file.FILE_TYPE eq 'instructor' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${file.LOGICAL_FILE_NAME}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>>
              <div class="fileDiv6">
                <input type="button" class="buttonImg6" />
                <input type="file" id="instructor" name="instructor" class="realFile6" onchange="javascript:document.getElementById('fakeFileTxt6').value = this.value" />
              </div>
            </td>
          </tr>
          <tr>
            <th>Total Play Time</th>
            <td colspan="3" class="runningTime">
              <input type="text" maxlength="2" name="runningTimeHour" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${hour}"</c:when><c:otherwise></c:otherwise></c:choose>/>
              <input type="text" maxlength="2" name="runningTimeMin" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${min}"</c:when><c:otherwise></c:otherwise></c:choose>/>
            </td>
          </tr>
          <tr>
            <th>Serial Number<em>*</em></th>
            <td colspan="3" class="serial">
              <input type="text" name="dvdSerial" class="require" readonly <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${command.item05}"</c:when><c:otherwise>value="${requestMap.creatSerial}"</c:otherwise></c:choose> />
            </td>
          </tr>
          <tr class="bottomLine">
            <th>etc</th>
            <td colspan="3" class="textArea">
              <textarea name="dvdEtc" maxlength="400" wrap="hard"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${command.item07}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
          </tbody>
      
      <!-- e-book -->
      <tbody id="eBook">     
          <tr class="typeFile">
            <th>Attaching e-Book<em>*</em></th>
            <td colspan="3" class="filesch dvdfile">
              <input type="text" id="fakeFileTxt" maxlength="100" title="Attaching e-Book" name="eBookFile" class="fakeFileTxt require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">value="${command.item01}"</c:when><c:otherwise></c:otherwise></c:choose>>
              <span class="vodtext">Before registering asset, please upload File to<br />"Storage root path/learning/video/" path.</span>
            </td>
          </tr>
          <tr>
            <th>Thumbnail<br /><span class="imgupSize">(146*136px)</span></th>
            <td colspan="3" class="thumbnail">
              <table summary="Thumbnail">
                <tr class="capture">
                  <td class="btnFile">
                    <input type="text" id="fakeFileTxt7" class="fakeFileTxt7" readonly="readonly" <c:forEach var="file" items="${fileList }"><c:if test="${file.FILE_TYPE eq 'eList' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">value="${file.LOGICAL_FILE_NAME}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>>
                    <div class="fileDiv2">
                    <input type="button" class="buttonImg2" />
                    <input type="file" id="eList" name="eList" class="realFile2" onchange="javascript:document.getElementById('fakeFileTxt7').value = this.value" />
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <th>Serial Number<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="eBookSerial" title="" readonly class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">value="${command.item05}"</c:when><c:otherwise>value="${requestMap.creatSerial}"</c:otherwise></c:choose> /></td>
          </tr>
          <tr class="bottomLine">
            <th>etc</th>
            <td colspan="3" class="textArea">
              <textarea name="eBookEtc" maxlength="400" wrap="hard"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">${command.item07}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
      </tbody>
      <!-- etc -->
      <tbody id="etc">
          <tr>
            <th>Asset Name<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="etcName" title="Asset Name" class="require" maxlength="65" onkeyup="javascript:nameLength('etc');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00605'}">value="${command.itemNM}"</c:when><c:otherwise></c:otherwise></c:choose> /><span><em id="etcNameLength">0</em>/65</span></td>
          </tr>
          <tr>
            <th>Serial Number<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="etcSerial" readonly class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00605'}">value="${command.item05}"</c:when><c:otherwise>value="${requestMap.creatSerial}"</c:otherwise></c:choose> /></td>
          </tr>
<%--           <tr>
            <th>Summary<em>*</em></th>
            <td colspan="3" class="textArea">
              <textarea name="etcSummary" wrap="hard" class="require" ><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00605'}">${command.item08}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr> --%>
          <tr class="bottomLine">
            <th>etc</th>
            <td colspan="3" class="textArea">
              <textarea name="etc" maxlength="400" wrap="hard"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00605'}">${command.item07}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
        </tbody>
        
        <!-- outside -->  
        <tbody id="outside">
         <tr>
            <th>Asset name<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="outName" title="Asset Name" class="require" maxlength="65" onkeyup="javascript:nameLength('outside');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${command.itemNM}"</c:when><c:otherwise></c:otherwise></c:choose> /><span><em id="outsideNameLength">0</em>/65</span></td>
          </tr>
          <tr>
            <th>Mac-Address<em>*</em></th>
            <td colspan="3" class="macAdd">
              <input type="text" name="outMacOne" title="Mac-Address" class="require"  <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='006062'}">value="${fn:substring(command.item01,0,2)}" </c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="outMacTwo" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${fn:substring(command.item01,3,5)}" </c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="outMacThree" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${fn:substring(command.item01,6,8)}" </c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="outMacFour" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${fn:substring(command.item01,9,11)}" </c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="outMacFive" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${fn:substring(command.item01,12,14)}" </c:when><c:otherwise></c:otherwise></c:choose> />
              <span>-</span>
              <input type="text" name="outMacSix" title="Mac-Address" class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${fn:substring(command.item01,15,17)}" </c:when><c:otherwise></c:otherwise></c:choose> />
            </td>
          </tr>
          <tr>
            <th>Serial Number<em>*</em></th>
            <td colspan="3" class="pcname"><input type="text" name="outSerial" readonly class="require" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${command.item05}"</c:when><c:otherwise>value="${requestMap.creatSerial}"</c:otherwise></c:choose> /></td>
          </tr>
          <tr>
            <th>Specifications</th>
            <td colspan="3" class="pcname"><input type="text" name="outSpec" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">value="${command.item04}"</c:when><c:otherwise></c:otherwise></c:choose> /></td>
          </tr>
          <tr class="bottomLine">
            <th>etc</th>
            <td colspan="3" class="pcname textArea">
                <textarea name="outEtc" maxlength="400" wrap="hard"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00606'}">${command.item07}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
       </tbody>
       
        
        </table>
               
        <script>
        function selectLang(){
            var lang = $('select[name=langType]').val();
            if("0"==lang){
                $('#tableEng').show();
                $('#tableMal').show();
            }else if("00033"==lang){
                $('#tableMal').hide();
                $('#tableEng').show();
            }else if("00034"==lang){
                $('#tableMal').show();
                $('#tableEng').hide();
            }
        }
        </script>
        
        <!-- VOD 언어 -->
        <div id="vodLanguage"  class="mb30">
        <table class="boardView write asset language" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
          </colgroup>
          <tr class="bottomLine">
            <th>Information<br />Select Language</th>
            <td class="language">
              <select style="height:24px;" name="langType" onchange="javascript:selectLang();">
                <option value="0">Engliah + Bahasa Malaysia</option>
                <option value="00033">Engliah</option>
                <option value="00034">Bahasa Malaysia</option>
              </select>
            </td>
          </tr>
        </table>
        
        <div id="tableEng"  class="mb18">
        <h4>Information(English)</h4>
        <table class="boardView write asset" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Title<em>*</em></th>
            <td class="pcname"><input type="text" class="require" name="vodNameEng" maxlength="65" onkeyup="javascript:nameLength('vodEng');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${command.item02}"</c:when><c:otherwise></c:otherwise></c:choose>/><span><em  id="vodEngNameLength">0</em>/65</span></td>
          </tr>
          <tr>
            <th>Teacher’s<br />Information</th>
            <td class="instructor">
              <table summary="Instructor information">
                <colgroup>
                  <col width="25%" />
                  <col width="*" />
                </colgroup>
                <tr>
                  <th>Name</th>
                  <td>
                    <input type="text" name="fristNameEng" maxlength="15" class="name" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.INSTRUCTOR_NAME_FIRST}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach> />
                    <input type="text" name="lastNameEng" maxlength="15" class="lastname" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.INSTRUCTOR_NAME_LAST}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach> />
                  </td>
                </tr>
                <tr>
                  <th>Major</th>
                  <td><input class="inputwei300" maxlength="30" name="vodMajorEng" type="text" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.MAJOR}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach> /></td>
                </tr>
                <tr>
                  <th>Education Qualification</th>
                  <td><input class="inputwei300" maxlength="30" name="qualificationEng" type="text" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.EDUCATION_QUALIFICATION}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>/></td>
                </tr>
                <tr>
                  <th>Working Period</th>
                  <td><input class="inputwei300" maxlength="30" name="periodEng" type="text" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.WORKING_PERIOD}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>/></td>
                </tr>
                <tr>
                  <th class="textArea2">Honors and Awards</th>
                  <td class="textArea2"><textarea name="honorsEng" maxlength="200" wrap="hard"><c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${assetChild.HONORS_AND_AWARDS}</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach></textarea></td>
                </tr>
                <tr>
                  <th class="textArea2">Other</th>
                  <td class="textArea2"><textarea name="otherEng" maxlength="200" wrap="hard"><c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00033' }"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${assetChild.OTHER}</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach></textarea></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class="bottomLine">
            <th>Lesson Introduction<em>*</em></th>
            <td class="textArea">
              <textarea name="dvdIntroEng" wrap="hard" maxlength="1000" class="require" ><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${command.item08}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
        </table>
        </div>
        
        <div id="tableMal"  class="mb18">
        <h4>Information(Bahasa Malaysia)</h4>
        <table class="boardView write asset" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Tajuk<em>*</em></th>
            <td class="pcname"><input type="text" class="require" name="vodNameMal" maxlength="65" onkeyup="javascript:nameLength('vodMal');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${command.item03}"</c:when><c:otherwise></c:otherwise></c:choose> /><span><em id="vodMalNameLength">0</em>/65</span></td>
          </tr>
          <tr>
            <th>Maklumat <br />Tentang Cikgu</th>
            <td class="instructor">
              <table summary="Instructor information">
                <colgroup>
                  <col width="25%" />
                  <col width="*" />
                </colgroup>
                <tr>
                  <th>Nama</th>
                  <td>
                    <input type="text" name="fristNameMal" maxlength="15" class="name" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.INSTRUCTOR_NAME_FIRST}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>/>
                    <input type="text" name="lastNameMal" maxlength="15" class="lastname" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.INSTRUCTOR_NAME_FIRST}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach> />
                  </td>
                </tr>
                <tr>
                  <th>Subjek Diajar</th>
                  <td><input class="inputwei300" name="vodMajorMal" maxlength="30" type="text" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.MAJOR}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach> /></td>
                </tr>
                <tr>
                  <th>Kelulusan</th>
                  <td><input class="inputwei300" name="qualificationMal" maxlength="30" type="text" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.EDUCATION_QUALIFICATION}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>/></td>
                </tr>
                <tr>
                  <th>Pengalaman Mengajar</th>
                  <td><input class="inputwei300" name="periodMal" maxlength="30" type="text" <c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"> <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">value="${assetChild.WORKING_PERIOD}"</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach>/></td>
                </tr>
                <tr>
                  <th class="textArea2">Pencapaian Diraih</th>
                  <td class="textArea2"><textarea name="honorsMal" maxlength="200" wrap="hard"><c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${assetChild.HONORS_AND_AWARDS}</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach></textarea></td>
                </tr>
                <tr>
                  <th class="textArea2">Lain-Lain</th>
                  <td class="textArea2"><textarea name="otherMal" maxlength="200" wrap="hard"><c:forEach var="assetChild" items="${assetChildList }"><c:if test="${assetChild.LANGUAGE_TYPE eq '00034' }"><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${assetChild.OTHER}</c:when><c:otherwise></c:otherwise></c:choose></c:if></c:forEach></textarea></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class="bottomLine">
            <th>Pengenalan Kelas<em>*</em></th>
            <td class="textArea">
              <textarea name="dvdIntroMal" wrap="hard" maxlength="1000" class="require" ><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00603'}">${command.item09}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
          </table>
          </div>
        </div>
        
        
        <script>
        function selecteBookLang(){
            var lang = $('select[name=eBookLangType]').val();
            if("0"==lang){
                $('#eBookEng').show();
                $('#eBookMal').show();
            }else if("00033"==lang){
                $('#eBookMal').hide();
                $('#eBookEng').show();
            }else if("00034"==lang){
                $('#eBookMal').show();
                $('#eBookEng').hide();
            }
        }
        </script>  
        
        <!-- eBook 언어선택 -->
        <div id="eBookLanguage"  class="mb30">
        <table class="boardView write asset language" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
          </colgroup>
          <tr class="bottomLine">
            <th>Information<br />Select Language</th>
            <td class="language">
              <select style="height:24px;" name="eBookLangType" onchange="javascript:selecteBookLang();">
                <option value="0">Engliah + Bahasa Malaysian</option>
                <option value="00033">Engliah</option>
                <option value="00034">Bahasa Malaysian</option>
              </select>
            </td>
          </tr>
        </table>
        
        <div id="eBookEng"  class="mb18">
        <h4>Information(English)</h4>
        <table class="boardView write asset" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Title<em>*</em></th>
            <td class="pcname"><input type="text" maxlength="65" name="eBookTitleEng" class="require" title="" onkeyup="javascript:nameLength('eBookEng');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">value="${command.item02}"</c:when><c:otherwise></c:otherwise></c:choose>/><span><em  id="eBookEngNameLength">0</em>/65</span></td>
          </tr>
          <tr class="bottomLine">
            <th>Plot Summary<em>*</em></th>
            <td class="textArea">
              <textarea name="eBookSummaryEng" maxlength="1000" wrap="hard" class="require" ><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">${command.item08}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
         </table>
         </div>
         
        <div id="eBookMal"  class="mb18">
        <h4>Information(Bahasa Malaysia)</h4>
        <table class="boardView write asset" summary="Product register">
          <colgroup>
            <col width="22%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Tajuk<em>*</em></th>
            <td class="pcname"><input type="text" maxlength="65"name="eBookTitleMal" class="require" title="" onkeyup="javascript:nameLength('eBookMal');" <c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">value="${command.item03}"</c:when><c:otherwise></c:otherwise></c:choose>/><span><em  id="eBookMalNameLength">0</em>/65</span></td>
          </tr>
          <tr class="bottomLine">
            <th>Ringkasan Plot<em>*</em></th>
            <td class="textArea">
              <textarea name="eBookSummaryMal" maxlength="1000" wrap="hard" class="require" ><c:choose><c:when test="${requestMap.flag=='e' && command.assetTypeCD=='00604'}">${command.item09}</c:when><c:otherwise></c:otherwise></c:choose></textarea>
            </td>
          </tr>
         </table>
       </div>
      </div>
      </section>
      <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <c:if test="${requestMap.flag=='w' }">
        <li>
          <div class="button1 type2 enter">
            <a href="javascript:if(assetSubmitCheck()) doSubmit('${pageContext.request.contextPath }/adm/asset/', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />"  /><span>Resister</span></a>
          </div>
        </li>
        </c:if>
        <c:if test="${requestMap.flag=='e' }">
        <li>
          <div class="button1 type2 save">
            <a href="javascript:if(assetSubmitCheck()) doSubmit('${pageContext.request.contextPath }/adm/asset/', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />"  /><span>Save</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/asset/delete', 'command', 'post');" class="detailDelete">Delete</a>
          </div>
        </li>
        </c:if>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/asset/list', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 버튼그룹 : end -->
</form>



 <script>
$(function() {
  // run the currently selected effect
  function runEffect() {
    // get effect type from
    var selectedEffect = $( "#effectTypes" ).val();
    // most effect types need no options passed by default
    var options = {};

    // run the effect
    $( "#effect" ).show( selectedEffect, options, 500, callback );
  };
  //callback function to bring a hidden box back
  function callback() {
    setTimeout(function() {
      $( "#effect:visible" ).removeAttr( "style" ).fadeIn();
    }, 1000 );
  };
  //Cost select 버튼 클릭시 body 스크롤 hidden
    $(document).ready(function(){
        $("#button").click(function(){ 
            $('#bodyScroll').css({"overflow":"hidden"});
            return false;
        });
    
    });
  // 팝업상단의 X 버튼 클릭시 body 스크롤 자동으로
    $(document).ready(function(){
        $("#btnClose").click(function(){ 
            $('#bodyScroll').css({"overflow":"auto"});
            return false;
        });
    });
  // 팝업하단의 Cancel 버튼 클릭시 스크롤 자동으로
    $(document).ready(function(){
        $("#btnClose2").click(function(){ 
            $('#bodyScroll').css({"overflow":"auto"});
            return false;
        });
    });
  // set effect from select menu value
  $( "#button" ).click(function() {
      $('#popTbody').empty();
      
          $.ajax({
            type    : "GET",
            url     : "${pageContext.request.contextPath }/restful/asset/costList",
            dataType: "json",
            data: ({
                assetTypeCD : $("#type").val()
            }),
            success : function(data){
                $.each(data.itmes, function(i,item){
                      $('#popTbody').append("<tr><td><input type='radio' name='costRadio' pric ='"+item.COSTPRIC+"' value='"+item.COSTPRIC_ID+"' /></td><td>"+item.ASSET_TYPE_NM+"</td><td class='alignL'>"+item.COSTPRIC_NM+"</td><td>"+item.COSTPRIC_TYPE_NM+"</td><td>"+item.COSTPRIC+"</td><td>"+item.PRFT_MRGIN+"</td></tr>");
                  });
            },
            error : function(request,status,error){ 
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
           
          });
          runEffect();
          
    
   return false;
  });
  
  // 초기화면 팝업 가리기
  $( "#effect" ).hide();
 
});

function clickEnter(){
    
    if($('input[name=costRadio]:checked').val()!=null){
    var costID = $('input[name=costRadio]:checked').val();
    var cost = $('input[name=costRadio]:checked').attr("pric");
    $('input[name=setCostpricID]').val(costID);
    $('input[name=setCostpric]').val(cost);
    
    $( "#effect" ).hide();
    }else{
        alert("Please select a Cost.");
    }
    
    
}
</script>


    <section class="toggler popup">
      <div id="effect" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Base Price</span>
                <div class="button4">
                  <a href="#" id="btnClose" onclick="$( '#effect' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <div class="popupCategory">
                <table class="boardList register asset">
                  <colgroup>
                      <col width="40">
                      <col width="76" />
                      <col width="*" />
                      <col width="80" />
                      <col width="70" />
                      <col width="86" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th class="one"></th>
                      <th>Asset Type</th>
                      <th>Name</th>
                      <th>Pricing Unit</th>
                      <th>Base Price</th>
                      <th class="end">Margin Rate</th>
                    </tr>
                  </thead>
                </table>
                <div class="cropwinList asset">
                  <table class="boardList register list">
                    <colgroup>
                      <col width="40">
                      <col width="76" />
                      <col width="*" />
                      <col width="80" />
                      <col width="70" />
                      <col width="86" />
                    </colgroup>
                    <tbody id="popTbody">
                      <tr>
                        <td></td>
                        <td>PC</td>
                        <td class="alignL">Easy Tuition DVD</td>
                        <td>Per Case</td>
                        <td>1000</td>
                        <td>10%</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5 enter">
                <a href="javascript:clickEnter();"id="btnEnter" ><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />"  /><span>Resister</span></a>
              </div>
              <div class="button5">
                <a href="#" id="btnClose2" onclick="$( '#effect' ).hide();">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
  </section>
      
<script>
    fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00600','type','${command.assetTypeCD }','');
</script>