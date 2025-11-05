import numpy as np
import pandas as pd
import sys

def generate_database(no_of_rows=1000):

  db = {'person':[], 'country': [], 'salary': [], 'age': [], 'sex': []}

  db['person'] = list(range(no_of_rows))
  db['country'] = list(np.random.choice(['US', 'UK', 'IN', 'FR', 'DE'], size=no_of_rows))
  for i in range(1000):
      if db['country'][i] in ['US', 'UK', 'FR', 'DE']:
          db['sex'].append(np.random.choice(['M', 'F'], p=[0.40, 0.60]))
      else:
          db['sex'].append(np.random.choice(['M', 'F'], p=[0.55, 0.45]))
  for i in range(1000):
      if db['country'][i] == 'US':
          if db['sex'][i] == 'M':
              db['salary'].append(np.random.randint(8000, 16000))
          else:
              db['salary'].append(np.random.randint(2000, 7000))
      elif db['country'][i] == 'UK':
          if db['sex'][i] == 'M':
              db['salary'].append(np.random.randint(6000, 13000))
          else:
              db['salary'].append(np.random.randint(6000, 11000))
      elif db['country'][i] == 'IN':
          if db['sex'][i] == 'M':
              db['salary'].append(np.random.randint(600, 1300))
          else:
              db['salary'].append(np.random.randint(100, 200))
      elif db['country'][i] == 'FR':
          if db['sex'][i] == 'M':
              db['salary'].append(np.random.randint(2100, 6000))
          else:
              db['salary'].append(np.random.randint(2200, 6300))
      else:
          if db['sex'][i] == 'M':
              db['salary'].append(np.random.randint(2500, 6600))
          else:
              db['salary'].append(np.random.randint(2800, 6900))
  for i in range(1000):
      if db['salary'][i] < np.random.randint(3000, 4500):
          db['age'].append(np.random.randint(22, 35))
      else:
          db['age'].append(np.random.randint(35, 65))
  df = pd.DataFrame(db)
  return df

if __name__ == "__main__":
  no_of_rows = int(sys.argv[1])
  df = generate_database(no_of_rows=no_of_rows)
  print(df.head())