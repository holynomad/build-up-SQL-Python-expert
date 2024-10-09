# Leo는 카펫을 사러 갔다가 아래 그림과 같이 중앙에는 노란색으로 칠해져 있고 테두리 1줄은 갈색으로 칠해져 있는 격자 모양 카펫을 봤습니다.

# Leo는 집으로 돌아와서 아까 본 카펫의 노란색과 갈색으로 색칠된 격자의 개수는 기억했지만, 전체 카펫의 크기는 기억하지 못했습니다.

# Leo가 본 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return 하도록 solution 함수를 작성해주세요.

# 제한사항
# 갈색 격자의 수 brown은 8 이상 5,000 이하인 자연수입니다.
# 노란색 격자의 수 yellow는 1 이상 2,000,000 이하인 자연수입니다.
# 카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.

# 출처 : http://hsin.hr/coci/archive/2010_2011/contest4_tasks.pdf

def solution(brown, yellow):
    total = brown + yellow  # 전체 격자의 개수는 brown 개수와 yellow 개수의 합

    # 세로 h 값을 1부터 total의 제곱근까지 반복
    for h in range(1, int(total**0.5) + 1):
        if total % h == 0:  # h가 total의 약수일 때
            w = total // h  # 가로 w는 total을 h로 나눈 값
            
            # 갈색 테두리를 제외한 노란색 부분의 크기 확인
            if (w - 2) * (h - 2) == yellow:  # (w-2) * (h-2)가 yellow 개수와 같으면 정답
                return [w, h] 




