<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Information</h2>
          <h3>Menu use site operating system</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <table class="boardView" summary="Information">
        <colgroup>
          <col width="18%" />
          <col width="*" />
          <col width="18%" />
          <col width="25%" />
        </colgroup>
        <tr>
          <th>Date</th>
          <td>2013.01.05</td>
          <th>Member</th>
          <td>Isaac</td>
        </tr>
        <tr>
          <th>Name</th>
          <td colspan="3">Kut0100</td>
        </tr>
        <tr>
          <th>Birth</th>
          <td colspan="3">1992.12.21</td>
        </tr>
        <tr>
          <th>Phone</th>
          <td colspan="3">010-3456-7892</td>
        </tr>
        <tr>
          <th>E-mail</th>
          <td colspan="3">-</td>
        </tr>
        <tr>
          <th>Storage</th>
          <td colspan="3">reciptok
            <div class="button3">
              <a href="#">Enter</a>
            </div>
          </td>
        </tr>
        <tr>
          <th>Address</th>
          <td colspan="3">add</td>
        </tr>
        <tr>
          <th>Etc</th>
          <td colspan="3">-</td>
        </tr>
      </table>
     <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li></li>
      <li class="alignR">
        <div class="button1 type2 list">
          <img src="<c:url value='/resources/images/btn_icon_list.gif' />" alt="icon" /><a href="#">List</a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li>
          <div class="button1">
            <a href="#">Edit</a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="#">Delete</a>
          </div>
        </li>
        <li class="write">
          <div class="button1 type2">
            <img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><a href="#">Write</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
