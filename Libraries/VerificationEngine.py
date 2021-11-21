def calculate_decimal_digits(N):
    if N < 10:
        return [N]
    else:
        x = int(N / 10)
        y  = N - (10*x)
        decimal_digits = calculate_decimal_digits(x)
        decimal_digits.append(y)
        return decimal_digits

def generate_weights_from_right_to_left(number_of_decimal_digits):
    weights = []
    for i in range(0, number_of_decimal_digits):
        which = i % 3
        if which == 0:
            weights.append(7)
        if which == 1:
            weights.append(3)
        if which == 2:
            weights.append(1)
    return weights

def calculate_following_number_ending_in_zero(N):
    result = N
    while True:
        decimal_digits = calculate_decimal_digits(result)
        decimal_digits.reverse()
        if decimal_digits[0] == 0:
            break
        result+=1
    return result

def calculate_finnish_reference_number_check_digit(decimal_digits):
    weights_from_right_to_left = generate_weights_from_right_to_left(len(decimal_digits))
    print(weights_from_right_to_left)
    products_arrived = list(map(lambda x, y : x * y, decimal_digits, weights_from_right_to_left))
    print(products_arrived)
    products_arrived_added_together = sum(products_arrived)
    print(products_arrived_added_together)
    following_number_ending_in_zero = calculate_following_number_ending_in_zero(products_arrived_added_together)
    print(following_number_ending_in_zero)
    return following_number_ending_in_zero - products_arrived_added_together

def generate_finnish_reference_number(basic_part):
    # basic_part should be int
    basic_part = int(basic_part)
    decimal_digits = calculate_decimal_digits(basic_part)
    decimal_digits.reverse()
    print(decimal_digits)
    finnish_reference_number_check_digit = calculate_finnish_reference_number_check_digit(decimal_digits)
    print(finnish_reference_number_check_digit)
    finnish_reference_number = [finnish_reference_number_check_digit] + decimal_digits
    finnish_reference_number.reverse()
    finnish_reference_number = [str(x) for x in finnish_reference_number]
    finnish_reference_number = ''.join(finnish_reference_number)
    return finnish_reference_number

def generate_international_reference_number(finnish_reference_number):
    # finnish_reference_number is a string: e.g. 121312952
    finnish_reference_number = int(finnish_reference_number)
    finnish_reference_number_decimal_digits = calculate_decimal_digits(finnish_reference_number)  # e.g. [1, 2, 1, 3, 1, 2, 9, 5, 2]
    print(finnish_reference_number_decimal_digits)
    # append 271500 as digits to the end of the reference number
    decimal_digits_plus_27500 = finnish_reference_number_decimal_digits.copy()
    decimal_digits_plus_27500.reverse()         # e.g. [2, 5, 9, 2, 1, 3, 1, 2, 1]
    decimal_digits_plus_27500.insert(0, 2)
    decimal_digits_plus_27500.insert(0, 7)
    decimal_digits_plus_27500.insert(0, 1)
    decimal_digits_plus_27500.insert(0, 5)
    decimal_digits_plus_27500.insert(0, 0)
    decimal_digits_plus_27500.insert(0, 0)
    decimal_digits_plus_27500.reverse()
    decimal_digits_plus_27500 = [str(x) for x in decimal_digits_plus_27500]
    decimal_digits_plus_27500 = int(''.join(decimal_digits_plus_27500))
    print(decimal_digits_plus_27500)
    amendment = decimal_digits_plus_27500 % 97   # e.g. 121312952271500 % 97 = 67
    print(amendment)
    amendment_two_digits = calculate_decimal_digits(98 - amendment)      # e.g. 98 - 67 = 31
    print(amendment_two_digits)
    international_reference_number = amendment_two_digits + finnish_reference_number_decimal_digits
    international_reference_number = [str(x) for x in international_reference_number]
    international_reference_number = ''.join(international_reference_number)
    international_reference_number = 'RF' + international_reference_number
    print(international_reference_number)  # e.g. 'RF31121312952'
    return international_reference_number


