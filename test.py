num1 = 12
key = True

if num1 == 12:
    if key:
        print('Num1 is equal to twelve, and they have the key!')
    else:
        print('Num1 is equal to twelve, and they do not have the key')
elif num1 < 12:
    print('Num1 is less than twelve!')
else:
    print('Num1 is not equal to twelve!')



mySentence =  'loves the following books:'

book_list = ['The Lord of the Rings', 'The Door Within', 'The Ranger\'s Apprentice', 'The Binding of the Blade']

def bookFunction(name):
    lst = []
    for i in book_list:
        msg = "{0} {1} {2}".format(name, mySentence, i)
        lst.append(msg)
    return lst

def get_name():
    name = input('What is your name? ')
    lst = bookFunction(name)
    for i in lst:
        print(i)

get_name()