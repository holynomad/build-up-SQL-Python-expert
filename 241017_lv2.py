# 1부터 n까지 번호가 붙어있는 n명의 사람이 영어 끝말잇기를 하고 있습니다. 영어 끝말잇기는 다음과 같은 규칙으로 진행됩니다.

# 1번부터 번호 순서대로 한 사람씩 차례대로 단어를 말합니다.
# 마지막 사람이 단어를 말한 다음에는 다시 1번부터 시작합니다.
# 앞사람이 말한 단어의 마지막 문자로 시작하는 단어를 말해야 합니다.
# 이전에 등장했던 단어는 사용할 수 없습니다.
# 한 글자인 단어는 인정되지 않습니다.
# 다음은 3명이 끝말잇기를 하는 상황을 나타냅니다.

# tank → kick → know → wheel → land → dream → mother → robot → tank

# 위 끝말잇기는 다음과 같이 진행됩니다.

# 1번 사람이 자신의 첫 번째 차례에 tank를 말합니다.
# 2번 사람이 자신의 첫 번째 차례에 kick을 말합니다.
# 3번 사람이 자신의 첫 번째 차례에 know를 말합니다.
# 1번 사람이 자신의 두 번째 차례에 wheel을 말합니다.
# (계속 진행)
# 끝말잇기를 계속 진행해 나가다 보면, 3번 사람이 자신의 세 번째 차례에 말한 tank 라는 단어는 이전에 등장했던 단어이므로 탈락하게 됩니다.

# 사람의 수 n과 사람들이 순서대로 말한 단어 words 가 매개변수로 주어질 때, 가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지를 구해서 return 하도록 solution 함수를 완성해주세요.

# 제한 사항
# 끝말잇기에 참여하는 사람의 수 n은 2 이상 10 이하의 자연수입니다.
# words는 끝말잇기에 사용한 단어들이 순서대로 들어있는 배열이며, 길이는 n 이상 100 이하입니다.
# 단어의 길이는 2 이상 50 이하입니다.
# 모든 단어는 알파벳 소문자로만 이루어져 있습니다.
# 끝말잇기에 사용되는 단어의 뜻(의미)은 신경 쓰지 않으셔도 됩니다.
# 정답은 [ 번호, 차례 ] 형태로 return 해주세요.
# 만약 주어진 단어들로 탈락자가 생기지 않는다면, [0, 0]을 return 해주세요.

def solution(n, words):
    used_words = set()  # 이미 사용한 단어를 저장하는 집합
    last_char = None    # 이전 단어의 마지막 글자

    for i in range(len(words)):
        current_word = words[i]
        current_person = (i % n) + 1  # 몇 번째 사람이 말하는지
        current_turn = (i // n) + 1   # 그 사람이 몇 번째 차례인지

        # 이전에 사용한 단어인지 확인
        if current_word in used_words:
            return [current_person, current_turn]
        
        # 첫 번째 단어가 아니고, 규칙 위반 (이전 단어의 끝 글자와 현재 단어의 첫 글자가 일치하지 않음)
        if last_char is not None and current_word[0] != last_char:
            return [current_person, current_turn]

        # 사용한 단어 집합에 현재 단어 추가
        used_words.add(current_word)

        # 다음 단어와의 비교를 위해 마지막 글자 저장
        last_char = current_word[-1]

    # 규칙을 모두 지킨 경우 [0, 0] 반환
    return [0, 0]
