# Finn은 요즘 수학공부에 빠져 있습니다. 수학 공부를 하던 Finn은 자연수 n을 연속한 자연수들로 표현 하는 방법이 여러개라는 사실을 알게 되었습니다. 예를들어 15는 다음과 같이 4가지로 표현 할 수 있습니다.

# 1 + 2 + 3 + 4 + 5 = 15
# 4 + 5 + 6 = 15
# 7 + 8 = 15
# 15 = 15
# 자연수 n이 매개변수로 주어질 때, 연속된 자연수들로 n을 표현하는 방법의 수를 return하는 solution를 완성해주세요.

# 제한사항
# n은 10,000 이하의 자연수 입니다.

def solution(n):
    # 결과저장 변수 초기화
    answer = 0
    
    # 1부터 n까지의 모든 수에 대해 반복
    for start in range(1, n + 1):
        
        # 연속된 숫자들의 합 저장할 변수
        sum = 0
        
        # start부터 시작해서 연속된 숫자들을 더함
        for num in range(start, n + 1):
            
            sum += num
            
            # 합이 n과 같으면 answer 증가
            if sum == n:
                answer += 1
                break
            # 합이 n을 초과하면 진행할 필요 없음
            elif sum > n:
                break
    
    # 결과 반환
    return answer
