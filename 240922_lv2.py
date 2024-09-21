# JadenCase란 모든 단어의 첫 문자가 대문자이고, 그 외의 알파벳은 소문자인 문자열입니다. 
# 단, 첫 문자가 알파벳이 아닐 때에는 이어지는 알파벳은 소문자로 쓰면 됩니다. (첫 번째 입출력 예 참고)
# 문자열 s가 주어졌을 때, s를 JadenCase로 바꾼 문자열을 리턴하는 함수, solution을 완성해주세요.

# 제한 조건
# s는 길이 1 이상 200 이하인 문자열입니다.
# s는 알파벳과 숫자, 공백문자(" ")로 이루어져 있습니다.
# 숫자는 단어의 첫 문자로만 나옵니다.
# 숫자로만 이루어진 단어는 없습니다.
# 공백문자가 연속해서 나올 수 있습니다.

def solution(s):
    # 주어진 문자열 s를 공백(' ')을 기준으로 분리하여 단어 리스트 생성
    words = s.split(' ')  

    # 결과를 저장할 빈 리스트
    jaden_case_words = [] 
    
    # 각 단어에 대해 JadenCase로 변환
    for word in words:
        if len(word) > 0:  # 만약 단어가 빈 문자열이 아니면
            # 첫 글자는 대문자로 변환, 나머지는 소문자로 변환
            refixing_word = word[0].upper() + word[1:].lower()
        else:
            # 빈 문자열은 그대로
            refixing_word = word
        
        # 변환된 단어를 리스트에 추가
        jaden_case_words.append(refixing_word)
    
    # 변환된 단어들을 다시 공백(' ')을 기준으로 이어붙여서 하나의 문자열로 반환
    return ' '.join(jaden_case_words)
