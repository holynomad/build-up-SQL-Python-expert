# 두 수의 최소공배수(Least Common Multiple)란 입력된 두 수의 배수 중 공통이 되는 가장 작은 숫자를 의미합니다. 
# 예를 들어 2와 7의 최소공배수는 14가 됩니다. 정의를 확장해서, n개의 수의 최소공배수는 n 개의 수들의 배수 중 공통이 되는 가장 작은 숫자가 됩니다. 
# n개의 숫자를 담은 배열 arr이 입력되었을 때 이 수들의 최소공배수를 반환하는 함수, solution을 완성해 주세요.

# 제한 사항
# arr은 길이 1이상, 15이하인 배열입니다.
# arr의 원소는 100 이하인 자연수입니다.

# pseudo code

# 1. function GCD(a, b)
# // 최대공약수

#2. function LCM(a, b)
# // 최소공배수 using GCD

#3. function solution(arr)
#   - Initialize result as arr[0]
#   - for i from 1 to length of arr
#       - result ← LCM(result, arr[i])  // 현재까지의 LCM과 arr[i]의 LCM을 계산
#   - return result  // n개의 수에 대한 최소공배수 반환


def GCD(a, b):
    
    while b != 0:
        temp = b
        b = a % b
        a = temp
    
    return a

def LCM(a, b):
    
    return (a * b) // GCD(a, b)

def solution(arr):
    
    result = arr[0]
    
    for i in range(1, len(arr)):
        result = LCM(result, arr[i])
    
    return result



