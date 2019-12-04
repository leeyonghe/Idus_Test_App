# Idus_Test_App

<div>
            <a class="" data-toggle="collapse" href="#collapseStepFirst" aria-expanded="true" aria-controls="collapseStepSecond">
              STEP 1. 프로젝트 요구사항
              <svg class="ic-arrow ic-24"><use xlink:href="/assets/svg-defs-44575b3897a67b2b5dd6110d113bb64c4a827b2cffd1c6cbd99310c513d42e6b.svg#ic-keyboard-arrow-down"></use></svg>
            </a>
            <div class="collapse show" id="collapseStepFirst" style="">
              <div class="collapse-content">
                <div class="markdown">
                  <br>
                  <div class="markdown github"><h2>기능 요구 사항</h2>

<p>상품 목록과 상품 상세 화면으로 구성된 앱을 만드세요.<br>
다음과 같은 기능을 가져야 합니다.</p>

<ul>
<li>상품 목록

<ul>
<li>스크롤에 따라 자동 로드 되어야합니다. (20개씩)</li>
<li>상품을 터치하면 해당 상품의 detail view로 전환됩니다.</li>
</ul></li>
<li>상품 상세 화면

<ul>
<li>뷰전환시 자연스러운 애니메이션을 적용하세요. </li>
<li>닫기 버튼을 터치시 상품 목록으로 전환됩니다.</li>
<li>상품 이미지를 스와이핑 하여 다음이미지를 볼 수 있습니다. (인디케이터 포함)</li>
</ul></li>
</ul>

<p>각 화면은 다음과 같은 구성 요소를 가지고 있습니다.</p>
<div class="highlight"><pre class="codehilite"><code>- Index view
    |- 헤더 + 아이콘
    |- 리스트 아이템
        |- 정사각형 썸네일
        |- 상품명
        |- 셀러명
- Detail view
    |- 닫기 버튼
    |- 제품 이미지 (다수)
    |- 셀러명
    |- 제품명
    |- 가격
        |- 할인률
        |- 판매가
        |- 정가
    |- 구매하기 버튼 (동작하지 않음)
</code></pre></div>
<hr>

<h2>디자인 요구 사항</h2>

<ul>
<li>상세 동작은 <a href="https://bit.ly/2QG7gTG" target="_blank" rel="noopener">여기의 프로토 타입에서</a> 확인하실 수 있습니다.

<ul>
<li>[상품 목록]에서 [상품 상세]로의 전환시 애니메이션이 적용되어야 하며, 제공한 프로토타입의 2행2열 상품(Triple Hearthorn Earring)을 클릭하면 확인할 수 있습니다.</li>
</ul></li>
<li>디자인 가이드는 제플린으로 제공되며 <a href="https://zpl.io/V1poGjE" target="_blank" rel="noopener">여기를</a> 참고하세요.

<ul>
<li>ID: prgms_public</li>
<li>PW: programmers</li>
</ul></li>
<li>필요한 아이콘은 <a href="https://bit.ly/2QG6hTB" target="_blank" rel="noopener">여기에서</a> 다운로드 받으실 수 있습니다.</li>
</ul>

<hr>

<h2>API</h2>

<h3>BASE URL</h3>

<ul>
<li><p><a href="https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/" target="_blank" rel="noopener">https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/</a></p>

<blockquote>
<p>BASE URL 뒤에 원하는 리소스를 붙혀 사용합니다.<br><br>
ex) {BASE URL}/products?page=10</p>
</blockquote></li>
</ul>

<h2>Products API - Get 메소드</h2>

<p>상품 목록을 조회 할 수 있는 기능 </p>
<div class="highlight"><pre class="codehilite"><code>GET /products -&gt; 상품 목록을 반환합니다. (50개 단위 페이징)

GET /products?page={페이지 번호} -&gt; 페이지 번호에 해당되는 상품 목록을 반환합니다. 
</code></pre></div>
<h4>Request Header 구조</h4>
<div class="highlight"><pre class="codehilite"><code>GET /products
Content-Type: application/json
</code></pre></div>
<h3>1. 페이징 기능</h3>

<h4>QueryParameter (선택)</h4>
<table class="table">
        <thead><tr>
<th>Parameter</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
        <tbody><tr>
<td>page</td>
<td>Integer</td>
<td>페이지 번호</td>
</tr>
</tbody>
      </table>
<h4>요청 예시 - cURL</h4>
<div class="highlight"><pre class="codehilite"><code>1. curl -G https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products -H "Content-Type: application/json"

curl -G https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products?page=10 -H "Content-Type: application/json"

2. 웹 브라우저에서 테스트
https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products?page=10
</code></pre></div>
<h4>Response Body 예시</h4>
<div class="highlight"><pre class="codehilite"><code>{
  "statusCode": 200,
  "body": [
    {
      "id": 1,
      "thumbnail_520": "https://image.idus.com/image/files/4e47e2fa54e84fedbe56b610475adf0c_520.jpg",
      "title": "겨울에 아삭한여름복숭아먹기",
      "seller": "골든팜"
    },
    ....
    ....
}
</code></pre></div>
<h4>Response Body 설명</h4>
<table class="table">
        <thead><tr>
<th>Column</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
        <tbody><tr>
<td>id</td>
<td>Integer</td>
<td>상품 코드</td>
</tr>
<tr>
<td>thumbnail_520</td>
<td>String</td>
<td>썸네일 이미지 (520 size)</td>
</tr>
<tr>
<td>title</td>
<td>String</td>
<td>게시글 제목</td>
</tr>
<tr>
<td>seller</td>
<td>String</td>
<td>게시글 작성자</td>
</tr>
</tbody>
      </table>
<h3>2. 상세 정보 조회 기능</h3>

<h4>PathParameters (선택)</h4>
<table class="table">
        <thead><tr>
<th>Parameter</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
        <tbody><tr>
<td>id</td>
<td>Integer</td>
<td>상품 코드</td>
</tr>
</tbody>
      </table>
<h4>요청 예시 - cURL</h4>
<div class="highlight"><pre class="codehilite"><code>1. curl -G https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products/250 -H "Content-Type: application/json"

2. 웹 브라우저에서 테스트
https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products/250
</code></pre></div>
<h4>Response Body 예시</h4>
<div class="highlight"><pre class="codehilite"><code>{
  "statusCode": 200,
  "body": [
    {
      "id": 250,
      "thumbnail_720": "https://image.idus.com/image/files/0b9ca2fae287417b95c87fe59e01f31b_720.jpg",
      "thumbnail_list_320": "https://image.idus.com/image/files/0b9ca2fae287417b95c87fe59e01f31b_320.jpg#https://image.idus.com/image/files/fa2e0876ad6b4f468eb11f7e1a16adda_320.jpg .....",
      "title": "[밀호밀] 원 스트랩 백 S사이즈",
      "seller": "milhomil",
      "cost": "20,000원",
      "discount_cost": null,
      "discount_rate": null,
      "description": "\n\n[밀호밀] 원 스트랩 백\n\nmaterial : 코튼 100％\n\ncolor : 베이지, 블랙, 네이비, 카멜\n\n✔️ 내부에 포켓이 생겼습니다😉\n ....."
    }
  ]
}
</code></pre></div>
<h4>Response Body 설명</h4>
<table class="table">
        <thead><tr>
<th>Column</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
        <tbody><tr>
<td>id</td>
<td>Integer</td>
<td>상품 코드</td>
</tr>
<tr>
<td>thumbnail_720</td>
<td>String</td>
<td>썸네일 이미지 (720 size)</td>
</tr>
<tr>
<td>thumbnail<u>list</u>320</td>
<td>String</td>
<td>썸네일 이미지 (320 size) -&gt; 각 이미지는 #으로 구분되어있음</td>
</tr>
<tr>
<td>title</td>
<td>String</td>
<td>게시글 제목</td>
</tr>
<tr>
<td>seller</td>
<td>String</td>
<td>게시글 작성자</td>
</tr>
<tr>
<td>cost</td>
<td>String</td>
<td>상품 원가</td>
</tr>
<tr>
<td>discount_cost</td>
<td>String</td>
<td>상품 할인가</td>
</tr>
<tr>
<td>discount_rate</td>
<td>String</td>
<td>상품 할인율</td>
</tr>
<tr>
<td>description</td>
<td>String</td>
<td>상품 설명</td>
</tr>
</tbody>
      </table>
<h4>Response Status Code</h4>
<table class="table">
        <thead><tr>
<th>Status Code</th>
<th>Description</th>
</tr>
</thead>
        <tbody><tr>
<td>200 OK</td>
<td>성공</td>
</tr>
<tr>
<td>400 Bad Request</td>
<td>클라이언트 요청 오류 - 요청 변수가 Integer 타입이 아닐 때</td>
</tr>
<tr>
<td>404 NotFound</td>
<td>조회한 데이터가 비어있을 때, URL 경로, HTTP method 오류로 페이지를 찾을 수 없을 때</td>
</tr>
<tr>
<td>500 Internal Server Error</td>
<td>서버에 문제가 있을 경우</td>
</tr>
</tbody>
      </table>
<hr>

<h2>전반적인 구현과 관련한 요청 사항</h2>

<ul>
<li>테스트 코드를 작성하는 경우 가산점이 있습니다.</li>
<li>프로젝트 구조 및 성능: 사용하는 프레임워크의 Best practice를 활용해서 프로젝트를 구성해 주세요.</li>
<li>기능성: 버그 없이 기능이 정상적으로 동작해야 합니다.</li>
<li>코딩 스타일: 다른 사람이 읽기 쉽고, 디버그하기 쉽도록 Clean한 코딩 스타일을 유지해 주세요.</li>
</ul>
</div>
                </div>
              </div>
            </div>
          </div>
