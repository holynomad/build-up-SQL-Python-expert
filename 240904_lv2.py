# 키워드 : split, map, list, min, max

def solution(s):
    # 문자열을 공백으로 분리하고 각 숫자를 정수로 변환
    numbers = list(map(int, s.split()))
    
    # 최소값과 최대값 찾기
    min_num = min(numbers)
    max_num = max(numbers)
    
    # 결과 문자열 생성
    answer = f"{min_num} {max_num}"
    
    return answer
