<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Write</h2>
          <h3>Menu use site operating system</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Please select typed
        </p>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <table class="boardView write" summary="Write">
        <colgroup>
          <col width="18%" />
          <col width="*" />
        </colgroup>
        <tr>
          <th>ID</th>
          <td>Kut0100</td>
        </tr>
        <tr>
          <th>Name<em>*</em></th>
          <td><input type="text" class="name" placeholder="Kut0100" value="Kut0100" /></td>
        </tr>
        <tr>
          <th>Password<em>*</em></th>
          <td><input type="password" class="password" /><span>* 4number typing</span></td>
        </tr>
        <tr>
          <th>Password<em>*</em></th>
          <td><input type="password" class="password" /><span>* Please password retyped</span></td>
        </tr>
        <tr>
          <th>Gender<em>*</em></th>
          <td><label><input type="radio" />Male</label><label><input type="radio" />Female</label></td>
        </tr>
        <tr>
          <th>Birth<em>*</em></th>
          <td>
            <select>
              <option>2013</option>
            </select>
            <select>
              <option>01</option>
            </select>
            <select>
              <option>05</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>Phone</th>
          <td><input type="text" class="phone" /><span>e) 010-3344-5566</span></td>
        </tr>
        <tr>
          <th>E-mail</th>
          <td><input type="email" class="email" /> @ <input type="email" class="email" /><span>e) good@hanmail.net</span></td>
        </tr>
        <tr>
          <th>Address</th>
          <td><input type="text" class="address" /></td>
        </tr>
        <tr>
          <th>Etc</th>
          <td><input type="text" class="etc" /></td>
        </tr>
      </table>
      <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <li>
          <div class="button1">
            <a href="#">Enter</a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="#">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->

    <!-- 팝업 : srt -->
    <section class="popup" style="display: none;">
      <header>
        <h1>
          <span>Recipt</span>
          <div class="button4">
            <a href="#">X</a>
          </div>
        </h1>
      </header>
      <div class="btnGroup popup">
        <p>CBC members from reciving?</p>
        <ol>
          <li>
            <div class="button5">
              <a href="#">Yes<br /><em>Now recipt</em></a>
            </div>
          </li>
          <li>
            <div class="button5">
              <a href="#">No<br /><em>Later recipt</em></a>
            </div>
          </li>
        </ol>
      </div>
    </section>
    <!-- 팝업 : end -->
