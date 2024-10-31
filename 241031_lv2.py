# 경화는 과수원에서 귤을 수확했습니다. 경화는 수확한 귤 중 'k'개를 골라 상자 하나에 담아 판매하려고 합니다. 
# 그런데 수확한 귤의 크기가 일정하지 않아 보기에 좋지 않다고 생각한 경화는 귤을 크기별로 분류했을 때 서로 다른 종류의 수를 최소화하고 싶습니다.

# 예를 들어, 경화가 수확한 귤 8개의 크기가 [1, 3, 2, 5, 4, 5, 2, 3] 이라고 합시다. 
# 경화가 귤 6개를 판매하고 싶다면, 크기가 1, 4인 귤을 제외한 여섯 개의 귤을 상자에 담으면, 귤의 크기의 종류가 2, 3, 5로 총 3가지가 되며 이때가 서로 다른 종류가 최소일 때입니다.

# 경화가 한 상자에 담으려는 귤의 개수 k와 귤의 크기를 담은 배열 tangerine이 매개변수로 주어집니다. 
# 경화가 귤 k개를 고를 때 크기가 서로 다른 종류의 수의 최솟값을 return 하도록 solution 함수를 작성해주세요.

def solution(k, tangerine):
    # 크기별 개수를 저장할 딕셔너리
    size_count = {}
    
    # 각 크기별 귤의 개수 세기
    for size in tangerine:
        if size in size_count:
            size_count[size] += 1
        else:
            size_count[size] = 1
    
    # 개수 리스트 만들기
    counts = list(size_count.values())
    
    # 버블 정렬로 개수 내림차순 정렬
    n = len(counts)
    for i in range(n):
        for j in range(0, n-i-1):
            if counts[j] < counts[j+1]:
                counts[j], counts[j+1] = counts[j+1], counts[j]
    
    selected_types = 0  # 선택된 크기의 종류 수
    total_selected = 0  # 선택된 귤의 총 개수
    
    # k개를 채울 때까지 가장 많은 개수의 크기부터 선택
    for count in counts:
        selected_types += 1
        total_selected += count
        if total_selected >= k:
            break
            
    return selected_types

# 테스트
test_cases = [
    (6, [1, 3, 2, 5, 4, 5, 2, 3]),  # 예제 케이스
    (4, [1, 3, 2, 5, 4, 5, 2, 3]),  # 변형된 케이스
    (2, [1, 1, 1, 1, 2, 2, 2, 3]),  # 동일한 크기가 많은 케이스
]

for k, tangerine in test_cases:
    result = solution(k, tangerine)
    print(f"k={k}, tangerine={tangerine}")
    print(f"결과: {result}\n")
