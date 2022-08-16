# ios-baseball
숫자야구 프로젝트 저장소입니다. 

![야구게임순서도 drawio](https://user-images.githubusercontent.com/105549066/184303941-a0f84052-aa12-4906-b55a-25e300ee9845.png)

# STEP1
1. 변수생성 
- 컴퓨터가 제시할 임의의 정수 3개를 담아둘 변수
```answerNumberPc[]```
- 사용자가 제시할 임의의 정수 3개를 담아둘 변수
```answerNumberUser[]```
- 남은 시도횟수를 담아둘 변수 (초기값 9)
```chanceNumber```
2. 함수생성
- 1~9 사이의 세 개의 임의의 정수 생성 후 반환하는 함수 (컴퓨터가 생성한 임의의 정수)
```pcRandom()```

- 1~9 사이의 세 개의 임의의 정수 생성 후 반환하는 함수 (사용자가 생성한 임의의 정수)
```userRandom()```

- 컴퓨터와 사용자가 생성한 임의의 정수를 비교하여 볼과 스트라이크 결과를 반환하는 함수
```comparisonStrikBall()```


