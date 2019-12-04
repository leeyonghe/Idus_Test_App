# Idus_Test_App

STEP 1. 프로젝트 요구사항 <br> <br>

기능 요구 사항 <br>
상품 목록과 상품 상세 화면으로 구성된 앱을 만드세요. <br>
다음과 같은 기능을 가져야 합니다. <br> <br>

상품 목록 <br>
스크롤에 따라 자동 로드 되어야합니다. (20개씩) <br>
상품을 터치하면 해당 상품의 detail view로 전환됩니다. <br>
상품 상세 화면 <br>
뷰전환시 자연스러운 애니메이션을 적용하세요. <br>
닫기 버튼을 터치시 상품 목록으로 전환됩니다. <br>
상품 이미지를 스와이핑 하여 다음이미지를 볼 수 있습니다. (인디케이터 포함) <br>
각 화면은 다음과 같은 구성 요소를 가지고 있습니다. <br> <br>

- Index view <br>
    |- 헤더 + 아이콘 <br>
    |- 리스트 아이템 <br>
        |- 정사각형 썸네일 <br>
        |- 상품명 <br>
        |- 셀러명 <br>
- Detail view <br>
    |- 닫기 버튼 <br>
    |- 제품 이미지 (다수) <br>
    |- 셀러명 <br>
    |- 제품명 <br>
    |- 가격 <br>
        |- 할인률 <br>
        |- 판매가 <br>
        |- 정가 <br>
    |- 구매하기 버튼 (동작하지 않음) <br> <br>
디자인 요구 사항 <br>
상세 동작은 여기의 프로토 타입에서 확인하실 수 있습니다. <br>
[상품 목록]에서 [상품 상세]로의 전환시 애니메이션이 적용되어야 하며, 제공한 프로토타입의 2행2열 상품(Triple Hearthorn Earring)을 클릭하면 확인할 수 있습니다. <br>
디자인 가이드는 제플린으로 제공되며 여기를 참고하세요. <br>
ID: prgms_public <br>
PW: programmers <br>
필요한 아이콘은 여기에서 다운로드 받으실 수 있습니다. <br>
API <br>
BASE URL <br>
https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/ <br> <br>

BASE URL 뒤에 원하는 리소스를 붙혀 사용합니다. <br> <br>

ex) {BASE URL}/products?page=10 <br> <br>

Products API - Get 메소드 <br>
상품 목록을 조회 할 수 있는 기능 <br> <br>

GET /products -> 상품 목록을 반환합니다. (50개 단위 페이징) <br> <br>

GET /products?page={페이지 번호} -> 페이지 번호에 해당되는 상품 목록을 반환합니다.  <br>
Request Header 구조 <br>
GET /products <br>
Content-Type: application/json <br>
1. 페이징 기능 <br>
QueryParameter (선택) <br>
Parameter	Type	Description <br>
page	Integer	페이지 번호 <br>
요청 예시 - cURL <br>
1. curl -G https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products -H "Content-Type: application/json" <br> <br>

curl -G https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products?page=10 -H "Content-Type: application/json" <br> <br>

2. 웹 브라우저에서 테스트 <br>
https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products?page=10 <br>
Response Body 예시 <br>
{ <br>
  "statusCode": 200, <br>
  "body": [ <br>
    { <br>
      "id": 1, <br>
      "thumbnail_520": "https://image.idus.com/image/files/4e47e2fa54e84fedbe56b610475adf0c_520.jpg", <br>
      "title": "겨울에 아삭한여름복숭아먹기", <br>
      "seller": "골든팜" <br>
    }, <br>
    .... <br>
    .... <br>
} <br>
Response Body 설명 <br>
Column	Type	Description <br>
id	Integer	상품 코드 <br>
thumbnail_520	String	썸네일 이미지 (520 size) <br>
title	String	게시글 제목 <br>
seller	String	게시글 작성자 <br>
2. 상세 정보 조회 기능 <br>
PathParameters (선택) <br>
Parameter	Type	Description <br>
id	Integer	상품 코드 <br>
요청 예시 - cURL <br>
1. curl -G https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products/250 -H "Content-Type: application/json" <br> <br>

2. 웹 브라우저에서 테스트 <br>
https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products/250 <br>
Response Body 예시 <br>
{ <br>
  "statusCode": 200, <br>
  "body": [ <br>
    { <br>
      "id": 250, <br>
      "thumbnail_720": "https://image.idus.com/image/files/0b9ca2fae287417b95c87fe59e01f31b_720.jpg", <br>
      "thumbnail_list_320": "https://image.idus.com/image/files/0b9ca2fae287417b95c87fe59e01f31b_320.jpg#https://image.idus.com/image/files/fa2e0876ad6b4f468eb11f7e1a16adda_320.jpg .....", <br>
      "title": "[밀호밀] 원 스트랩 백 S사이즈", <br>
      "seller": "milhomil", <br>
      "cost": "20,000원", <br>
      "discount_cost": null, <br>
      "discount_rate": null, <br>
      "description": "\n\n[밀호밀] 원 스트랩 백\n\nmaterial : 코튼 100％\n\ncolor : 베이지, 블랙, 네이비, 카멜\n\n✔️ 내부에 포켓이 생겼습니다😉\n ....." <br>
    } <br>
  ] <br>
} <br>
Response Body 설명 <br>
Column	Type	Description <br>
id	Integer	상품 코드 <br>
thumbnail_720	String	썸네일 이미지 (720 size) <br>
thumbnaillist320	String	썸네일 이미지 (320 size) -> 각 이미지는 #으로 구분되어있음 <br>
title	String	게시글 제목 <br>
seller	String	게시글 작성자 <br>
cost	String	상품 원가 <br>
discount_cost	String	상품 할인가 <br>
discount_rate	String	상품 할인율 <br>
description	String	상품 설명 <br>
Response Status Code <br>
Status Code	Description <br>
200 OK	성공 <br>
400 Bad Request	클라이언트 요청 오류 - 요청 변수가 Integer 타입이 아닐 때 <br>
404 NotFound	조회한 데이터가 비어있을 때, URL 경로, HTTP method 오류로 페이지를 찾을 수 없을 때 <br>
500 Internal Server Error	서버에 문제가 있을 경우 <br>
전반적인 구현과 관련한 요청 사항 <br>
테스트 코드를 작성하는 경우 가산점이 있습니다. <br>
프로젝트 구조 및 성능: 사용하는 프레임워크의 Best practice를 활용해서 프로젝트를 구성해 주세요. <br>
기능성: 버그 없이 기능이 정상적으로 동작해야 합니다. <br>
코딩 스타일: 다른 사람이 읽기 쉽고, 디버그하기 쉽도록 Clean한 코딩 스타일을 유지해 주세요. <br>
