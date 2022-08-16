# ios-baseball
Swift를 사용한 숫자야구 게임 프로그램입니다.

#
- #### <span class="index">[FlowChart](#flowchart-1)</span> 
- #### <span class="index">[STEP 1](#step-1-1)</span>
- #### <span class="index">[STEP 2](#step-2-1)</span>
- #### <span class="index">[구현 화면](#구현-화면-1)</span>

<br><br><br>
# FlowChart

<img alt="스크린샷 2022-08-14 오후 7 03 56" src="https://user-images.githubusercontent.com/84975077/184532027-ffa4be4e-6598-4891-8ac9-47561ca31bcb.png">


<br><br><br>
# STEP 1
 ### 기본 기능 구현
 - 중복 되지 않는 3개의 정수를 만드는 `makeRandomNumbers` 함수 구현
 - 게임을 시작하는 `startGame` 함수 구현

<br><br><br>
# STEP 2
 ### 사용자 입력 구현
- 사용자 메뉴를 입력 받는 `showMenu` 함수 구현
- 3개의 정수를 입력 받는 `getUserNumbers` 함수 구현
- 사용자의 입력 수가 입력 범위와 일치하는 지 확인하는 `isNumbersRangeCorrect`, `isDuplicatedNumbers` 함수 구현
- 스트라이크와 볼을 확인 하는 `checkStrikeOrBall` 함수 구현
- 게임이 끝나는 상황인지 확인하는 `isGameEnd` 함수 구현

<br><br><br>
# 구현 화면
 
## 1. 사용자 메뉴 화면
<img width="421" alt="스크린샷 2022-08-14 오후 7 27 26" src="https://user-images.githubusercontent.com/84975077/184532800-819fb10e-79d0-4e72-a076-e76ac9d69943.png">

#### 게임 시작 게임 종료를 입력 받는 화면입니다.

## 2. 사용자 입력 화면
<img width="426" alt="스크린샷 2022-08-14 오후 7 27 37" src="https://user-images.githubusercontent.com/84975077/184532802-39dd611c-6673-43a1-9858-6783ee7d0d68.png">

#### 사용자의 숫자를 입력 받는 화면입니다.

## 3. 게임 구현 화면
<img width="414" alt="스크린샷 2022-08-14 오후 7 28 49" src="https://user-images.githubusercontent.com/84975077/184532804-23a9d87a-be0e-44e1-a4a8-dfc754bc87c5.png">

#### 숫자 야구 게임 구현 화면입니다.
