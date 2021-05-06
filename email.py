import random

class RandomEmail():

    def get_random_emails():
        pool = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        random_numbers = []
        for index in range (0, 4):
            index = random.randint(0, len(pool)-1)
            random_numbers.append(pool[index])
            del pool[index]

        return random_numbers